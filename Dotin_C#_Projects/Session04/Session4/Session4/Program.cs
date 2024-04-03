

namespace Session4
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

        }
    }
}
