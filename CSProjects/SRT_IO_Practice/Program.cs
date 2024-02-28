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
        var contentLines = File.ReadAllLines(filePath);
        List<string> fWords = FindWords(contentLines, @"\bf\w*\b");
        List<string> wordsInBrackets = FindWords(contentLines, @"\[(.*?)\]");
        List<string> finalFWords = fWords.Distinct(StringComparer.OrdinalIgnoreCase)
            .OrderBy(word => word).ToList();

        Console.WriteLine("Words in Brackets:\n");
        PrintList(wordsInBrackets);
        Console.WriteLine("\n F words: \n"+ string.Join(", ", finalFWords));

    }
    static List<string> FindWords(string[] lines, string pattern)
    {
        return lines.SelectMany(line => Regex.Matches(line, pattern, RegexOptions.IgnoreCase).
        Cast<Match>().Select(match => match.Value)).ToList();
    }





    static void PrintList(List<string> list)
    {
        list.ForEach(Console.WriteLine);
    }
}
