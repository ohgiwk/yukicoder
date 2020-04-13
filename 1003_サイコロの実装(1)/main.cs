
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

namespace Program
{

    interface IOProvider
    {
        String Read();
        // String ReadLine();
        // String[] ReadLines();
        void Write(String str);
        // void WriteLn();
    }

    class TestIOProvider : IOProvider
    {
        public String Read()
        {
            return "6";
        }

        public void Write(String str)
        {
            Console.WriteLine(str);
        }
    }

    class StdIOProvider : IOProvider
    {
        public String Read()
        {
            return Console.ReadLine();
        }

        public void Write(String str)
        {
            Console.WriteLine(str);
        }
    }

    abstract class Base
    {
        protected IOProvider io;

        public Base(IOProvider provider)
        {
            this.io = provider;
        }

        public String Read()
        {
            return this.io.Read();
        }

        public void Write(String str)
        {
            this.io.Write(str);
        }

        public virtual void Main() { }
    }


    class Program : Base
    {
        public Program(IOProvider provider) : base(provider)
        {
        }

        public sealed override void Main()
        {
            String input = this.Read();

            int n = Convert.ToInt32(input);
            IEnumerable<int> l = Enumerable.Range(1, n).Select(i => i % 6 + 1);
            IEnumerable<int> l2 = Enumerable.Range(1, 6).Select(i => l.Where(j => i == j).Count());
            bool result = l2.All(i => i == l2.ElementAt(0));

            this.Write(result ? "Yes" : "No");
        }
    }


    public class Hello
    {
        public static void Main()
        {
            DateTime startTime = DateTime.Now;

            var provider = new TestIOProvider();
            new Program(provider).Main();

            DateTime endTime = DateTime.Now;
            TimeSpan diff = endTime - startTime;
            Console.WriteLine($"code runned in {diff}");
        }
    }
}

// Program.Hello.Main();
