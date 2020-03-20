using System;

String input = Console.ReadLine();
// String input = "1 2 3 4";
IEnumerable<int> l1 = input.Split(" ")
                      .Select(s => Convert.ToInt32(s))
                      .OrderBy(i => i);
IEnumerable<int> l2 = Enumerable.Range(l1.Min(), l1.Max());

Console.WriteLine(l1.SequenceEqual(l2)? "Yes" : "No");

