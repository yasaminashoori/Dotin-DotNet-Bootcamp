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
    public class StringHelper
    {
        public static bool IsNUllOrEmptyZero(string str)
        {
            return (string.IsNullOrEmpty(str)) || (str.Equals("0")  || (str.Length == 0));
        }
    }

}
