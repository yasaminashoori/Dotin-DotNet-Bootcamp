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
            var linq01 = from n in numbersList select n;
            foreach (var n in numbersList)
            {
                Console.WriteLine(linq01);
            }
            Console.ReadKey();
        }
    }
}
