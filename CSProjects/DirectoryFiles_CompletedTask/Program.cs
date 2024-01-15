using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Net.WebRequestMethods;

namespace DirectoryFiles_CompletedTask
{
    internal class Program
    {
        static void Main(string[] args)
        {
            DirectoryInfo infoPlace = new DirectoryInfo("C:\\Users\\Yasi\\Desktop\\all");

            FileInfo[] filesList = infoPlace.GetFiles();

            Console.ForegroundColor = ConsoleColor.Green;

            foreach (FileInfo i in filesList)
            {
                Console.WriteLine("File Name: {0}\n" +
                    "File Length: {1} KB \n" +
                    "File Extension: {2}\n",
                    i.Name,
                    i.Length / 1024,
                    i.Extension);
                System.Threading.Thread.Sleep(1000);
            }

            var sortedFiles = from file in filesList orderby file.Length select file;

            Console.ForegroundColor = ConsoleColor.DarkCyan;

            foreach (FileInfo file in sortedFiles)
            {
                Console.WriteLine($"{file.Name} Size:{file.Length / 1024} KB ");
                System.Threading.Thread.Sleep(1000);
            }


            var countedNames = filesList
                          .Where(file => file.Extension == ".sql")
                          .Select(file => file.Name);

            var countedNumbers = countedNames.Count();

            Console.ForegroundColor = ConsoleColor.Magenta;

            Console.WriteLine($"The count of files: {countedNumbers}");
            foreach (var item in countedNames)
            {
                Console.WriteLine($"The counted items are: {item}");
            }

            var files = new DirectoryInfo(@"C:\Users\Yasi\Desktop\gitFile")
                            .GetFiles().Where(x => (x.Attributes & FileAttributes.Hidden) == 0);


            foreach (var f in files)
            {
                Console.WriteLine($"The Hidden items:{f.FullName}");
            }

            Console.ReadKey();

            #region Solution1_Count
            //int countExtension = countedFiles.Count();
            //var countExtension = filesList.Count(n => n.Extension.ToLower() == ".sql".ToLower());
            //Console.WriteLine($"Number of files with extension {".sql"}: {countExtension}");
            //foreach (var fileName in countedFiles)
            //{
            //    Console.WriteLine(fileName);
            //} 
            #endregion


            #region Solution1_Hidden
            //DirectoryInfo directory = new DirectoryInfo(@"C:\Users\Yasi\Desktop\gitFile");
            //FileInfo[] HiddenFiles = directory.GetFiles();

            //var filtered = HiddenFiles.Where(f => !f.Attributes.HasFlag(FileAttributes.Hidden)); 
            #endregion


            #region SimplerOne
            //DirectoryInfo infoPlace = new DirectoryInfo("C:\\Program Files\\Windows Defender");

            //FileInfo[] filesList = infoPlace.GetFiles();

            //Console.ForegroundColor = ConsoleColor.Green;
            //foreach (FileInfo i in filesList)
            //{
            //    Console.WriteLine("File Name: {0}\n" +
            //        "File Length: {1}\n" +
            //        "File Extension: {2}\n",
            //        i.Name,
            //        i.Length,
            //        i.Extension);
            //    System.Threading.Thread.Sleep(1000);
            //}
            //Console.ReadKey(); 
            #endregion

        }
    }
}
