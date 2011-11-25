using System;
using System.Collections.Generic;
using System.IO;
using System.Text.RegularExpressions;

namespace MLTag {

	public class CustomRecommender : Recommender {


		private readonly Dictionary<TextVector, IList<int>> memory = new Dictionary<TextVector, IList<int>> ();
		private int not = 0;
		private const double threshold = 0.4d;
        
		public int NumberOfTags {
			get {
				return not;
			}
			set {
				this.not = value;
			}
		}

		public void Train (string text, IList<int> tags) {
			memory.Add (new TextVector (text), tags);
		}

		public IEnumerable<double> Tag (string text) {
			double[] result = new double[not];
			TextVector tv = new TextVector (text);
			double total = 0.0d, score, temp;
			Dictionary<int, double > tags = new Dictionary<int, double> ();
			foreach (KeyValuePair<TextVector, IList<int>> kvp in memory) {
				score = tv ^ kvp.Key;
				total += score;
				foreach (int tag in kvp.Value) {
					if (!tags.TryGetValue (tag, out temp)) {
						tags.Add (tag, 0.0d);
						temp = 0.0d;
					}
					tags [tag] = temp + score;
				}
			}
			if (total <= Double.Epsilon) {
				return result;
			}
			foreach (KeyValuePair<int, double> kvp in tags) {
				if (kvp.Value / total >= threshold) {
					result [kvp.Key] = kvp.Value / total;
				}
			}
			return result;
		}
	}
}