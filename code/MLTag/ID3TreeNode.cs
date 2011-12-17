using System;

namespace MLTag {

	public abstract class ID3TreeNode {
		
		public abstract bool Evaluate (double[] arguments);
		public abstract string ToString (string[] attributeNames);
		
	}
}

