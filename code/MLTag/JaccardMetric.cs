using System;
using System.Collections.Generic;

namespace MLTag {

	public class JaccardMetric : StringDistanceMetric {
		
		public double GetDistance (string a, string b) {
			HashSet<string> seta = new HashSet<string>(StringUtils.GetLuceneTokens(a));
			HashSet<string> setb = new HashSet<string>(StringUtils.GetLuceneTokens(b));
			HashSet<string> intersec = new HashSet<string>(seta);
			HashSet<string> union = new HashSet<string>(seta);
			intersec.IntersectWith(setb);
			union.UnionWith(setb);
			return 1.0d-((double) intersec.Count/union.Count);
			
		}
		
	}
	
}