
using Google.Cloud.AIPlatform.V1;
using Google.Api.Gax.Grpc;
using System.Text;
using Npgsql;

namespace GeminiCLI

{
    public static void Main(string[] args)
    {
        static async Task Main(string[] args)
        {
            string projectId = "temp-a3r4ux9v-wsky";
            string location = "us-central1";
            string publisher = "google";
            string modelName = "gemini-1.5-flash-001";
            //string modelName = "gemini-1.5-pro";

            string prompt = "Provide a summary of my visit.";

            // Create client
            var predictionServiceClient = new PredictionServiceClientBuilder
            {
                Endpoint = $"{location}-aiplatform.googleapis.com"
            }.Build();

            // Read a JSON file into a string
            string clientdata = string.Empty;// = File.ReadAllText("../../../client-3064655.json");

            //int patientId = 3064655;    // many similar shifts
            //int patientId = 3064656;    // very different shifts
            //int patientId = 3064657;    // no history of shifts
            //int patientId = 3064658;    // future visit scheduled
            int patientId = 3064660;    // has lunch task that's not complete, but schedule later on another shift
            //int patientId = 3064661;    // tardy

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
                                    new Part { Text = "Today is 2023-09-21 and I have just finished the shift assigned to me for today." },
                                    new Part { Text = "Create a summary of what happened on my shift including relevant information about how my activites relate to previous and future shifts if they exist." },
                                    new Part { Text = "My caregiver_id is 7023201" },
                                    new Part { Text = "Refer to the client as either Mr. or Mrs. preferring not to use their first name." },
                                    //new Part { Text = "Include any information to consider for future shifts, if any are scheduled, provided by me or another caregiver." },
                                    //new Part { Text = "Present the information in a conversational tone." },
                                    new Part { Text = "The voice of the response should be from me, the caregiver, to future caregivers and our case manager." },
                                    new Part { Text = "Summary should be formal, clear, and detailed.  Don't be chatty." },
                                    new Part { Text = "Data definition: Use column cci_scheduled_clock_in in the shifts table to determine when the shift is scheduled to start." },
                                    new Part { Text = "Data definition: Use column clock_in in the shifts table to determine when the caregiver actually started the shift." },
                                    new Part { Text = "Data definition: If the actual shift start is more than 10 minutes after scheduled shift start then the caregiver is late." },
                                    new Part { Text = "Data definition: Attached JSON contains the client's records that contain past, current, and future shifts and tasks done on those shifts." },
                                    new Part { Text = "Data definition: Patient and client are interchangable terms, but use the term client in the summary." },
                                    new Part { Text = "Data definition: Shifts and visits are the same thing." },
                                    new Part { Text = "Data definition: A shift can only be completed by the caregiver assigned to the shift." },
                                    new Part { Text = "Data definition: A client can have multiple shifts and each shift can have multiple tasks." },
                                    new Part { Text = "Data definition: Mapping for shift status: 10 = SCHEDULED, 30 = COMPLETE, 40 = NOT_COMPLETE, 50 = CANCELLED BY CLIENT, 60 = CANCELLED BY CAREGIVER, 70 = CANCELLED BY CAREGIVER." },
                                    new Part { Text = "Data definition: Mapping for task status: 1 = complete, 2 = incomplete, null = not started" },

                                    new Part { Text = clientdata},
                                    //new Part { FileData = new FileData { FileUri = "gs://ai-innovate-improve-docs/client-3064655.json", MimeType = "text/plain" } }
                                }
                            }
                        }
            };

            // Make the request, returning a streaming response
            using PredictionServiceClient.StreamGenerateContentStream response = predictionServiceClient.StreamGenerateContent(generateContentRequest);


    public static IHostBuilder CreateHostBuilder(string[] args)
    {
        string port = Environment.GetEnvironmentVariable("PORT") ?? "8080";
        string url = String.Concat("http://0.0.0.0:", port);

        return Host.CreateDefaultBuilder(args)
            .ConfigureWebHostDefaults(webBuilder =>
            {
                    webBuilder.UseStartup<Startup>().UseUrls(url);
            });
    }

}