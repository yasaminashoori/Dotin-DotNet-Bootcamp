using SadrTools.Extension;
using System;

namespace Part01
{
    public class Program
    {
        
        static void Main(string[] args)
        {
            try
            {
                int number1 = 10;
                int number2 = 0;
                int result = DivideNumbers(number1, number2);
                Console.WriteLine($"Result: {result}");
            }
            catch (Exception ex)
            {
                try
                {    
                    @"C:\Users\Yasi\Desktop\Logs\".CreateLogFile();

                    ex.LogToFile(@"C:\Users\Yasi\Desktop\Logs\");

                    Console.WriteLine($"Error: {ex.Message}");

                    if (ex.InnerException != null)
                    {
                        Console.WriteLine($"Inner Exception: {ex.InnerException.Message}");
                    }
                }
                catch (Exception logException)
                {
                    Console.WriteLine($"Error while saving to file: {logException.Message}");
                }
            }
        }

        static int DivideNumbers(int dividend, int divisor)
        {
            try
            {
                return dividend / divisor;
            }
            catch (DivideByZeroException ex)
            {
                throw new ApplicationException("Error: Division by zero", ex);
            }
        }
    }
}



//public static int ParseStringToInt(string input)
//{
//    try
//    {
//        return int.Parse(input);
//    }
//    catch (FormatException ex)
//    {
//        ex.LogToFile(AppDomain.CurrentDomain.BaseDirectory);
//        throw new ApplicationException("Error: Format exception", ex);
//    }
//}

