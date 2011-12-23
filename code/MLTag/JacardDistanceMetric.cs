using System;
using System.Collections.Generic;

namespace MLTag {

	public class JacardDistanceMetric : StringDistanceMetric {
		
		public JacardDistanceMetric () {
		}
		
		public double GetDistance (string a, string b) {
			List<string> tokensa = new List<string>(StringUtils.GetLuceneTokens(a));
			List<string> tokensb = new List<string>(StringUtils.GetLuceneTokens(b));
			HashSet<string> inter = new HashSet<string>(tokensa);
			inter.IntersectWith(tokensb);
			HashSet<string> union = new HashSet<string>(tokensa);
			union.UnionWith(tokensb);
			return (double) (union.Count-inter.Count);///union.Count;
		}
		
	}
}

