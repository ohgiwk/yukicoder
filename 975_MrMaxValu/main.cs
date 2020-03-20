
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

public class Program
{
    private static IEnumerable<int> GetLine()
    {
        return Console.ReadLine().Split(" ").Select(x => Convert.ToInt32(x));
    }

    public static void Main()
    {
        IEnumerable<int> inputs = Program.GetLine();
        int wantedNum = inputs.First();
        IEnumerable<int> mrMaxList = Program.GetLine();
        IEnumerable<int> maxValuList = Program.GetLine();

        bool isMrMax = mrMaxList.Contains(wantedNum);
        bool isMaxValu = maxValuList.Contains(wantedNum);

        if (isMrMax && isMaxValu)
        {
            Console.WriteLine("MrMaxValu");
        }
        else if (isMrMax)
        {
            Console.WriteLine("MrMax");
        }
        else if (isMaxValu)
        {
            Console.WriteLine("MaxValu");
        }
        else
        {
            Console.WriteLine("-1");
        }
    }
}

// Program.Main();
