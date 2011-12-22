using System;
using System.Collections.Generic;

namespace MLTag {

    public class CosineMetric : StringDistanceMetric {
        //private IDictionary<String, HashSet<String>> dict = new Dictionary<String, HashSet<String>>();
        public double GetDistance(string a, string b) {
            /*HashSet<string> seta;
            if(!dict.TryGetValue(a,out seta)){
                seta = new HashSet<string>(StringUtils.GetLuceneTokens(a));
                dict.Add(a,seta);
            }
			int na = seta.Count;
            HashSet<string> setb;
            if(!dict.TryGetValue(b,out setb)){
                setb = new HashSet<string>(StringUtils.GetLuceneTokens(b));
                dict.Add(b,setb);
            }*/
            HashSet<string> seta = new HashSet<string>(StringUtils.GetLuceneTokens(a));
            int na = seta.Count;
            HashSet<string> setb = StringUtils.GetLuceneTokens(b);
			int nb = setb.Count;
            seta.IntersectWith(setb);
			return 1.0d-((double) seta.Count*seta.Count/(na*nb));
			
		}

    }

}
