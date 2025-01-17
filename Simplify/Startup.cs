// Copyright 2019 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
using Google.Cloud.AIPlatform.V1;
using Google.Api.Gax.Grpc;
using System.Text;
using Microsoft.AspNetCore.Identity;

public class Startup
{
 // Replace with your project ID, location, model name, and the path to your key file
    private static string projectId = "temp-a3r4ux9v-wsky";
    private static string location = "us-central1";
    private static string publisher = "google";
    private static string modelName = "gemini-1.5-flash-001";

    public void ConfigureServices(IServiceCollection services)
    {
    }

    public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
    {
        app.UseRouting();

        app.UseEndpoints(endpoints =>
        {
            endpoints.MapGet("/", async context =>
            {
                await context.Response.WriteAsync("hello, world");
            });

            endpoints.MapGet("/context", async context =>
            {
                AddContext();
                await context.Response.WriteAsync("Context added");
            });

            endpoints.MapPost("/generate", async context =>
            {
                string prompt = await new StreamReader(context.Request.Body).ReadToEndAsync();
                string summary = await GenerateSummary(prompt);
                await context.Response.WriteAsync(summary);
            });
        });
    }

    // Create client
    /// <summary>
    /// Initializes a new instance of the <see cref="PredictionServiceClient"/> class using the specified endpoint.
    /// </summary>
    /// <remarks>
    /// The <see cref="PredictionServiceClient"/> is built using the <see cref="PredictionServiceClientBuilder"/> 
    /// with the endpoint formatted as "{location}-aiplatform.googleapis.com".
    /// </remarks>
    readonly PredictionServiceClient predictionServiceClient = new PredictionServiceClientBuilder
    {
        Endpoint = $"{location}-aiplatform.googleapis.com"
    }.Build();

    // Initialize content request
    async void AddContext(){ 
        var contextRequest = new GenerateContentRequest
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
                        new Part { Text = "Notes on data - Below are the clients records that contain past shifts and activities done on those shifts." },
                        new Part { Text = "Patient and client are interchangable terms." },
                        new Part { Text = "Shifts and visits are the same thing." },
                        new Part { Text = "A patient can have multiple shifts and each shift can have multiple tasks." },
                        new Part { Text = "The most recent shift is the one that has been completed today." },
                        new Part { FileData = new FileData { FileUri = "gs://ai-innovate-improve-docs/client-3064655.json", MimeType = "text/plain" } }
                    }
                }
            }
        };
        PredictionServiceClient.StreamGenerateContentStream response = predictionServiceClient.StreamGenerateContent(contextRequest);
        StringBuilder fullText = new();
        
        AsyncResponseStream<GenerateContentResponse> responseStream = response.GetResponseStream();
        await foreach (GenerateContentResponse responseItem in responseStream)
        {
            fullText.Append(responseItem.Candidates[0].Content.Parts[0].Text);
        }
    }
        
    // Read streaming responses from server until complete
    async Task<string> GenerateSummary(string prompt){
        var promptRequest = new GenerateContentRequest
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
                        new Part { Text = "Notes on data - Below are the clients records that contain past shifts and activities done on those shifts." },
                        new Part { Text = "Patient and client are interchangable terms." },
                        new Part { Text = "Shifts and visits are the same thing." },
                        new Part { Text = "A patient can have multiple shifts and each shift can have multiple tasks." },
                        new Part { Text = "The most recent shift is the one that has been completed today." },
                        new Part { FileData = new FileData { FileUri = "gs://ai-innovate-improve-docs/client-3064655.json", MimeType = "text/plain" } }
                    }
                },
                new Content
                {
                    Role = "USER",
                    Parts = { new Part { Text = prompt } }
                }
            }
        };
        PredictionServiceClient.StreamGenerateContentStream response = predictionServiceClient.StreamGenerateContent(promptRequest);

        StringBuilder fullText = new();
        AsyncResponseStream<GenerateContentResponse> responseStream = response.GetResponseStream();
        await foreach (GenerateContentResponse responseItem in responseStream)
        {
            fullText.Append(responseItem.Candidates[0].Content.Parts[0].Text);
        }

        return fullText.ToString();
    }
}
