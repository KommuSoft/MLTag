using System;
using System.Collections.Generic;

namespace MLTag {
	
	public class PrecisionMetric : EvaluationMetric {
		
		private int d = 0;
		private double score = 0.0d;
		
		public PrecisionMetric () : base("Precision") {
		}

		#region implemented abstract members of MLTag.Metric
		public override double Result {
			get {
				return score/d;
			}
		}
		public override void Process (IEnumerable<string> expected, IEnumerable<string> result) {
			HashSet<string> section = new HashSet<string>(result);
			int z = section.Count;
			if(z != 0) {
				d++;
				section.IntersectWith(expected);
				score += (double) section.Count/z;
			}
		}

		public override void Reset () {
			this.d = 0;
			this.score = 0.0d;
		}
		#endregion
	}
}

