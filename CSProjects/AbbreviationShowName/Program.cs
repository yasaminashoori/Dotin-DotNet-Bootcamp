using System;
using System.Reflection.Emit;

namespace AbbreviationShowName
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Enter your firstname:");
            var firstName = Console.ReadLine();

            Console.Write("Enter your lastname:");
            var lastName = Console.ReadLine();

            ShowAbbreviationName(firstName, lastName);

            /*
             * string nowOnlineTime = DateTime.Now.ToString("HH:mm"); second way but not efficient
             * DateTime nowOnlineTime = new DateTime(); no need to define date time type in this way
             * DateTime nowTime = new DateTime(0, 0, 0, nowDate.Hour, nowDate.Minute, 0);
             */
            var nowDate = new DateTime();
            nowDate = DateTime.Now;
            int hour = nowDate.Hour;

            OnlineTimeMessage(nowDate, firstName, hour);

            Console.ReadKey();
        }
        static void ShowAbbreviationName(string firstName, string lastName)
        {
            string abbreviationName = "Welcome " + firstName[0].ToString().ToUpper() + "." + lastName[0].ToString().ToUpper();
            Console.WriteLine(abbreviationName);
        }

        static void OnlineTimeMessage(DateTime nowOnlineTime, string firstName, int hour)
        {
            if (hour < 12)
            {
                Console.WriteLine($"It's {hour} AM {firstName} Good Morning ;D ");
            }
            else if (hour >= 12 && hour < 18)
            {
                Console.WriteLine($"It's {hour} PM {firstName} Good Afternoon :D ");
            }

            else
            {
                Console.WriteLine($"It's {hour} PM {firstName} Good Night ^_^ ");
            }

        }

    }
}
