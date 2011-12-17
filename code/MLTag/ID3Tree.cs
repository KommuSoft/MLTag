using System;

namespace MLTag {

	public static class ID3Tree {
		
		public static ID3TreeNode FindBestBranch (Tuple<double[],bool>[] examples, ID3TreeNodeLeaf trueLeaf, ID3TreeNodeLeaf falseLeaf) {
			int maxIndex;
			double maxThreshold;
			if(examples.Length <= 1) {
				throw new ArgumentException("The number of examples must be at least 2.","examples");
			}
			int n = examples.Length;
			int n1 = n-1;
			int m = examples[0].Item1.Length;
			//calculating entropy
			int pos = 0, neg = 0;
			for(int i = 0; i < n; i++) {
				if(examples[i].Item2) {
					pos++;
				}
			}
			neg = n-pos;
			double maxGain = double.MinValue;
			maxIndex = -1;
			maxThreshold = double.NaN;
			int subpos, subneg;
			double gain;
			for(int index = 0; index < m; index++) {
				Array.Sort(examples,(x, y) => x.Item1[index].CompareTo(y.Item1[index]));
				subpos = 0; subneg = 0;
				for(int ithreshold = 0; ithreshold < n1; ithreshold++) {
					if(examples[ithreshold].Item2) {
						subpos++;
					}
					else {
						subneg++;
					}
					if(examples[ithreshold+1].Item1[index]-examples[ithreshold].Item1[index] <= double.Epsilon) 
						continue;
					gain = -complexEntropy(pos,neg,subpos,subneg);
					if(gain > maxGain) {
						maxGain = gain;
						maxIndex = index;
						maxThreshold = 0.5d*(examples[ithreshold].Item1[index]+examples[ithreshold+1].Item1[index]);
					}
				}
			}
			if(maxIndex == -1) {
				maxIndex = 0;
				maxThreshold = double.NaN;
				if(pos > neg) {
					return trueLeaf;
				}
				else {
					return falseLeaf;
				}
			}
			Array.Sort(examples,(x, y) => x.Item1[maxIndex].CompareTo(y.Item1[maxIndex]));
			subneg = 0; subpos = 0;
			int devi = 0;
			for(; examples[devi].Item1[maxIndex] < maxThreshold; devi++) {
				if(examples[devi].Item2) {
					subpos++;
				}
				else {
					subneg++;
				}
			}
			ID3TreeNode node1, node2;
			if(subneg == devi) {
				node1 = falseLeaf;
			}
			else if(subpos == devi) {
				node1 = trueLeaf;
			}
			else {
				Tuple<double[],bool>[] examplesa = new Tuple<double[], bool>[devi];
				Array.Copy(examples,examplesa,devi);
				node1 = FindBestBranch(examplesa,trueLeaf,falseLeaf);
			}
			if(neg-subneg == n-devi) {
				node2 = falseLeaf;
			}
			else if(pos-subpos == n-devi) {
				node2 = trueLeaf;
			}
			else {
				Tuple<double[],bool>[] examplesb = new Tuple<double[], bool>[n-devi];
				Array.Copy(examples,devi,examplesb,0,n-devi);
				node2 = FindBestBranch(examplesb,trueLeaf,falseLeaf);
			}
			if(node1 == node2) {
				if(node1 == trueLeaf) {
					return trueLeaf;
				}
				else {
					return falseLeaf;
				}
			}
			return new ID3TreeNodeBranch(maxIndex,maxThreshold,node1,node2);
		}
		private static double entropy (int pos, int neg) {
			double ppos = (double) pos/(pos+neg);
			double pneg = 1.0d-ppos;
			return -ppos*Math.Log(ppos)-pneg*Math.Log(pneg);
		}
		private static double complexEntropy (int postot, int negtot, int pos, int neg) {
			double psub = (double) (pos+neg)/(postot+negtot);
			return psub*entropy(pos,neg)+(1.0d-psub)*entropy(postot-pos,negtot-neg);
		}
		
	}
}

