using System;
using System.Collections.Generic;

namespace MLTag {
	
	public class TrueNegativesMetric : EvaluationMetric {
		
		private int counter = 0;
		private readonly int l;
		
		public TrueNegativesMetric (int l) : base("TrueNegatives") {
			this.l = l;
		}
		
		#region implemented abstract members of MLTag.Metric
		public override double Result {
			get {
				return counter;
			}
		}

		public override void Process (IEnumerable<string> expected, IEnumerable<string> result) {
			HashSet<string> union = new HashSet<string>(expected);
			union.UnionWith(result);
			counter += l-union.Count;
		}

		public override void Reset () {
			counter = 0;
		}
		#endregion
	
	}
}

