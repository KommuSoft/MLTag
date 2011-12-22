using System;
using System.Collections.Generic;

namespace MLTag {

	public class LevenshteinWordDistance : StringDistanceMetric {
		
		private LevenshteinDistance innerDistance = new LevenshteinDistance();
		
		public LevenshteinWordDistance () {}
		
		public double GetDistance (string a, string b) {
			List<string> tokensa = new List<string>(StringUtils.GetLuceneTokens(a));
			List<string> tokensb = new List<string>(StringUtils.GetLuceneTokens(b));
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
			return sum/(tokensa.Count+tokensb.Count);
		}
		
	}
}

