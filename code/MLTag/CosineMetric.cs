using System;
using System.Collections.Generic;

namespace MLTag {

	public class CosineMetric : StringDistanceMetric {
		
		public double GetDistance (string a, string b) {
			HashSet<string> seta = new HashSet<string>(StringUtils.GetLuceneTokens(a));
			int na = seta.Count;
			HashSet<string> setb = new HashSet<string>(StringUtils.GetLuceneTokens(b));
			int nb = seta.Count;
			seta.IntersectWith(setb);
			return 1.0d-((double) seta.Count*seta.Count/(na*nb));
			
		}
		
	}
	
}