namespace LINQ_Session2
{
    /// <summary>
    /// Extra LINQ Examples from Nutshells book and others
    /// </summary>
    internal class Program
    {
        static void Main(string[] args)
        {
             int[] numbers = { 1, 2, 3, 4, 56, 65, 232, 6567, 78, 1, 6, 67, 75, 8, 3, 5, 2, 4, 6, 824, 600 };

            var linq0 = from x in numbers where x > 40 select x;

            foreach (var x in linq0)
            {
                Console.WriteLine(x);
            }
        }
    }
}
