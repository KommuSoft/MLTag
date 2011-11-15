using System;
using System.Collections.Generic;
using System.IO;
using System.Text.RegularExpressions;

namespace MLTag {
	
	public class TagRecommendation : Recommender {


        private readonly Dictionary<TextVector, IList<int>> memory = new Dictionary<TextVector, IList<int>>();
        private int not = 0;
        
        public int NumberOfTags {
            get {
                return not;
            }
            set {
                this.not = value;
            }
        }

        public void Train(string text, IList<int> tags) {
            memory.Add(new TextVector(text), tags);
        }

        public IEnumerable<double> Tag(string text) {
            TextVector tv = new TextVector(text);
            double total = 0.0d, score, temp;
            Dictionary<int, double> tags = new Dictionary<int, double>();
            foreach (KeyValuePair<TextVector, IList<int>> kvp in memory) {
                score = tv ^ kvp.Key;
                Console.WriteLine("score: {0}", score);
                total += score;
                foreach (int tag in kvp.Value) {
                    if (!tags.TryGetValue(tag, out temp)) {
                        tags.Add(tag, 0.0d);
                        temp = 0.0d;
                    }
                    tags[tag] = temp + score;
                }
            }
            
            List<Tuple<string, double>> result = new List<Tuple<string, double>>();
            if (total <= Double.Epsilon) {
                return result;
            }
            foreach (KeyValuePair<string, double> kvp in tags) {
                Console.WriteLine("Evaluating {0}/{1}", kvp.Key, kvp.Value / total);
                if (kvp.Value / total >= treshold) {
                    result.Add(new Tuple<string, double>(kvp.Key, kvp.Value / total));
                }
            }
            return result;
        }
    }
}