using System;
using System.Collections;
using System.Text;

namespace CSProjects_Part04
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string s = "Hello";

            // Because string implements IEnumerable, we can call GetEnumerator():
            IEnumerator rator = s.GetEnumerator();

            while (rator.MoveNext())
            {
                char c = (char)rator.Current;
                Console.Write(c + ".");
            }

            Console.WriteLine();

            // Equivalent to:
            foreach (char c in s)
                Console.Write(c + ".");

            string[] daysOfWeek = {
                                      "Monday",
                                      "Tuesday",
                                      "Wednesday",
                                      "Thursday",
                                      "Friday",
                                      "Saturday",
                                      "Sunday"
                                  };

            // foreach is fine for this
            foreach (string day in daysOfWeek)
            {
                Console.WriteLine(day);
            }

            // this is best done using for, not foreach
            for (int i = 0; i < 3; i++)
            {
                Console.WriteLine(daysOfWeek[i]);
            }

            foreach (string item in daysOfWeek)
            {
                // اگر بخوای فقط 3 روز اول را نمایش دهید باید مثلن از یک متغیر شمارنده استفاده کنید
            }


            // this is best done using for, not foreach
            var sb = new StringBuilder();

            for (int i = 0; i < daysOfWeek.Length; i++)
            {
                sb.Append(daysOfWeek[i]);

                if (i < daysOfWeek.Length - 2)
                    sb.Append(", ");

                else if (i == daysOfWeek.Length - 2)
                    sb.Append(" and ");
            }

            Console.WriteLine(sb.ToString());


            Console.ReadKey();
        }
    }
}
