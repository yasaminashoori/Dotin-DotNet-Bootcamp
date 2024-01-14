using Models.User;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EndPoint
{
    internal class Program
    {
        static void Main(string[] args)
        {
            var userOne = new User()
            {
                FirstName = "Maede",
                LastName = "Zohrabi",
                BirthDate = new DateTime(2001, 5, 15)
            };

            var userTwo = new User()
            {
                FirstName = "Yasamin",
                LastName = "Ashoori",
                BirthDate = new DateTime(2001, 4, 10)
            };

            Console.ForegroundColor = ConsoleColor.Magenta; 

            Console.WriteLine(userOne);
            Console.WriteLine(userTwo);
            TimeSpan ageDifference = userOne.UserCompareTime(userTwo);
            Console.WriteLine($"{ageDifference.Days} Days.");

            Console.ReadKey();  
        }
    }
}
