
namespace Attributes.Models
{
    [AttributeUsage(AttributeTargets.Class, Inherited = false)]
    public class ClassAttribute : Attribute
    {
        public string Name { get; set; }
        public int Number { get; set; }
    }
    [AttributeUsage(AttributeTargets.Method | AttributeTargets.Constructor, AllowMultiple = true)]
    public class MethodOrConstructor : Attribute
    {
        public string Name { get; set; }
    }
    [AttributeUsage(AttributeTargets.All)]
    public class MyAttribute : Attribute
    {

    }
}
