using System;
using System.Collections.Generic;

namespace MLTag {
	
	public class RecallMetric : Metric {
		
		private int d = 0;
		private double score = 0.0d;
		
		public RecallMetric () : base("Recall") {
		}

		#region implemented abstract members of MLTag.Metric
		public override double Result {
			get {
				return score/d;
			}
		}
		public override void Process (IEnumerable<string> expected, IEnumerable<string> result) {
			HashSet<string> section = new HashSet<string>(expected);
			int y = section.Count;
			if(y != 0) {
				d++;
				section.IntersectWith(result);
				score += (double) section.Count/y;
			}
		}

		public override void Reset () {
			this.d = 0;
			this.score = 0.0d;
		}
		#endregion
	}
}

