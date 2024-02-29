using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Errors_For_Logs
{
    internal class Program
    {
        static void Main(string[] args)
        {
            try
            {
                // Error: Unreachable code
                Console.WriteLine("This code is never reached");
            }
            catch (Exception ex)
            {
                ex.LogToFile(AppDomain.CurrentDomain.BaseDirectory);
                Console.WriteLine($"Error: {ex.Message}");
            }
        }
    }
}
