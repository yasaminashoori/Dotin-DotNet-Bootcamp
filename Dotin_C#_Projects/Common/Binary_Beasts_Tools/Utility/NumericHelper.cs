using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Binary_Beasts_Tools.Utility
{
    internal class NumericHelper
    {
        public double CalculatePercentage(long value)
        {
            if (value < 0 || value > number)
            {
                throw new ArgumentOutOfRangeException(nameof(value), "Value must be between 0 and the specified number.");
            }

            return (double)value / number * 100;
        }

        public void DisplayPercentage(long value)
        {
            try
            {
                double percentage = CalculatePercentage(value);
                Console.WriteLine($"The percentage of {value} in {number} is: {percentage:F2}%");
            }
            catch (ArgumentOutOfRangeException ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}
