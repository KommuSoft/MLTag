using System;
using System.Collections.Generic;

namespace MLTag {

	public class JacardDistance : StringDistanceMetric {
		
		public JacardDistance () {
		}
		
		public double GetDistance (string a, string b) {
			/*
			a = Console.ReadLine();
			b = Console.ReadLine();//*/
			/*foreach(string s in StringUtils.GetLuceneTokens(a)) {
				Console.WriteLine(s);
			}
			Console.WriteLine("----------");
			foreach(string s in StringUtils.GetLuceneTokens(b)) {
				Console.WriteLine(s);
			}
			Console.WriteLine("----------");*/
			List<string> tokensa = new List<string>(StringUtils.GetLuceneTokens(a));
			List<string> tokensb = new List<string>(StringUtils.GetLuceneTokens(b));
			HashSet<string> inter = new HashSet<string>(tokensa);
			inter.IntersectWith(tokensb);
			//Console.WriteLine(string.Join(" ; ",inter));
			HashSet<string> union = new HashSet<string>(tokensa);
			union.UnionWith(tokensb);
			//Console.WriteLine(string.Join(" ; ",union));
			double res = (double) (union.Count-inter.Count);
			//Console.WriteLine(res);
			//Console.ReadKey();
			return (double) (union.Count-inter.Count);///union.Count;
		}
		
	}
}

