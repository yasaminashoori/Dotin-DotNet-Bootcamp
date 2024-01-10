using System;
using System.Globalization;

namespace YasTools.Utility
{
    public static class DateHelper
    { 
        public static string PersianDate(DateTime date, char separator= '/')
        {

        PersianCalendar pc = new PersianCalendar();
        return $"{pc.GetYear(date)}{separator}" +
                $"{pc.GetMonth(date).ToString().PadLeft(2, '0')}" +
                $"/{pc.GetDayOfMonth(date).ToString().PadLeft(2, '0')}";

        }

    }

}
