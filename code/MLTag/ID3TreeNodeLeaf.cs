using System;

namespace MLTag {

	public class ID3TreeNodeLeaf : ID3TreeNode {
		
		private readonly bool result;
		
		public ID3TreeNodeLeaf (bool result) {
			this.result = result;
		}
		
		public override bool Evaluate (double[] arguments) {
			return this.result;
		}
		public override string ToString () {
			return string.Format("|{0}|",this.result);
		}
		public override string ToString (string[] attributeNames) {
			return this.ToString();
		}
		
	}
	
}