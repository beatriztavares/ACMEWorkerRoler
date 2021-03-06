using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.Diagnostics;
using Microsoft.WindowsAzure.ServiceRuntime;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Queue;

namespace Coyote
{
    public class WorkerRole : RoleEntryPoint
    {
        private readonly CancellationTokenSource cancellationTokenSource = new CancellationTokenSource();
        private readonly ManualResetEvent runCompleteEvent = new ManualResetEvent(false);
        static CloudQueue papaleguasQueue, coyoteQueue;
        const string MessageText = "I'm Coyote!";

        public void Connect()
        {
            var connectionString = "DefaultEndpointsProtocol=https;AccountName=acmestaccount;AccountKey=R6kZQuPgEuT8WMmPMbJ4x/GraO+8DCt0h05i863BdTRqRUfUPWBKGRpATpKCuNpWVrvpKqswIxKWfO60x7X0TA==;EndpointSuffix=core.windows.net";

            CloudStorageAccount cloudStorageAccount;

            if (!CloudStorageAccount.TryParse(connectionString, out cloudStorageAccount))
            {
                Console.WriteLine("Expected connection string 'Azure Storage Account Demo Primary' to be a valid Azure Storage Connection String.");
            }

            var cloudQueueClient = cloudStorageAccount.CreateCloudQueueClient();
            papaleguasQueue = cloudQueueClient.GetQueueReference("papa-leguas");
            coyoteQueue = cloudQueueClient.GetQueueReference("coyote");

            // Note: Usually this statement can be executed once during application startup or maybe even never in the application.
            //       A queue in Azure Storage is often considered a persistent item which exists over a long time.
            //       Every time .CreateIfNotExists() is executed a storage transaction and a bit of latency for the call occurs.
            papaleguasQueue.CreateIfNotExists();
        }

        public void SendMessage()
        {
            var message = new CloudQueueMessage(MessageText);

            coyoteQueue.AddMessage(message);
        }

        public void GetMessage()
        {
            var cloudQueueMessage = papaleguasQueue.GetMessage();

            if (cloudQueueMessage == null)
            {
                return;
            }

            Console.WriteLine("Coyote readed: " + cloudQueueMessage.AsString);

            papaleguasQueue.DeleteMessage(cloudQueueMessage);
        }

        public override void Run()
        {
            Trace.TraceInformation("Coyote is running");

            try
            {
                this.RunAsync(this.cancellationTokenSource.Token).Wait();
            }
            catch (AggregateException e)
            {
                Trace.TraceError(e.StackTrace);
            }
            finally
            {
                this.runCompleteEvent.Set();
            }
        }

        public override bool OnStart()
        {
            // Set the maximum number of concurrent connections
            ServicePointManager.DefaultConnectionLimit = 12;

            // For information on handling configuration changes
            // see the MSDN topic at https://go.microsoft.com/fwlink/?LinkId=166357.

            bool result = base.OnStart();

            Connect();

            Trace.TraceInformation("Coyote has been started");

            return result;
        }

        public override void OnStop()
        {
            Trace.TraceInformation("Coyote is stopping");

            this.cancellationTokenSource.Cancel();
            this.runCompleteEvent.WaitOne();

            base.OnStop();

            Trace.TraceInformation("Coyote has stopped");
        }

        private async Task RunAsync(CancellationToken cancellationToken)
        {
            // TODO: Replace the following with your own logic.
            while (!cancellationToken.IsCancellationRequested)
            {
                Trace.TraceInformation("Working");
                SendMessage();
                GetMessage();
                await Task.Delay(2000);
            }
        }
    }
}
