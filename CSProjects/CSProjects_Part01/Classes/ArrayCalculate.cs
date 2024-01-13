using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSProjects_Part01.Classes
{
    public class ArrayCalculate
    {

        //public static int[] ChangeArray(int[] array)
        //{
        //    for (int i = 0; i < array.Length; i++)
        //    {
        //        array[i] += 10000;
        //    }
        //    return array;
        //}

        public static void ChangeArray(int[] array)
        {
            for (int i = 0; i < array.Length; i++)
            {
                array[i] += 20000;
            }
        }
    }
}
