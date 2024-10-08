﻿using System;

namespace Binary_Beasts_Tools.Utility
{
    /// <summary>
    /// کلاسی برای متد های سودمند مرتبط با استرینگ ها
    /// </summary>
    public static class StringHelper
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static bool IsNullOrEmptyOrZero(string str)
        {
            //if ((str == null) || (str == "") || str.Length == 0 || str == "0")
            //    return true;
            //return false;

            // return (str == null) || (str == string.Empty) || str.Length == 0 || str == "0";

            //return (str is null) || (str == string.Empty) || str.Length == 0 || str == "0";

            return (str is null) || (str == string.Empty) || str.Length == 0 || str.Equals("0");
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static string ToPascalCase(string str)
        {
            // soroUSH ==> Soroush

            if(IsNullOrEmptyOrZero(str))
                return str;

            str = str.ToLower();

           // return +

          return  string.Concat(str.Substring(0, 1).ToUpper(), str.Substring(1));

        }
    
    
        /// <summary>
        /// 
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static string ToCamelCase(string str)
        {
            // Salam CHETORI ==> salamChetori
            // Salam_CHETORI ==> salamChetori

            //
           string[] parts = str.Split('-','=',',');

            throw new NotImplementedException();        
        }


        public static void GetData(string str)
        {
            // CSV 
            // ali,alavi,32,M;reza,rezaee,55,M;mona,monaee,54,F;

            // میانگین سن خانم ها
            // میانگین سن آقایون
        }

        // fn , ln ==> abbreviation 
        // soroush , sadr ==> S.S

        // fn , ln ==> welcome .............

        // fn , ln ==> if(morning) good morning , .....

        // percent
        // 

    }

}
