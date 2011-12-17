using System;
using System.Collections.Generic;
using System.Linq;

namespace MLTag {

	public class ID3Recommender : Recommender {
		
		private ID3TreeNode[] roots;
		private readonly List<Tuple<TextVector,bool[]>> memory = new List<Tuple<TextVector, bool[]>>();
		private int not;
		private double strong;
		
		public int NumberOfTags {
			get {
				return this.not;
			}
			set {
				this.not = value;
			}
		}
		public double Strong {
			get {
				return this.strong;
			}
			set {
				this.strong = value;
			}
		}
		
		public ID3Recommender (double strong) {
			this.strong = strong;
		}
		
		public void EndTrainingSession () {
			this.roots = new ID3TreeNode[not];
			IEnumerable<double[]> matrix = from m in memory select m.Item1.ToDoubleArray();
			Tuple<double[],bool>[] samples = new Tuple<double[], bool>[not];
			ID3TreeNodeLeaf tl = new ID3TreeNodeLeaf(true);
			ID3TreeNodeLeaf fl = new ID3TreeNodeLeaf(false);
			string[] ats = TextVector.GetAttributeNames();
			for(int i = 0; i < not; i++) {
				samples = memory.Zip(matrix,(x,y) => new Tuple<double[],bool>(y,x.Item2[i])).ToArray();
				roots[i] = ID3Tree.FindBestBranch(samples,tl,fl);
				Console.WriteLine(roots[i].ToString(ats));
			}
		}
		public void Train (string text, IList<int> tags) {
			bool[] tagb = new bool[not];
			foreach(int i in tags) {
				tagb[i] = true;
			}
			memory.Add(new Tuple<TextVector,bool[]>(new TextVector(text.ToLowerInvariant()),tagb));
		}
		public IEnumerable<double> Tag (string text) {
			double[] vector = new TextVector(text.ToLowerInvariant(),false).ToDoubleArray();
			double[] ret = new double[not];
			for(int i = 0; i < not; i++) {
				if(roots[i].Evaluate(vector)) {
					ret[i] = strong;
				}
				else {
					ret[i] = 1.0d-strong;
				}
			}
			return ret;
		}
		
	}
	
}