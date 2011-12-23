using System;
using System.Collections.Generic;

namespace MLTag {
	
	public class FMeasureMetric : EvaluationMetric {
		
		private int d = 0;
		private double score = 0.0d;
		
		public FMeasureMetric () : base("F-measure") {
		}

		#region implemented abstract members of MLTag.Metric
		public override double Result {
			get {
				return score/d;
			}
		}
		public override void Process (IEnumerable<string> expected, IEnumerable<string> result) {
			HashSet<string> section = new HashSet<string>(expected);
			int nx = section.Count;
			List<string> other = new List<string>(result);
			int ny = other.Count;
			section.IntersectWith(result);
			int x = section.Count;
			d++;
			score += (double) 2.0d*x/(nx+ny);
		}

		public override void Reset () {
			this.d = 0;
			this.score = 0.0d;
		}
		#endregion
	}
}

