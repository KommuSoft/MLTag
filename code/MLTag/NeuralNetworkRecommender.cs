using System;
using System.Collections.Generic;
using AForge.Neuro;
using AForge.Neuro.Learning;
using System.Linq;

namespace MLTag {

	public class NeuralNetworkRecommender : Recommender {
		
		private ActivationNetwork network;
		private readonly List<Tuple<TextVector,double[]>> memory = new List<Tuple<TextVector,double[]>>();
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
				this.network = new ActivationNetwork(new BipolarSigmoidFunction(),this.oldVector,this.not);
				ISupervisedLearning[] teacher = new ISupervisedLearning[] {new DeltaRuleLearning(this.network),new PerceptronLearning(this.network),new BackPropagationLearning(this.network)};
				double[][] inputs = (from m in memory select m.Item1.ToDoubleArray()).ToArray();
				double[][] outputs = (from m in memory select m.Item2).ToArray();
				for(int i = 0; i < 50; i++) {
					foreach(ISupervisedLearning isl in teacher) {
						isl.RunEpoch(inputs,outputs);
					}
				}
			}
		}
		
		public void Train (string text, IList<int> tags) {
			double[] t = new double[this.not];
			for(int i = 0; i < tags.Count; i++) {
				t[tags[i]] = 1.0d;
			}
			this.memory.Add(new Tuple<TextVector,double[]>(new TextVector(text),t));
		}
		public IEnumerable<double> Tag (string text) {
			return this.network.Compute(new TextVector(text,false).ToDoubleArray());
		}
		
	}
}

