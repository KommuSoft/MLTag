using System;
using weka.classifiers;
using weka.classifiers.trees;
using weka.classifiers.bayes;
using weka.classifiers.lazy;

namespace MLTag {

	public class ConcreteCustomVectorRecommender : AbstractCustomVectorRecommender {
		
		public ConcreteCustomVectorRecommender (string[] tags) : base(tags) {}
		
		#region implemented abstract members of MLTag.MultipleSingleClassifierRecommender
		protected override AbstractClassifier GenerateClassifier () {
			AbstractClassifier ac;
			ac = new J48();
			//ac = new DecisionStump();
			//ac = new LMT();
			//ac = new M5P();
			//ac = new NaiveBayes();
			//ac = new BayesNet();
			//bn.setUseADTree(true);
			//bn.setSearchAlgorithm(new weka.classifiers.bayes.net.search.ci.CISearchAlgorithm());
			//ac = new LWL();
			//lwl.setKNN(3);
			//ac = new RandomForest();
			//rf.setMaxDepth(20);
			//rf.setNumFeatures(100);
			//rf.setNumTrees(100);
			//ac = new REPTree();
			//ac = new IBk(3);
			//ac = new REPTree();
			//ac.setUseMDLcorrection(false);
			//ac.setSubtreeRaising(true);
			//ac.setUseLaplace(true);
			//ac.setReducedErrorPruning(true);
			return ac;
		}
		#endregion
	}
}

