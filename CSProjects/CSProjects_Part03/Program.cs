using System;
using System.Collections.Generic;
using System.Linq;

namespace CSProjects_Part03
{
    internal class Program
    {
        static void Main(string[] args)
        {
            var numbersList = new int[] { 0, 1, 432, 32, 42, 5, 4, 7, 25, 92, 532, 354, 73342343, 7653, 76767, 4532, 125 };

            var linq01 = from n in numbersList
                         where n > 99 && n < 1000
                         select n;

            var linq02 = from n in numbersList
                         where n.ToString().Length == 3
                         select n;

            var linq03 = from n in numbersList
                         where n.ToString().Substring(0, 1) == "4"
                         select n;

            var linq04 = from n in numbersList
                         where n.ToString().StartsWith("4")
                         select n;

            var linq05 = from n in numbersList
                         where n.ToString().EndsWith("4")
                         select n;

            var linq06 = from n in numbersList
                         where n.ToString().Contains("4")
                         select n;

            //Not starts with 4 nor ends with 4 just contains 4 


            foreach (var n in numbersList)
            {
                Console.WriteLine(linq01);
            }
            Console.ReadKey();
        }
    }
}
