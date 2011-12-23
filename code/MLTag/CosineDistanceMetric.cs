using System;
using System.Collections.Generic;

namespace MLTag {

    public class CosineDistanceMetric : StringDistanceMetric {
		
        public double GetDistance(string a, string b) {
            HashSet<string> seta = new HashSet<string>(StringUtils.GetLuceneTokens(a));
            int na = seta.Count;
            HashSet<string> setb = StringUtils.GetLuceneTokens(b);
			int nb = setb.Count;
            seta.IntersectWith(setb);
			return 1.0d-((double) seta.Count*seta.Count/(na*nb));
			
		}

    }

}
