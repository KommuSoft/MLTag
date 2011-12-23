using System;
using System.Collections.Generic;
using weka.core;
using weka.classifiers.bayes;
using weka.classifiers;
using weka.classifiers.trees;
using weka.filters;
using weka.filters.unsupervised.attribute;
using ikvm.io;
using java.io;
using System.IO;

namespace MLTag {

	public abstract class AbstractCustomVectorRecommender : Recommender {
		
		private int not;
		private readonly List<AbstractBasicTextVector> vectors = new List<AbstractBasicTextVector> ();
		private readonly List<bool[]> results = new List<bool[]> ();
		private string[] tags;
		private Instances[] datasets;
		private AbstractClassifier[] classifiers;
		
		public int NumberOfTags {
			get {
				return this.not;
			}
			set {
				this.not = value;
			}
		}
		
		public AbstractCustomVectorRecommender (string[] tags) {
			this.tags = tags;
		}
		
		public void Train (string text, IList<int> tags) {
			vectors.Add (new ConcreteBasicTextVector (text.Replace ("'", "").Replace ("\"", "")));
			bool[] res = new bool[this.not];
			foreach (int i in tags) {
				res [i] = true;
			}
			results.Add (res);
		}
		
		protected abstract AbstractClassifier GenerateClassifier ();
		
		public void EndTrainingSession () {
			Stream s = new MemoryStream ();
			TextWriter tw = new StreamWriter (s);
			AbstractBasicTextVector.WriteInstancesArff (tw, vectors, "c45recommender", tags, results);
			tw.Flush ();
			s.Position = 0;
			Instances source = new Instances (new InputStreamReader (new InputStreamWrapper (s)));
			tw.Close ();
			s.Close ();
			
			Instances[] derived = new Instances[this.not];
			classifiers = new AbstractClassifier[this.not];
			int[] args = new int[this.not - 1];
			int l = source.numAttributes () - this.not;
			for (int i = 0; i < this.not-1; i++) {
				args [i] = i + l + 1;
			}
			for (int i = 0; i < this.not; i++) {
				Remove rem = new Remove ();
				rem.setAttributeIndicesArray (args);
				rem.setInputFormat (source);
				derived [i] = Filter.useFilter (source, rem);
				classifiers [i] = GenerateClassifier ();
				derived [i].setClassIndex (derived [i].numAttributes () - 1);
				classifiers [i].buildClassifier (derived [i]);
				if (i < this.not - 1) {
					args [i] = l + i;
				}
			}
			datasets = derived;
		}
		
		public IEnumerable<double> Tag (string text) {
			Instance instance = new DenseInstance (1.0d, new ConcreteBasicTextVector (text, false).ToVector (1));
			double[] val = new double[this.not];
			for (int i = 0; i < this.not; i++) {
				instance.setDataset (datasets [i]);
				val [i] = classifiers [i].classifyInstance (instance);
			}
			return val;
		}
		
	}
}

