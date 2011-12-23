using System;
using System.Collections.Generic;

namespace MLTag {
	
	public class AccuracyMetric : EvaluationMetric {
		
		private int d = 0;
		private double score = 0.0d;
		
		public AccuracyMetric () : base("Accuracy") {
		}

		#region implemented abstract members of MLTag.Metric
		public override double Result {
			get {
				return score/d;
			}
		}
		public override void Process (IEnumerable<string> expected, IEnumerable<string> result) {
			HashSet<string> section = new HashSet<string>(expected);
			HashSet<string> union = new HashSet<string>(expected);
			union.UnionWith(result);
			int n = union.Count;
			if(n != 0) {
				section.IntersectWith(result);
				score += (double) section.Count/union.Count;
				d++;
			}
		}

		public override void Reset () {
			this.d = 0;
			this.score = 0.0d;
		}
		#endregion
	}
}

