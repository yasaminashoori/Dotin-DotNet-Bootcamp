using System;
using System.Collections.Generic;
using System.Globalization;
using CSProjects_Part01.Classes;

namespace CSProjects_Part01
{
    internal class Program
    {
        #region EnumClasses
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
        #endregion

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

            // returns: 1/1/0001 12:00:00 AM
            Console.WriteLine(alan);

            // returns: 1/1/0001 12:00:00 AM
            Console.WriteLine(alan.ToString());

            alan = DateTime.Now;

            Console.WriteLine(alan.ToLongDateString());

            // returns: 1362/11/11
            DateTime myBirthdate = new DateTime(1984, 01, 31);

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

            //byte age3 = byte.Parse(Console.ReadLine());

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

            age = 1234; // or age;
            bool isConvertedCorrectly = int.TryParse(Console.ReadLine(), out age);

            // inline declaration: int age2 and out age2 => out int age 2
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

            // shortcut for writing automated: switch (2 tab) + madrak + arrow key 
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

            #region Part5
            // for 

            //  int i = 100;

            for (int i = 0; i <= 10; i++)
                Console.WriteLine(i);

            for (int i = 0; i < 10; i++)
            {
                Console.WriteLine(i);
                Console.WriteLine("----");
            }


            Console.Clear();

            //  Console.ResetColor();


            int j = 0;

            for (j = 0; j < 10; j++)
            {
                // Do Something.....
            }
            Console.WriteLine("j = " + j);


            for (int i = 0; i <= 10; i++) ;
            //Console.WriteLine(i);


            int k = 0;
            for (k = 0; k <= 10; k++) ;
            Console.WriteLine("k = " + k);
            Console.WriteLine(DateTime.Now.ToLongDateString());

            Console.Clear();


            //for (int i = 0; i < 10; i--)
            //{
            //    System.Threading.Thread.Sleep(100);
            //    Console.WriteLine(DateTime.Now.ToLongTimeString());
            //}


            //  for (;;){}

            //  for (int i = 0; ; i++) { Console.WriteLine(i); }

            // for (int i = 0; ;) { Console.WriteLine(i); }


            Console.ReadKey();
            #endregion

            #region Part6

            #region [ for - ASCII Code ]

            for (int i = 1; i <= 57; i++)
            {
                Console.WriteLine($"Code = {i}\tChar = {(char)i}");
            }

            for (int i = 65; i <= 122; i++)
            {
                Console.WriteLine($"Code = {i}\tChar = {(char)i}");
            }


            #endregion

            //Console.Clear();

            #region [ While - DoWhile ]
            int j2 = 0;
            while (j2 <= 10)
            {
                Console.WriteLine($"J = {j2}");
                // j++;
                j2 += 2;
            }


            //-----------------------

            int k2 = 20;
            do
            {
                Console.WriteLine($"K = {k2}");

            } while (k2 <= 10);
            #endregion

            //Console.Clear();

            #region [ Classic Array ]
            // Array آرایه ها 

            // Fixed Size
            // Reference Type
            // 0 based index



            int[] numbers = new int[3];

            numbers[0] = 100;
            numbers[1] = 200;
            numbers[2] = 300;


            Console.WriteLine(numbers);


            for (int i = 0; i < numbers.Length; i++)
            {
                // محتوای خونه آی ام 
                //Console.WriteLine(numbers[i]);

                Console.WriteLine($"{i + 1} : {numbers[i]}"); // OK

                //Console.WriteLine($"{i++} : {numbers[i]}"); // ERROR

            }

            Console.ForegroundColor = ConsoleColor.Green;

            foreach (int item in numbers) // should be converted
            {
                Console.WriteLine(item);
            }

            Console.ForegroundColor = ConsoleColor.Red;


            foreach (var item in numbers) // for all of the types
            {
                Console.Write("The items are: ");
                Console.WriteLine(item);
            }
            #endregion

            Console.ReadKey();
            #endregion

            #region Part7

            // the numbers amy be the same 
            Random rand1 = new Random();
            int random = rand1.Next();
            Console.WriteLine(random);

            random = rand1.Next(100);
            Console.WriteLine(random);

            random = rand1.Next(200, 300);
            Console.WriteLine(random);

            Console.ForegroundColor = ConsoleColor.Green;

            var rand2 = new Random();
            Console.WriteLine(rand2.Next());
            Console.WriteLine(rand2.Next());
            Console.WriteLine(rand2.Next());
            Console.WriteLine(rand2.Next());

            //System.Threading.Thread.Sleep(100);

            Console.WriteLine(rand2.Next());
            Console.WriteLine(rand2.Next());
            Console.WriteLine(rand2.Next());
            Console.WriteLine(rand2.Next());

            Console.ForegroundColor = ConsoleColor.Red;

            Console.WriteLine(new Random(1234).Next());

            //--------------------------------------

            Console.ForegroundColor = ConsoleColor.Green;

            Guid myRandom = new Guid();
            myRandom = Guid.NewGuid();

            Console.WriteLine(myRandom);

            Console.WriteLine(Guid.NewGuid());
            Console.WriteLine(Guid.NewGuid());
            Console.WriteLine(Guid.NewGuid());
            Console.WriteLine(Guid.NewGuid());
            Console.WriteLine(Guid.NewGuid());
            Console.WriteLine(Guid.NewGuid());

            Console.WriteLine(myRandom.ToString().Replace('-', '@')); //char
            Console.WriteLine(myRandom.ToString().Replace("-", "STRING")); //string
            Console.WriteLine(myRandom.ToString().Replace("-", "").Substring(10, 10));


            if (myRandom == Guid.Empty)
            {

            }

            Console.WriteLine(Guid.Empty);

            Console.ReadKey();
            #endregion

            #region Part8
            #region [ 1 ]
            Random rand = new Random();
            int computerRandom = rand.Next(100);

            while (true)
            {
                Console.ResetColor();
                Console.Write("Plz Enter Your Guess !! : ");
                int userGuess = int.Parse(Console.ReadLine());

                if (userGuess == computerRandom)
                {
                    Console.ForegroundColor = ConsoleColor.Green;
                    Console.WriteLine("OK :-) You are Right !! ");
                    break;
                }

                else if (computerRandom < userGuess)
                {

                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.WriteLine(" Your Number Should be lower ... !  ");

                }
                else
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.WriteLine(" Your Number Should be greater ... !  ");
                }
            }

            Console.WriteLine("Good Job ! Bye Bye :-)");
            #endregion

            #region [ 2 ]
            //Random rand = new Random();
            //int computerRandom = rand.Next(100);

            //Boolean isContinue = true;

            //while (isContinue)
            //{
            //    Console.ResetColor();
            //    Console.Write("Plz Enter Your Guess !! : ");
            //    int userGuess = int.Parse(Console.ReadLine());

            //    if (userGuess == computerRandom)
            //    {
            //        Console.ForegroundColor = ConsoleColor.Green;
            //        Console.WriteLine("OK :-) You are Right !! ");
            //        isContinue = false;
            //        continue;
            //    }

            //    else if (computerRandom < userGuess)
            //    {

            //        Console.ForegroundColor = ConsoleColor.Red;
            //        Console.WriteLine(" Your Number Should be lower ... !  ");

            //    }
            //    else
            //    {
            //        Console.ForegroundColor = ConsoleColor.Red;
            //        Console.WriteLine(" Your Number Should be greater ... !  ");
            //    }
            //}

            //Console.WriteLine("Good Job ! Bye Bye :-) :-)"); 
            #endregion
            #endregion

            #region Part9
            #region [ 1 ]
            //int[] numbers = new int[] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };

            //int sum = 0; //حتمن مقدار اولیه 0 میخواهد
            //float average = 0;

            //for (int i = 0; i < numbers.Length; i++)
            //{
            //    sum += numbers[i];// sum = sum + numbers[i];
            //}

            //// 5/2 = 2 !!!!!!!!!!!!!!!!!!!!!!!!
            ////  average = sum / numbers.Length; //تقسیم بصورت عدد صحیح


            ////5/2 = 2.5 :-)
            //average = (float)sum / numbers.Length; // تقسیم بصورت عدد اعشاری

            ////-------------اشتباه---------
            //// average = (float)(sum / numbers.Length); // تقسیم بصورت عدد صحیح
            ////----------------------

            //// به صورت خیلی شفاف----------------------
            //float myFloatVersionOfSum = (float)sum;
            //average = myFloatVersionOfSum / numbers.Length;
            ////------------------------------------------

            //string myFormat = "The Sum of {0} Numbers = {1}\nThe Average of {0} Numbers = {2}";

            //Console.WriteLine(myFormat, numbers.Length, sum, average);
            #endregion

            #region [ 2 ]
            //int sum = 0;
            //float average = 0;
            //Console.WriteLine("You Should Enter 10 Numbers : ");

            //int[] numbers = new int[10];

            //for (int i = 0; i < 10; i++)
            //{
            //    Console.Write("Plz Enter Number {0} : ", i + 1);
            //    numbers[i] = int.Parse(Console.ReadLine());
            //}

            //for (int i = 0; i < numbers.Length; i++)
            //{
            //    sum += numbers[i];
            //}

            //average = (float)sum / numbers.Length;

            //string myFormat = "The Sum of {0} Numbers = {1}\nThe Average of {0} Numbers = {2}";

            //Console.WriteLine(myFormat, numbers.Length, sum, average);
            #endregion

            #region [ 3 ]
            const int SIZE = 10;
            int sum = 0;
            float average = 0;

            // SIZE = 4; //The left-hand side of an assignment must be a variable, property or indexer 
            // SIZE++; //The operand of an increment or decrement operator must be a variable, property or indexer   

            Console.WriteLine("You Should Enter {0} Numbers : ", SIZE);

            int[] numbers2 = new int[SIZE];

            for (int i = 0; i < SIZE; i++)
            {
                if (i == SIZE - 1)
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                }
                Console.Write("Plz Enter Number {0} : ", i + 1);
                numbers2[i] = int.Parse(Console.ReadLine());
            }

            Console.ForegroundColor = ConsoleColor.Green;

            for (int i = 0; i < SIZE; i++)
            {
                sum += numbers2[i];
            }

            average = (float)sum / SIZE;

            Console.WriteLine($"The Sum of {SIZE} Numbers = {sum}\nThe Average of {SIZE} Numbers = {average}");
            #endregion

            Console.ReadKey();
            #endregion

            #region Enum.Random,GUID_Practices
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
            #endregion

            #region Part10
            // METHOD 

            // BLACK BOX
            // DRY
            // RE USABILITY
            // TEAM WORK 
            // TEST 
            // یک کار انجام دهد درست انجام دهد و از اسم متد مشخص شود
            // ACTION ==> NAMING CONVENTION 
            // SINGLE RESPONSIBILITY 

            // IN , OUT (توصیه میکنم)
            // -  , OUT
            // IN , -
            // -  , - ==> به احتمال زیاد متغیر سراسری دارد


            // NAMING CONVENTION : PASCAL CASE 

            // تا اطلاع ثانوی
            // همه متد های ما در کلاس هایی از نوع استاتیک قرار میگیرند

            // کلاس استاتیک
            // محلی برای نگه داری متد های استاتیک و از یک خانواده

            // آیا یک متد میتواند بیشتر از یک مقدار خروجی داشته باشد؟


            Console.Write("Plz Enter Your Message : ");
            string input = Console.ReadLine();
            ShowMessage(input);

            // فراخوانی متد
            // صدا کردن متد
            // Call / Invoke
            CSProjects_Part01.Classes.Greeting.GreetingMessage();

            int javab = MathOperations.DoSum(12, 20);

            Console.WriteLine($"Sum = {javab}");

            float divide = MathOperations.DoDivide(12.3F, 12.9F); //should have F to be float or error!

            Console.WriteLine($"Divide:{divide}");

            Console.ReadKey();
            #endregion

            #region Part11

            // Value Type : stack , struct , non nullable, like char, float, double
            int aValue = 10;
            int bValue = aValue;

            aValue++;

            Console.WriteLine($"a = {aValue} b = {bValue}");

            // Reference Type : heap , class , nullable

            string s1 = "Soroush Sadr";
            string s2 = s1;

            s1 = "Session 11";

            // string immutable

            //StringBuilder sb = new StringBuilder();

            Console.WriteLine($"s1 = {s1} s2 = {s2}");


            Console.ReadKey();

            int[] numbers1 = new int[3];
            numbers1[0] = 10;
            numbers1[1] = 20;
            numbers1[2] = 30;

            // 
            int[] numbersCopy2 = numbers1;

            foreach (var item in numbersCopy2)
            {
                Console.WriteLine(item);
            }

            numbers1[1] = 2000;
            Console.ForegroundColor = ConsoleColor.Green;

            foreach (var item in numbersCopy2)
            {
                Console.WriteLine(item);
            }
            Console.ReadKey();

            //Console.Clear();

            int[] myArray = new int[3];
            myArray[0] = 10;
            myArray[1] = 20;
            myArray[2] = 30;

            // int[] result = MyClass.ChangeArray(myArray);
            CSProjects_Part01.Classes.ArrayCalculate.ChangeArray(myArray);

            foreach (var item in myArray)
            {
                Console.WriteLine(item);
            }

            Console.ReadKey();
            #endregion

            #region Part12
            a = 100;

            Classes.MethodCalls.DoSomething(a);

            Console.WriteLine($"after method value = {a}");

            Classes.MethodCalls.DoSomething(ref a);

            Console.WriteLine($"after method value = {a}");

            int myOutVar = 12345;
            Classes.MethodCalls.DoSomething2(out myOutVar);

            int x1, x2;
            // Console.WriteLine($"x1 = {x1} , x2 = {x2}");
            Classes.MethodCalls.DoSomething2(out x1, out x2);
            Console.WriteLine($"x1 = {x1} , x2 = {x2}");

            //--------------------------------------------------

            int[] array = new int[] { 1, 2, 34, 5, 67, 8, 9, 10 };

            Classes.MethodCalls.ShowArrayValues(array);

            Classes.MethodCalls.ShowNumbers(array);

            Classes.MethodCalls.ShowNumbers(1, 2, 3, 4, 5);

            Classes.MethodCalls.ShowNumbers(10, 20, 30, 40);

            Classes.MethodCalls.ShowNumbers(100, 200, 300);

            Classes.MethodCalls.ShowNumbers(100, 200);

            Classes.MethodCalls.ShowNumbers(100, 200, 300, 54, 54, 54, 543, 5, 435, 43, 5, 435, 435, 55);


            //----------------------------------------

            int res;
            int.TryParse("12234", out res);

            Console.ReadKey(); 
            #endregion

            #region Part13
            #region [ 2D ]

            int[,] my2DArray = new int[2, 3];

            int[,] my2DArray2 = new int[,] { { 1, 2 }, { 3, 4 }, { 5, 6 }, { 7, 8 } };

            int[,] my2DArray4 = new int[4, 3] { { 10, 20, 30 }, { 3, 4, 3 }, { 5, 6, 3 }, { 7, 8, 3 } };

            int[,] my2DArray3 = { { 1, 2, 3 }, { 4, 5, 6 } };

            #endregion

            #region [ jadvalZarb ]

            int[,] jadvalZarb = new int[10, 10];

            // به ازای هر بار اجرای حلقه بیرونی ، حلقه درونی کامل اجرا میشود

            for (int i = 0; i < 10; i++)
            {
                for (int j = 0; j < 10; j++)
                {
                    jadvalZarb[i, j] = (i + 1) * (j + 1); // 10 * 10 بار اجرا میشود
                }
            }

            #endregion

            #region [ 3D ]

            int[,,] my3DArray = new int[2, 3, 4]; // 24

            int length = my3DArray.Length; //24

            int total = 1;

            for (int i = 0; i < my3DArray.Rank; i++)
            {
                total *= my3DArray.GetLength(i); //24
                Console.WriteLine($"the Rank : {total}");
            }

            Console.WriteLine("{0} = {1}", length, total);


            int[,,,,] my5DArray = new int[2, 3, 4, 3, 2]; // 144


            //--------- Reset

            length = my5DArray.Length;
            total = 1;

            for (int i = 0; i < my5DArray.Rank; i++)
            {
                total *= my5DArray.GetLength(i); // 144
            }

            Console.WriteLine("{0} = {1}", length, total);



            #endregion


            #region [Jagged Arrays]

            // Array of Arrays !! Jagged Arrays !!

            int[][] myJaggedArray = new int[3][];

            myJaggedArray[0] = new int[4] { 1, 2, 3, 4 };
            myJaggedArray[1] = new int[3] { 1, 2, 3 };
            myJaggedArray[2] = new int[2] { 1, 2 };
            //  myJaggedArray[3] = new int[1] { 1 };




            int[][] myJaggedArray2 = new int[][]
            {
                new int[] {1,2,3,4,5},
                new int[] {1,2,3},
                new int[] {1,2}
            };

            //  myJaggedArray2[2][2] = 2222; // index out of renge


            int[][] myJaggedArray3 = new int[][]
           {
                //new string[] {"",""},
                new int[] {1,2,3},
                new int[] {1,2}
           };


            #endregion

            Console.ReadKey();
            #endregion

            #region Part14
            // Array arr = new Array(); // Dont Try !

            numbers = new int[] { 109, 221, 30, 4, 50, 6, 7, 8, 9, 10, 0, -1, -2, -3, -4, 20 };

            //// best practice for sorting

            //Array.Sort(numbers);

            //1-Console.WriteLine(Array.Sort(numbers));
            //2- var result = Array.Sort(numbers);
            //Console.WriteLine(result);
            //3- foreach (var item in numbers)
            //{
            //    Console.WriteLine(item);
            //}

            //Console.ForegroundColor = ConsoleColor.Green;

            //Array.Reverse(numbers);

            //foreach (var item in numbers)
            //{
            //    Console.WriteLine(item);
            //}


            //int[] result = Array.FindAll(numbers, n => n.CompareTo(20) > 0);

            //int[] result2 = Array.FindAll(numbers, x => x > 5);

            //int result3 = Array.Find(numbers, x => x > 5);


            //Console.ResetColor();

            //foreach (var item in result)
            //{
            //    Console.WriteLine(item);
            //}

            //ArrayList al = new ArrayList();
            //al.Add(123);
            //al.Add("123");
            //al.Add("123ABC");
            //al.Add("ABC123");
            //al.Add(12.3);
            //al.Add(12.3F);
            //al.Add(true);
            //al.Add('X');

            //System.Collections.ArrayList al = new ArrayList
            //{
            //    123,
            //    "123",
            //    "123ABC",
            //    "ABC123",
            //    12.3,
            //    12.3F,
            //    true,
            //    'X'
            //};

            //foreach (object item in al)
            //{
            //    Console.WriteLine(item);
            //}


            //foreach (var item in al)
            //{
            //    if (item.GetType() == typeof(string))
            //    {
            //        Console.WriteLine(item);
            //    }

            //    if (item.GetType() == typeof(int))
            //    {
            //        Console.WriteLine(item);
            //    }

            //    if (item.GetType() == typeof(bool))
            //    {
            //        Console.WriteLine(item);
            //    }
            //}


            //int[] myArray = new int[] { 200, 201, 202, 203, 204, 205 };

            //System.Collections.Generic.List<int> numbers = new List<int>();
            //numbers.Add(1);
            //numbers.Add(12);
            //numbers.Add(123);
            //numbers.Add(1234);
            //numbers.Add(12345);

            //numbers.AddRange(myArray);

            //numbers.Add(1000);

            //numbers.Insert(index: 0, item: 0);

            //numbers.RemoveAll(match: x => x > 0);

            //numbers.RemoveAt(index: 0);

            //numbers.Remove(item: 123);

            //numbers[6] = 666;

            //foreach (var item in numbers)
            //{
            //    Console.WriteLine(value: item);
            //}


            Console.ReadKey(); 
            #endregion

            #region Part15
            alan = DateTime.Now;

            Console.WriteLine(alan.ToString("yyyy-MM-dd"));
            Console.WriteLine(alan.ToString("yyyy-mm-dd")); // دقیقه


            List<string> names = new List<string>()
            {
                "AAA", "BBB","CCC","ABC","abc","abd","ABCD","CBA","ABCdE","ABCDEF G"
            };

            foreach (var item in names)
            {
                Console.WriteLine(item);
            }


            foreach (var item in names)
            {
                if (item.Contains("D"))
                {
                    Console.WriteLine(item);
                }

                if (item.ToUpper().Contains("D"))
                {
                    Console.WriteLine(item);
                }

                if (item.ToLower().Contains("d"))
                {
                    Console.WriteLine(item);
                }
            }


            var result = names.FindAll(n => n.ToUpper().StartsWith("A"));

            var result2 = names.FindAll(n => n.ToUpper().EndsWith("A"));

            var result3 = names.FindAll(n => n.Length > 3);

            var result4 = names.FindAll(n => n.Length > 3 && n.ToLower().Contains("e"));

            var result5 = names.FindAll(n => n.Length > 3 || n.ToLower().Contains("e"));

            var result6 = names.FindAll(n => n.Contains(" "));

            foreach (var item in result)
            {
                Console.WriteLine(item);
            }


            name = "Soroush Sadr";
            char[] arrayResult = name.ToCharArray();
            foreach (char item in arrayResult)
            {
                Console.WriteLine(item);
            }

            Console.ReadKey(); 
            #endregion
        }
        static void ShowMessage(string msg)
        {
            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine($"Your Name: {msg}");
        }
    }

}
