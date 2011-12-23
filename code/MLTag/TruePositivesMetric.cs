using System;
using System.Collections.Generic;

namespace MLTag {
	
	public class TruePositivesMetric : EvaluationMetric {
		
		private int counter = 0;
		
		public TruePositivesMetric () : base("TruePositives") {}
		
		#region implemented abstract members of MLTag.Metric
		public override double Result {
			get {
				return counter;
			}
		}

		public override void Process (IEnumerable<string> expected, IEnumerable<string> result) {
			HashSet<string> section = new HashSet<string>(expected);
			section.IntersectWith(result);
			counter += section.Count;
		}

		public override void Reset () {
			counter = 0;
		}
		#endregion
	
	}
}

