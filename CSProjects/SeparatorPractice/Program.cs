using System;
using System.Linq;

namespace SeparatorPractice
{
    internal class Program
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name=""></param>
        static void Main(string[] args)
        {
            var names = "ali,alavi,32,M;reza,rezaee,55,M;mona,monaee,54,F";

            char[] separators = { ';' };

            string[] finalSplit = names.Split(separators, StringSplitOptions.RemoveEmptyEntries);

            for (var item = 0; item < finalSplit.Length; item++)
            {
                Console.WriteLine($"Person {item + 1} Infos: {finalSplit[item]}");
            }

            var result = finalSplit.ToList();

            var genderFemale = result.Find(n => n.Contains("F"));
            var genderMale = result.Find(n => n.ToUpper().Contains("M"));

            var maleAge1 = int.Parse(result[0].Split(',')[2]);
            var maleAge2 = int.Parse(result[1].Split(',')[2]);

            var femaleAge3 = int.Parse(result[2].Split(',')[2]);

            var aveFemale = femaleAge3.ToString();
            var aveMale = ((maleAge1 + maleAge2) / 2).ToString();

            var male1 = result[0].Split(',')[0];
            var male2 = result[1].Split(',')[0];
            var female3 = result[2].Split(',')[0];

            Console.WriteLine($"The average age of females for {female3}: {aveFemale}\n" +
                $"The average age for males {male1}, {male2}: {aveMale}");

            Console.ReadKey();
        }
    }
}


#region Solution2-Incomplete
//public static string SeperatorCalculation(string[] nameListNew)
//{
//    return "";
//    var listName = nameListNew.ToList();

//    var GenderFemale = listName.FindAll(n => n.ToUpper().Contains("F"));

//    var GenderMale = listName.FindAll(n => n.ToUpper().Contains("M"));
//}

//    #region Solution1
//    var names = "ali,alavi,32,M;reza,rezaee,55,M;mona,monaee,54,F";

//    char[] separators = { ',', ';' };

//    string[] finalSplit = names.Split(separators, StringSplitOptions.RemoveEmptyEntries);

//            for (var item = 0; item<finalSplit.Length; item++)
//            {
//                Console.WriteLine($"The item {item + 1}: {finalSplit[item]}");
//            }

//var result = finalSplit.ToList();

//var maleInfo = result.Where(n => n.Contains("M")).ToList();
//var femaleInfo = result.Where(n => n.Contains("F")).ToList();

//if (femaleInfo.Count > 0)
//{
//    var aveFemale = GetAverageAge(femaleInfo);
//    Console.WriteLine($"The average age of females for {GetName(femaleInfo)}: {aveFemale}");
//}

//if (maleInfo.Count > 0)
//{
//    var aveMale = GetAverageAge(maleInfo);
//    Console.WriteLine($"The average age for males {GetName(maleInfo)} is {aveMale}");
//}

//Console.ReadKey();
//        }

//        private static float GetAverageAge(List<string> infoList)
//{
//    var ages = infoList.Select(info =>
//    {
//        var parts = info.Split(',');
//        if (parts.Length >= 3 && int.TryParse(parts[2].Trim(), out var age))
//        {
//            return age;
//        }
//        return 0;
//    }).ToList();

//    return ages.Any() ? (float)ages.Average() : 0;
//}

//private static string GetName(List<string> infoList)
//{
//    var names = infoList.Select(info => info.Split(',')[0].Trim());
//    return string.Join(" ", names);
//}
//#endregion 
#endregion