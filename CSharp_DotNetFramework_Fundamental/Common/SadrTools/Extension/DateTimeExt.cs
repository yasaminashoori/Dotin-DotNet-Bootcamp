using System.Globalization;
using System;

namespace SadrTools.Extension
{
    public static class DateTimeExt
    {
        /// <summary>
        /// تبدیل به تاریخ شمسی
        /// </summary>
        /// <param name="date">تاریخ میلادی</param>
        /// <param name="separator">جداکننده</param>
        /// <returns>تاریخ شمسی</returns>
        public static string ToPersianDate(this DateTime date, char separator = '-')
        {
            PersianCalendar pc = new PersianCalendar();
            return $"{pc.GetYear(date)}{separator}" +
                   $"{pc.GetMonth(date).ToString().PadLeft(2, '0')}{separator}" +
                   $"{pc.GetDayOfMonth(date).ToString().PadLeft(2, '0')}";

        }












        /// <summary>
        /// تبدیل به تاریخ شمسی با فرمت خاص
        /// </summary>
        /// <param name="date">تاریخ میلادی</param>
        /// <returns>تاریخ شمسی به فرمت 1400-08-14</returns>
        public static string ToDateFormat(this DateTime date)
        {
            PersianCalendar pc = new PersianCalendar();
            return $"{pc.GetYear(date)}-{pc.GetMonth(date).ToString().PadLeft(2, '0')}-{pc.GetDayOfMonth(date).ToString().PadLeft(2, '0')}";
        }
    }

   
}
