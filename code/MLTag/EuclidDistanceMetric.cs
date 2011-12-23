using System;
using System.Collections.Generic;

namespace MLTag {

	public class EuclidDistanceMetric : StringDistanceMetric {
		
		public double GetDistance (string a, string b) {
			HashSet<string> ta = new HashSet<string>(StringUtils.GetLuceneTokens(a));
			HashSet<string> tb = new HashSet<string>(StringUtils.GetLuceneTokens(b));
			HashSet<string> xor = new HashSet<string>(ta);
			xor.UnionWith(tb);
			HashSet<string> intersec = new HashSet<string>(ta);
			intersec.IntersectWith(tb);
			xor.ExceptWith(intersec);
			return Math.Sqrt(xor.Count);
		}
		
	}
	
}