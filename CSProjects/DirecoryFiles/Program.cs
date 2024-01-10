using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Net.WebRequestMethods;

namespace DirecoryFiles
{
    internal class Program
    {
        static void Main(string[] args)
        {
            DirectoryInfo infoPlace = new DirectoryInfo("C:\\Program Files\\Windows Defender");

            FileInfo[] filesList = infoPlace.GetFiles();

            Console.ForegroundColor = ConsoleColor.Green;
            foreach (FileInfo i in filesList)
            {
                Console.WriteLine("File Name: {0}\n" +
                    "File Length: {1}\n" +
                    "File Extension: {2}\n",
                    i.Name,
                    i.Length,
                    i.Extension);
                System.Threading.Thread.Sleep(1000);    
            }

            Console.ReadKey();
        }
    }
}
