using System;
using System.Globalization;

namespace CSProjects_Part01
{
    internal class Program
    {
        //part2
        /// <summary>
        /// یک نوع داده ای جدید برای روز های هفته
        /// </summary>
        public enum RoozHayeHafte
        {
            Shanbe,
            YekShanbe,
            DoShanbe,
            SeShanbe,
            ChaharShanbe,
            PanjShanbe,
            Jome
        };

        public enum Season
        {
            Spring, //starts with 0 by default
            Summer,
            Fall,
            Winter
        };


        public enum RoozHayeHafte2 : byte
        {
            شنبه,
            یکشنبه,
            دوشنبه = 200,
            سه_شنبه,
            چهارشنبه,
            پنج_شنبه,
            جمعه
        };


        /// <summary>
        /// انواع مدارک تحصیلی
        /// </summary>
        public enum EducationType
        {
            Diplom,
            FogheDiplom,
            Lisans = 1000,
            FogheLisans,
            PhD = 1003
        }

        static void Main(string[] args)
        {
         
            #region Part1
            Console.WriteLine("Hello World");
            int a;
            int b = 0;
            //a++; 
            #endregion

            #region Part2
            // Simple   : int , char , float , double , string , ....
            // Complex  : DateTime 

            // DataType varibleName = value ; 
            // DataType varibleName = new DataType() ;


            int age0 = 10;

            int seasonType = (int)Season.Winter;

            Console.WriteLine(seasonType);

            RoozHayeHafte emrooz = RoozHayeHafte.ChaharShanbe;

            Console.WriteLine(emrooz); //CharShanbe

            RoozHayeHafte2 rooz = RoozHayeHafte2.پنج_شنبه;

            int fogheLisansNumber = (int)EducationType.FogheLisans; //print number

            Console.WriteLine(fogheLisansNumber); // 1001

            DateTime alan = new DateTime();

            Console.WriteLine(alan); // 1/1/0001 12:00:00 AM

            Console.WriteLine(alan.ToString()); // 1/1/0001 12:00:00 AM

            alan = DateTime.Now;

            Console.WriteLine(alan.ToLongDateString());

            DateTime myBirthdate = new DateTime(1984, 01, 31); // 1362/11/11

            PersianCalendar pc = new PersianCalendar();

            int year = pc.GetYear(myBirthdate);
            int month = pc.GetMonth(myBirthdate);
            int day = pc.GetDayOfMonth(myBirthdate);

            Console.WriteLine("{0}/{1}/{2}", year, month, day);

            Console.ForegroundColor = ConsoleColor.Green;

            Console.WriteLine($"{year}/{month}/{day}"); 
            #endregion

            #region Part3
            Console.Write("Plz Enter Your Name : ");
            string name = Console.ReadLine();

            Console.Write("Plz Enter Your Family : ");
            string family = Console.ReadLine();

            Console.Write("Plz Enter Your Age : ");

            // Parse is a Method
            // Convert is a Class

            // Parse ( string to .....)
            // Convert.Method (.... to .... )

            int age = int.Parse(Console.ReadLine());

            //int age2 = Convert.ToSingle()

            byte age3 = byte.Parse(Console.ReadLine());

            long mylong = 123456;

            string tmp = Console.ReadLine();
            int age4 = int.Parse(tmp);

            float ff = float.Parse(Console.ReadLine());

            double dd = double.Parse(Console.ReadLine());

            Console.ForegroundColor = ConsoleColor.Green;

            Console.WriteLine($"Your Name = {name}\nYour Family = {family}\nYour Age = {age}");
            #endregion

            #region Part4

            Console.Write("Plz Enter Your Age : ");
            //int.TryParse(Console.ReadLine(), out age);
            //Console.WriteLine($"Age = {age}");

            age = 1234;
            bool isConvertedCorrectly = int.TryParse(Console.ReadLine(), out age);

            bool isConvertedCorrectly2 = int.TryParse(Console.ReadLine(), out int age2);


            if (isConvertedCorrectly == true)
            {

            }

            if (isConvertedCorrectly)
            {

            }

            if (isConvertedCorrectly2 == false)
            {

            }

            if (!isConvertedCorrectly)
            {

            }



            if (isConvertedCorrectly)
            {
                Console.ForegroundColor = ConsoleColor.Green;
                Console.WriteLine($"Age = {age}");
            }
            else
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine($"Age = {age}");
            }


            if (isConvertedCorrectly)
                Console.ForegroundColor = ConsoleColor.Green;
            else
                Console.ForegroundColor = ConsoleColor.Red;


            int alaki = 123;


            Console.ForegroundColor = isConvertedCorrectly ? ConsoleColor.Green : ConsoleColor.Red;

            Console.ForegroundColor = !isConvertedCorrectly ? ConsoleColor.Red : ConsoleColor.Green;


            int c = isConvertedCorrectly ? 100 : alaki > 100 ? 1000 : 2000;


            Console.WriteLine($"Age = {age}");

            Console.ResetColor();

            Console.WriteLine("..... Continue ...........");


            switch (age)
            {
                case 10:
                    Console.WriteLine("your age is 10 ");
                    break;

                case 20:
                    Console.WriteLine("your age is 20 ");
                    break;

                case 30:
                    Console.WriteLine("your age is 30 ");
                    break;

                case 40:
                case 50:
                case 60:
                    Console.WriteLine("your age is 40-60 ");
                    break;

                default:
                    Console.WriteLine("....");
                    break;
            }

            EducationType madrak = EducationType.FogheLisans;

            switch (madrak)
            {
                case EducationType.Diplom:
                    break;

                case EducationType.FogheDiplom:
                    break;
            }

            switch (madrak)
            {
                case EducationType.Diplom:
                    break;
                case EducationType.FogheDiplom:
                    break;
                case EducationType.Lisans:
                    break;
                case EducationType.FogheLisans:
                    break;
                case EducationType.PhD:
                    break;
                default:
                    break;
            }

            double myGrade = 18.54;

            switch (myGrade)
            {

                default:
                    break;
            }

            bool? isSingle = null;
            int? myAge = null;

            #endregion

            //System.Globalization.ThaiBuddhistCalendar
            DateTime alan2 = new DateTime();
            DateTime birthDate2 = new DateTime(1989, 8, 3);
            PersianCalendar pc2 = new PersianCalendar();
            var year2 = pc2.GetYear(birthDate2);
            var month2 = pc2.GetMonth(birthDate2);
            var day2 = pc2.GetDayOfMonth(birthDate2);
            Console.WriteLine($"{year2}, {month2}, {day2}");
            Console.WriteLine(alan2.ToLongDateString());
            alan2 = DateTime.Now;
            Console.WriteLine(alan2);

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
