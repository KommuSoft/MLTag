using System;
using System.Linq;

namespace MLTag {

	public class ID3TreeNodeBranch : ID3TreeNode {
		
		private int index;
		private double threshold;
		private ID3TreeNode node1;
		private ID3TreeNode node2;
		
		public ID3TreeNodeBranch (int index, double threshold, ID3TreeNode node1, ID3TreeNode node2) {
			this.index = index;
			this.threshold = threshold;
			this.node1 = node1;
			this.node2 = node2;
		}
		
		public override bool Evaluate (double[] arguments) {
			if(arguments[index] < threshold) {
				return this.node1.Evaluate(arguments);
			}
			else {
				return this.node2.Evaluate(arguments);
			}
		}
		public override string ToString (string[] attributeNames) {
			string nodea = node1.ToString(attributeNames).Replace("\n","\n|  ");
			string nodeb = node2.ToString(attributeNames).Replace("\n","\n   ");
			return string.Format("([{0}] < {1})\n+--{2}\n\\--{3}",attributeNames[this.index],this.threshold,nodea,nodeb);
		}
		public override string ToString () {
			string nodea = node1.ToString().Replace("\n","\n|  ");
			string nodeb = node2.ToString().Replace("\n","\n   ");
			return string.Format("([{0}] < {1})\n+--{2}\n\\--{3}",this.index,this.threshold,nodea,nodeb);
		}
		
	}
	
}