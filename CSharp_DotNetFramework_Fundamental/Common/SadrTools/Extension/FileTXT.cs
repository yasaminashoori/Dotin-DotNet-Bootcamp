using System;
using System.IO;

namespace SadrTools.Extension
{
    public static class FileTXT
    {
        public static void CreateLogFile(this string str)
        {
            string fixedFilePath = @"C:\Users\Yasi\Desktop\Logs\";

            DateTime currentDateTime = DateTime.Now;

            string fileName = Path.Combine(fixedFilePath, currentDateTime.ToPersianDate());

            try
            {
                if (!File.Exists(fileName))
                {
                    using (StreamWriter sw = File.CreateText(fileName))
                    {
                        sw.WriteLine($"Log file created on {DateTime.Now}");
                    }
                    Console.WriteLine($"Log file created: {fileName}");
                }
                else
                {
                    Console.WriteLine($"Log file for today already exists: {fileName}");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
            }
        }

        public static void LogToFile(this Exception ex, string logFolderPath)
        {
            string fileName = Path.Combine(logFolderPath, DateTime.Now.ToPersianDate() + ".txt");

            try
            {
                if (!File.Exists(fileName))
                {
                    using (StreamWriter sw = File.CreateText(fileName))
                    {
                        sw.WriteLine($"Log file created on {DateTime.Now}");
                    }
                }

                using (StreamWriter sw = File.AppendText(fileName))
                {
                    sw.WriteLine($"[{DateTime.Now}] {ex.Message}");

                    if (ex.InnerException != null)
                    {
                        string innerExceptionMessage = ex.InnerException.Message ?? "Inner exception message is null";
                        sw.WriteLine($"Inner Exception: {innerExceptionMessage}");
                    }
                }
            }
            catch (Exception logException)
            {
                Console.WriteLine($"Error while saving to file: {logException.Message}");
            }
        }
    }
}
