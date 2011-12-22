using System;
using System.Collections.Generic;
using weka.core;
using weka.classifiers;
using weka.classifiers.trees;
using ikvm.io;
using java.io;
using System.IO;

namespace MLTag {

	public class C45Recommender : Recommender {
		
		private int not;
		private readonly List<AbstractBasicTextVector> vectors = new List<AbstractBasicTextVector>();
		private readonly List<bool[]> results = new List<bool[]>();
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
		
		public C45Recommender (string[] tags) {
			this.tags = tags;
		}
		
		public void Train (string text, IList<int> tags) {
			//if(vectors.Count < 10) {
				vectors.Add(new ConcreteBasicTextVector(text.Replace("'","").Replace("\"","")));
				bool[] res = new bool[this.not];
				foreach(int i in tags) {
					res[i] = true;
				}
				results.Add(res);
			//}
		}
		
		public void EndTrainingSession () {
			Stream s = System.IO.File.Open("test.arff",FileMode.Create,FileAccess.Write);
			TextWriter tw = new StreamWriter(s);
			AbstractBasicTextVector.WriteInstancesArff(tw,vectors,"c45recommender",tags,results);
			tw.Close();
			s.Close();
			s = new MemoryStream();
			tw = new StreamWriter(s);
			AbstractBasicTextVector.WriteInstancesArff(tw,vectors,"c45recommender",tags,results);
			tw.Flush();
			s.Position = 0;
			Instances source = new Instances(new InputStreamReader(new InputStreamWrapper(s)));
			tw.Close();
			s.Close();
			
			//weka.filters.Filter myRandom = new weka.filters.unsupervised.instance.Randomize();
			//myRandom.setInputFormat(source);
			//source = weka.filters.Filter.useFilter(source, myRandom);
			
			//int percentSplit = 100;
			//int trainSize = source.numInstances() * percentSplit / 100;
			//int testSize = source.numInstances() - trainSize;
			
			Instances[] derived = new Instances[this.not];
			for(int i = 0; i < this.not; i++) {
				derived[i] = new Instances(source);
				for(int j = i+1; j < this.not; j++) {
					derived[i].deleteAttributeAt(derived[i].numAttributes()-1);
				}
				for(int j = 0; j < i; j++) {
					derived[i].deleteAttributeAt(source.numAttributes()-this.not);
				}
				//System.Console.WriteLine(derived[i]);
			}
			datasets = derived;
			classifiers = new AbstractClassifier[this.not];
			for(int i = 0; i < this.not; i++) {
				classifiers[i] = new J48();
				//classifiers[i] = new DecisionStump();
				//classifiers[i] = new LMT();
				//classifiers[i] = new M5P();
				//classifiers[i] = new RandomForest();
				//classifiers[i] = new REPTree();
				//classifiers[i].setUseMDLcorrection(false);
				//classifiers[i].setSubtreeRaising(true);
				//classifiers[i].setUseLaplace(true);
				//classifiers[i].setReducedErrorPruning(true);
				derived[i].setClassIndex(derived[i].numAttributes()-1);
				classifiers[i].buildClassifier(derived[i]);
				System.Console.WriteLine(classifiers[i]);
			}
			/*for(int j = 0; j < this.not; j++) {
				int numCorrect = 0;
				for (int i = trainSize; i < derived[j].numInstances(); i++) {
					Instance currentInst = derived[j].instance(i);
					double predictedClass = classifiers[j].classifyInstance(currentInst);
					double expected = source.instance(i).value(source.numAttributes()-this.not+j);
					//System.Console.WriteLine(derived[j].classAttribute());
					//System.Console.Write(predictedClass+"\t");
					//System.Console.WriteLine("{0} vs. {1}",predictedClass,expected);
					//System.Console.WriteLine(source.instance(i).attribute(source.numAttributes()-this.not+j).weight());
					if (predictedClass == expected) {
						numCorrect++;
					}
				}
				System.Console.WriteLine(tags[j]+": "+numCorrect + " out of " + testSize + " correct (" +(double)((double)numCorrect / (double)testSize * 100.0) + "%)");
			}*/
		}
		
		public IEnumerable<double> Tag (string text) {
			Instance instance = new DenseInstance(1.0d,new ConcreteBasicTextVector(text,false).ToVector(1));
			double[] val = new double[this.not];
			for(int i = 0; i < this.not; i++) {
				instance.setDataset(datasets[i]);
				val[i] = classifiers[i].classifyInstance(instance);
			}
			return val;
		}
		
	}
}

