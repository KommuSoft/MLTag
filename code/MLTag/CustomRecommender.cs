using System;
using System.Collections.Generic;
using System.IO;
using System.Text.RegularExpressions;

namespace MLTag {

	public class CustomRecommender : Recommender {


		private readonly Dictionary<TextVector, Tuple<IList<int>,double>> memory = new Dictionary<TextVector, Tuple<IList<int>,double>> ();
		private AdditionalNeuralNetwork ann;
		private int not = 0;
		//private const double threshold = 0.45d;
        
		public int NumberOfTags {
			get {
				return not;
			}
			set {
				this.not = value;
			}
		}

		public CustomRecommender (int numberOfTags) {
			this.not = numberOfTags;
			//Console.WriteLine(numberOfTags);
			this.ann = new AdditionalNeuralNetwork(numberOfTags);
		}
		
		public void Train (string text, IList<int> tags) {
			TextVector tv = new TextVector (text.ToLower());
			double score = 1.0d;
			Stack<Tuple<TextVector,Tuple<IList<int>,double>>> toSet = new Stack<Tuple<TextVector, Tuple<IList<int>, double>>>();
			foreach(KeyValuePair<TextVector, Tuple<IList<int>,double>> kvp in memory) {
				double subscore = kvp.Key | tv;
				if(subscore > double.Epsilon) {
					toSet.Push(new Tuple<TextVector, Tuple<IList<int>,double>>(kvp.Key,new Tuple<IList<int>,double>(kvp.Value.Item1,kvp.Value.Item2+subscore)));
					score += subscore;
				}
			}
			Tuple<TextVector,Tuple<IList<int>,double>> item;
			while(toSet.Count > 0) {
				item = toSet.Pop();
				memory[item.Item1] = item.Item2;
			}
			memory.Add (tv,new Tuple<IList<int>,double>(tags,score));
			double[] inp = this.Tag(text);
			double[] outp = new double[not];
			foreach(int t in tags) {
				outp[t] = 1.0d;
			}
			//Console.WriteLine(string.Join(",",inp));
			//Console.WriteLine(string.Join(",",outp));
			ann.Learn(inp,outp);//*/
		}

		public double[] Tag (string text) {
			double[] result = new double[not];
			TextVector tv = new TextVector (text.ToLower(),false);
			double total = 0.0d, score, temp;
			Dictionary<int, double > tags = new Dictionary<int, double> ();
			//Console.WriteLine("weights: ");
			foreach (KeyValuePair<TextVector, Tuple<IList<int>,double>> kvp in memory) {
				score = tv | kvp.Key;
				score *= score/Math.Sqrt(kvp.Value.Item2);//devided by the inverse score of the sample
				total += score;
				foreach (int tag in kvp.Value.Item1) {
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
				//if (kvp.Value / total >= threshold) {
					result [kvp.Key] = Math.Sqrt(kvp.Value / total);
				//Console.WriteLine("{0}/{1}",kvp.Key,kvp.Value/total);
				//}
			}
			return result;
		}

		#region Recommender implementation
		IEnumerable<double> Recommender.Tag (string text) {
			double[] vals = this.Tag(text);
			return ann.Activate(vals);
			//return vals;
		}
		#endregion
	}
}