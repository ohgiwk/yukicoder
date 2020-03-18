
using System;

// String input = Console.ReadLine();
String input = "6";
var n = Convert.ToInt32(input);
// var n = 6;
IEnumerable<int> l = Enumerable.Range(1, n).Select(i => i % 6 + 1);
IEnumerable<int> l2 = Enumerable.Range(1, 6).Select(i => l.Where(j => i == j).Count());
bool result = l2.All(i => i == l2.ElementAt(0));

Console.WriteLine(result? "Yes" : "No");
