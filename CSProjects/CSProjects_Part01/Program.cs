using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSProjects_Part01
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //System.Globalization.ThaiBuddhistCalendar
            DateTime alan = new DateTime();
            DateTime birthDate = new DateTime(1989, 8, 3);
            PersianCalendar pc = new PersianCalendar();
            var year = pc.GetYear(birthDate);
            var month = pc.GetMonth(birthDate);
            var day = pc.GetDayOfMonth(birthDate);
            Console.WriteLine($"{year}, {month}, {day}");
            Console.WriteLine(alan.ToLongDateString());
            alan = DateTime.Now;
            Console.WriteLine(alan);

            Console.ForegroundColor = ConsoleColor.Blue;

            Guid randomGUI = Guid.NewGuid();
            Console.WriteLine(randomGUI);
            Guid randomGUID2 = new Guid();
            randomGUID2 = Guid.NewGuid();
            Console.WriteLine(randomGUID2);




            Console.ReadKey();
        }
    }
}
