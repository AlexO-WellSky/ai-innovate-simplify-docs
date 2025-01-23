using Google.Cloud.AIPlatform.V1;
using Google.Api.Gax.Grpc;
using System.Text;
using Npgsql;

namespace GeminiCLI
{
    class Program
    {
        static async Task Main(string[] args)
        {
            string projectId = "temp-a3r4ux9v-wsky";
            string location = "us-central1";
            string publisher = "google";
            //string modelName = "gemini-1.5-flash-001";
            string modelName = "gemini-1.5-pro";

            string prompt = "I just completed my shift.  Provide a summary";

            // Create client
            var predictionServiceClient = new PredictionServiceClientBuilder
            {
                Endpoint = $"{location}-aiplatform.googleapis.com"
            }.Build();

            // Read a JSON file into a string
            string clientdata = string.Empty;// = File.ReadAllText("../../../client-3064655.json");
            int patientId = 3064661;

            // Define the query
            var query = @"SELECT jsonb_build_object(" +
                "'clientdata', jsonb_build_object(" +
                "'clients', (SELECT json_agg(c) FROM clients c WHERE ID = @patientId)," +
                "'shifts', (SELECT json_agg(s) FROM shifts s   WHERE PATIENT_ID = @patientId)," +
                "'tasks', (SELECT json_agg(t) FROM tasks t     WHERE CARE_LOG_ID in (SELECT ID FROM shifts WHERE PATIENT_ID = @patientId))" +
                "    )) AS result;";

            // Pull client data
            using (var connection = new NpgsqlConnection("Host=localhost;Username=postgres;Password=postgres;Database=ai-innovate"))
            {
                connection.Open();
                using (var command = new NpgsqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("patientId", patientId);
                    var result = command.ExecuteScalar()?.ToString();
                    clientdata = result?.ToString() ?? string.Empty;
                }
            }

            // Initialize content request
            var generateContentRequest = new GenerateContentRequest
            {
                Model = $"projects/{projectId}/locations/{location}/publishers/{publisher}/models/{modelName}",
                GenerationConfig = new GenerationConfig
                {
                    Temperature = 0.4f,
                    TopP = 1,
                    TopK = 32,
                    MaxOutputTokens = 2048
                },
                Contents =
                        {
                            new Content
                            {
                                Role = "USER",
                                Parts =
                                {
                                    new Part { Text = prompt },
                                    new Part { Text = "Assume today is 2023-09-21 and I have just finished the shift for the day." },
                                    new Part { Text = "My caregiver_id is 7023201" },
                                    //new Part { Text = "A shift's date is determined by the shift_date field of shifts." },
                                    new Part { Text = "Use column cci_scheduled_clock_in in the shifts table to determine when the shift is scheduled to start." },
                                    new Part { Text = "Refer to the client as either Mr. or Mrs. preferring not to use their first name." },
                                    new Part { Text = "Use column clock_in in the shifts table to determine when the caregiver actually started the shift." },
                                    new Part { Text = "If the actual shift start is more than 10 minutes after scheduled shift start then the caregiver is late." },
                                    new Part { Text = "Create a summary of what happened on my shift.  Include any relevant information about how this relates to previous shifts." },
                                    new Part { Text = "Include any information to consider for future shifts, if any are scheduled, provided by me or another caregiver." },
                                    new Part { Text = "Present the information in a conversational tone." },
                                    new Part { Text = "The voice of the response should be from me, the caregiver, to be read by future caregivers as well as my manager." },
                                    new Part { Text = "Attached JSON contains the client's records that contain past, current, and future shifts and tasks done on those shifts." },
                                    new Part { Text = "Patient and client are interchangable terms, but use the term client in the summary." },
                                    new Part { Text = "Shifts and visits are the same thing." },
                                    new Part { Text = "A shift can only be completed by the caregiver assigned to the shift." },
                                    new Part { Text = "A patient can have multiple shifts and each shift can have multiple tasks." },
                                    new Part { Text = "Summary must be clear and concise.  Don't be chatty." },
                                    new Part { Text = "Mapping for shift status: 10 = SCHEDULED, 30 = COMPLETE, 40 = NOT_COMPLETE, 50 = CANCELLED BY CLIENT, 60 = CANCELLED BY CAREGIVER, 70 = CANCELLED BY CAREGIVER." },
                                    new Part { Text = "Mapping for task status: 1 = complete, 2 = incomplete, null = not started" },

                                    new Part { Text = clientdata},
                                    //new Part { FileData = new FileData { FileUri = "gs://ai-innovate-improve-docs/client-3064655.json", MimeType = "text/plain" } }
                                }
                            }
                        }
            };

            // Make the request, returning a streaming response
            using PredictionServiceClient.StreamGenerateContentStream response = predictionServiceClient.StreamGenerateContent(generateContentRequest);

            StringBuilder fullText = new();

            // Read streaming responses from server until complete
            AsyncResponseStream<GenerateContentResponse> responseStream = response.GetResponseStream();
            await foreach (GenerateContentResponse responseItem in responseStream)
            {
                fullText.Append(responseItem.Candidates[0].Content.Parts[0].Text);
            }

            Console.WriteLine(fullText.ToString());

            Console.ReadLine();
        }
    }
}