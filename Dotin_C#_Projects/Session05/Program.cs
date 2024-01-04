using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Session05
{
    internal class Program
    {
        static void Main(string[] args)
        {

        }
    }

    public class Person
    {
        private readonly string _name;
        private readonly int _age;

        public Person(string name, int age)
        {
            _name = name;
            _age = age;
        }

        public string Introduce()
        {
            return $"My name is {_name} and I'm {_age} years old.";
        }
    }

    public class Person
    {
        private readonly string _name;
        private readonly int _age;

        public Person(string name, int age)
        {
            _name = name;
            _age = age;
        }

        public string Introduce()
        {
            return $"My name is {_name} and I'm {_age} years old.";
        }

        public string Name { get { return _name; } }

        public int Age { get { return _age; } }
    }
}
