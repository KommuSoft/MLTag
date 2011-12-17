using System;
using System.Collections.Generic;
using AForge.Neuro;

namespace MLTag {

	public class NeuralNetworkRecommender : Recommender {
		
		private ActivationNetwork activationNetwork;
		private readonly List<Tuple<TextVector2,double[]>> memory = new List<Tuple<TextVector2,double[]>>();
		private int not;
		private int oldVector = -1;
		
		public int NumberOfTags {
			get {
				return this.not;
			}
			set {
				this.not = value;
			}
		}
		
		public NeuralNetworkRecommender () {
		}
		
		public void EndTrainingSession () {
			if(TextVector2.NumberOfTerms != oldVector) {
				this.oldVector = TextVector2.NumberOfTerms;
			}
		}
		
		public void Train (string text, IList<int> tags) {
			double[] t = new double[this.not];
			for(int i = 0; i < tags.Count; i++) {
				t[tags[i]] = 1.0d;
			}
			this.memory.Add(new Tuple<TextVector2,double[]>(new TextVector2(text),t));
		}
		public IEnumerable<double> Tag (string text) {
			return this.activationNetwork.Compute(new TextVector2(text,false).getDoubleArray());
		}
		
	}
}

