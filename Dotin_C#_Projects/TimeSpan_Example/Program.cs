using System;
using System.Threading;

namespace TimeSpan_Example
{
    internal class Program
    {
        /// <summary>
        /// تایمر معکوس (در ثانیه) با استفاده از TimeSpan
        /// </summary>
        static void Main(string[] args)
        {
            #region TimeCounterInSeconds(using TimeSpan)
            Console.ForegroundColor = ConsoleColor.Green;
            Console.Write("Enter the duration in seconds: ");
            if (int.TryParse(Console.ReadLine(), out int durationInSeconds) && durationInSeconds > 0)
            {
                TimeSpan duration = TimeSpan.FromSeconds(durationInSeconds);

                Console.WriteLine("Countdown started!");

                while (duration.TotalSeconds > 0)
                {
                    if (duration.TotalSeconds == 1)
                    {
                        Console.ForegroundColor = ConsoleColor.Red;
                    }

                    Console.WriteLine($"Time remaining: {duration.ToString(@"mm\:ss")}");
                    Thread.Sleep(1000);
                    duration = duration.Subtract(TimeSpan.FromSeconds(1));
                }

                Console.ForegroundColor = ConsoleColor.Green;
                Console.WriteLine("Countdown complete!");
            }
            else
            {
                Console.WriteLine("Invalid input. Please enter a positive integer for the duration.");
            }

            Console.ReadKey(); 
            #endregion
        }
    }
}
