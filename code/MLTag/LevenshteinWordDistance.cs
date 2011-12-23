using System;
using System.Collections.Generic;

namespace MLTag {

	public class LevenshteinWordDistance : StringDistanceMetric {
		
		private LevenshteinDistance innerDistance = new LevenshteinDistance();

		public LevenshteinWordDistance () {}
		
		public double GetDistance (string a, string b) {
			HashSet<string> tokensa = StringUtils.GetLuceneTokens(a);
            HashSet<string> tokensb = StringUtils.GetLuceneTokens(b);
            DateTime dt = DateTime.Now;
			double sum = 0.0d;
			foreach(string ta in tokensa) {
				double min = double.PositiveInfinity;
				foreach(string tb in tokensb) {
					min = Math.Min(min,innerDistance.GetDistance(ta,tb));
				}
				sum += min;
			}
			foreach(string tb in tokensb) {
				double min = double.PositiveInfinity;
				foreach(string ta in tokensa) {
					min = Math.Min(min,innerDistance.GetDistance(ta,tb));
				}
				sum += min;
			}
            double ret = sum / (tokensa.Count + tokensb.Count);
            if (Double.IsNaN(ret)) {
                Console.WriteLine("WAAAAAAARNING");
            }

            Console.WriteLine(dt - DateTime.Now);
            return ret ;
		}
		
	}
}

