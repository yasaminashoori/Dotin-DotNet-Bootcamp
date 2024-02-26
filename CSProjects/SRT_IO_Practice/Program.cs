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
            List<string> fWords = FindFWords(filePath);
            List<string> wordsInBrackets = FindWordsInBrackets(filePath);
            List<string> specialWords = FindSpecialWords(wordsInBrackets);

            Console.WriteLine("F Words:");
            PrintList(fWords);

            Console.WriteLine("\nWords in Brackets:");
            PrintList(wordsInBrackets);

            Console.WriteLine("\nSpecial Words in Brackets (Non-Recursively, Sorted in Ascending Order):");
            PrintList(specialWords);
        }
        catch (Exception ex)
        {
            Console.WriteLine($"An error occurred: {ex.Message}");
        }
    }

    static List<string> FindFWords(string filePath)
    {
        string content = File.ReadAllText(filePath);
        string pattern = @"\bf\w*\b";
        return Regex.Matches(content, pattern, RegexOptions.IgnoreCase)
                    .Cast<Match>()
                    .Select(match => match.Value)
                    .ToList();
    }

    static List<string> FindWordsInBrackets(string filePath)
    {
        string content = File.ReadAllText(filePath);
        string pattern = @"\[(.*?)\]";
        return Regex.Matches(content, pattern)
                    .Cast<Match>()
                    .Select(match => match.Groups[1].Value)
                    .ToList();
    }

    static List<string> FindSpecialWords(List<string> wordsInBrackets)
    {
        return wordsInBrackets.Distinct(StringComparer.OrdinalIgnoreCase)
                             .OrderBy(word => word)
                             .ToList();
    }

    static void PrintList(List<string> list)
    {
        foreach (var item in list)
        {
            Console.WriteLine(item);
        }
    }
}

