using System;
using System.Collections.Generic;

namespace MLTag {

	public static class ID3Tree {
		
		public static ID3TreeNode FindBestBranch (Tuple<double[],bool>[] examples, ID3TreeNodeLeaf trueLeaf, ID3TreeNodeLeaf falseLeaf) {
			return FindBestBranch(examples,0,examples.Length,trueLeaf,falseLeaf);
		}
		public static ID3TreeNode FindBestBranch (Tuple<double[],bool>[] examples, int offset, int length, ID3TreeNodeLeaf trueLeaf, ID3TreeNodeLeaf falseLeaf) {
			int maxIndex;
			double maxThreshold;
			if(examples.Length <= 1) {
				throw new ArgumentException("The number of examples must be at least 2.","examples");
			}
			int m = examples[0].Item1.Length;
			//calculating entropy
			int pos = 0, neg = 0;
			int end = offset+length;
			int end1 = end-1;
			for(int i = offset; i < end; i++) {
				if(examples[i].Item2) {
					pos++;
				}
			}
			neg = length-pos;
			double maxGain = double.MinValue;
			maxIndex = -1;
			maxThreshold = double.NaN;
			int subpos, subneg;
			double gain;
			for(int index = 0; index < m; index++) {
				Array.Sort(examples,offset,length,new SubComparer(index));
				subpos = 0; subneg = 0;
				for(int ithreshold = offset; ithreshold < end1; ithreshold++) {
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
			Array.Sort(examples,offset,length,new SubComparer(maxIndex));
			subneg = 0; subpos = 0;
			int devi = offset;
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
				node1 = FindBestBranch(examples,offset,devi-offset,trueLeaf,falseLeaf);
			}
			if(neg-subneg == end-devi) {
				node2 = falseLeaf;
			}
			else if(pos-subpos == end-devi) {
				node2 = trueLeaf;
			}
			else {
				node2 = FindBestBranch(examples,devi,end-devi,trueLeaf,falseLeaf);
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
		
		private class SubComparer : IComparer<Tuple<double[],bool>> {
			
			private readonly int index;
			
			public SubComparer (int index) {
				this.index = index;
			}
			
			#region IComparer[Tuple[System.Double[],System.Boolean]] implementation
			public int Compare (Tuple<double[], bool> x, Tuple<double[], bool> y) {
				return x.Item1[index].CompareTo(y.Item1[index]);
			}
			#endregion
		}
		
	}
}

