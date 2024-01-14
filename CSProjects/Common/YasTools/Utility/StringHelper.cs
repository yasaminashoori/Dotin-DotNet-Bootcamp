using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace YasTools.Utility
{
    /// <summary>
    /// /// برای متدهای سودمند رشته‌ها
    /// </summary>
    public static class StringHelper
    {
        public static bool IsNUllOrEmptyZero(string str)
        {
            return (string.IsNullOrEmpty(str)) || (str.Equals("0")  || (str.Length == 0));
        }

        public static string ToPascalCase(string str)
        {
            // soroUSH ==> Soroush

            if (IsNUllOrEmptyZero(str))
                return str;

            str = str.ToLower();

            // return +

            return string.Concat(str.Substring(0, 1).ToUpper(), str.Substring(1));

        }


    }

}
