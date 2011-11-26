using System;
using System.Collections.Generic;

namespace MLTag {
	
	public class AccuracyMetric : Metric {
		
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
			d++;
			HashSet<string> section = new HashSet<string>(expected);
			HashSet<string> union = new HashSet<string>(expected);
			section.IntersectWith(result);
			union.UnionWith(result);
			score += (double) section.Count/union.Count;
		}

		public override void Reset () {
			this.d = 0;
			this.score = 0.0d;
		}
		#endregion
	}
}

