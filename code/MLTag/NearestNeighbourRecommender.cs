using System;
using System.Collections.Generic;

namespace MLTag {

	public class NearestNeighbourRecommender : Recommender {
		
		private int not;
		
		public int NumberOfTags {
			get {
				return this.not;
			}
			set {
				this.not = value;
				this.connections = new List<int>[this.not];
				for(int i = 0; i < this.not; i++) {
					this.connections[i] = new List<int>();
				}
			}
		}
		private readonly List<string[]> sampleTokens = new List<string[]>();
		private List<int>[] connections;
		
		public NearestNeighbourRecommender () {
			
		}
		
		public IEnumerable<double> Tag (string text) {
			string[] tokens = StringUtils.GetTokens(text);
			double[] distances = new double[this.sampleTokens.Count];
			double[] labels = new double[this.not];
			double sum = 0.0d, rel;
			for(int i = 0; i < distances.Length; i++) {
				rel = StringUtils.SentenceRelevance(tokens,sampleTokens[i]);
				distances[i] = rel;
				sum += rel;
			}
			//MaximumQueue<double> max0 = new MaximumQueue<double>(3);
			//MaximumQueue<double> max1 = new MaximumQueue<double>(3);
			double max0, max1;
			for(int i = 0; i < this.not; i++) {
				int k = 0;
				max0 = 0.0d; max1 = 0.0d;
				for(int j = 0; j < connections[i].Count; j++) {
					int l = connections[i][j];
					for(; k < l; k++) {
						//max0.Add(distances[k]);
						max0 = Math.Max(max0,distances[k]);
					}
					//max1.Add(distances[k++]);
					max1 = Math.Max(max1,distances[k++]);
				}
				for(; k < distances.Length; k++) {
					//max0.Add(distances[k]);
					max0 = Math.Max(max0,distances[k]);
				}
				/*double avg0 = 0.0d;
				foreach(double d in max0) {
					avg0 += d;
				}
				avg0 /= max0.Count;
				max0.Clear();
				double avg1 = 0.0d;
				foreach(double d in max1) {
					avg1 += d;
				}
				avg1 /= max1.Count;
				max1.Clear();*/
				/*foreach(double d in max1) {
					if(d >= 0.9d) {
						labels[i] = 1.0d;
					}
					break;
				}//*/
				labels[i] = max1/(max1+max0);
			}
			return labels;
		}
		public void EndTrainingSession () {}
		public void Train (string text, IList<int> tags) {
			string[] tokens = StringUtils.GetTokens(text);
			int index = sampleTokens.Count;
			sampleTokens.Add(tokens);
			foreach(int t in tags) {
				this.connections[t].Add(index);
			}
		}
		
	}
}

