using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSProjects_Part02
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Split with multiple separators:");
            // Split with multiple separators
            string multiCharString = "Mahesh..Chand, Henry\n He\t, Chris-Love, Raj..Beniwal, Praveen-Kumar";
            // Split authors separated by a comma followed by space
            string[] multiArray = multiCharString.Split(new Char[] { ' ', ',', '.', '-', '\n', '\t' });
            foreach (string author in multiArray)
            {
                if (author.Trim() != "")
                    Console.WriteLine(author);
            }

            Console.WriteLine("Split String delimited by another string: ");

            string stringString = "Mahesh Chand, Neel Chand Beniwal, Raj Beniwal, Dinesh Beniwal";
            // String separator
            string[] stringSeparators = new string[] { "Beniwal, ", "Chand, " };
            string[] firstNames = stringString.Split(stringSeparators, StringSplitOptions.None);
            foreach (string firstName in firstNames)
                Console.WriteLine(firstName);


            Console.ReadKey(); 
        }
    }
}
