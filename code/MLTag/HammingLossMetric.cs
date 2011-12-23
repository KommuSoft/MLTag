using System;
using System.Collections.Generic;

namespace MLTag {
	
	public class HammingLossMetric : EvaluationMetric {
		
		private int d = 0;
		private readonly int l;
		private double score = 0.0d;
		
		public HammingLossMetric (int l) : base("HammingLoss") {
			this.l = l;
		}

		#region implemented abstract members of MLTag.Metric
		public override double Result {
			get {
				return score/(d*l);
			}
		}
		public override void Process (IEnumerable<string> expected, IEnumerable<string> result) {
			d++;
			HashSet<string> delta = new HashSet<string>(expected);
			delta.UnionWith(result);
			HashSet<string> section = new HashSet<string>(expected);
			section.IntersectWith(result);
			delta.ExceptWith(section);
			score += (double) delta.Count;
		}

		public override void Reset () {
			this.d = 0;
			this.score = 0.0d;
		}
		#endregion
	}
}

