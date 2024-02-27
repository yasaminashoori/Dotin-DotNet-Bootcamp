using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;

class Program
{
    static void Main()
    {
        string filePath = @"C:\Users\Yasi\Desktop\Baby.Driver.srt";
        ProcessSrtFile(filePath);

        Console.ReadKey();
    }

    static void ProcessSrtFile(string filePath)
    {
        try
        {
            var content = File.ReadAllText(filePath);
            var fWords = FindWords(content, @"\bf\w*\b", RegexOptions.IgnoreCase);
            var wordsInBrackets = FindWords(content, @"\[(.*?)\]");
            var specialWords = wordsInBrackets.Distinct(StringComparer.OrdinalIgnoreCase).OrderBy(word => word).ToList();

            PrintList("F Words:", fWords);
            PrintList("\nWords in Brackets:", wordsInBrackets);
            PrintList("\nSpecial Words in Brackets (Non-Recursively, Sorted in Ascending Order):", specialWords);
        }
        catch (Exception ex)
        {
            Console.WriteLine($"An error occurred: {ex.Message}");
        }
    }

    static List<string> FindWords(string content, string pattern, RegexOptions options = RegexOptions.None)
    {
        return Regex.Matches(content, pattern, options)
                    .Cast<Match>()
                    .Select(match => match.Value)
                    .ToList();
    }

    static void PrintList(string title, List<string> list)
    {
        Console.WriteLine($"{title}\n{string.Join("\n", list)}");
    }
}

//using System;
//using System.IO;
//using System.Linq;
//using System.Text.RegularExpressions;

//class Program
//{
//    static void Main()
//    {
//        string filePath = @"C:\Users\Yasi\Desktop\Baby.Driver.srt";

//        try
//        {
//            ProcessSrtFile(filePath);
//        }
//        catch (Exception ex)
//        {
//            Console.WriteLine($"An error occurred: {ex.Message}");
//        }

//        Console.ReadKey();
//    }

//    static void ProcessSrtFile(string filePath)
//    {
//        var contentLines = File.ReadAllLines(filePath);

//        List<string> fWords = FindWords(contentLines, @"\bf\w*\b");
//        List<string> wordsInBrackets = FindWords(contentLines, @"\[(.*?)\]");
//        List<string> specialWords = wordsInBrackets.Distinct(StringComparer.OrdinalIgnoreCase).OrderBy(word => word).ToList();

//        Console.WriteLine("F Words:");
//        PrintList(fWords);

//        Console.WriteLine("\nWords in Brackets:");
//        PrintList(wordsInBrackets);

//        Console.WriteLine("\nSpecial Words in Brackets (Non-Recursively, Sorted in Ascending Order):");
//        PrintList(specialWords);
//    }

//    static List<string> FindWords(string[] lines, string pattern)
//    {
//        return lines.SelectMany(line => Regex.Matches(line, pattern, RegexOptions.IgnoreCase).Cast<Match>().Select(match => match.Value)).ToList();
//    }

//    static void PrintList(List<string> list)
//    {
//        list.ForEach(Console.WriteLine);
//    }
//}
