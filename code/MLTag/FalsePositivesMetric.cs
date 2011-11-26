using System;
using System.Collections.Generic;

namespace MLTag {
	
	public class FalsePositivesMetric : Metric {
		
		private int counter = 0;
		
		public FalsePositivesMetric () : base("FalsePositives") {}
		
		#region implemented abstract members of MLTag.Metric
		public override double Result {
			get {
				return counter;
			}
		}

		public override void Process (IEnumerable<string> expected, IEnumerable<string> result) {
			HashSet<string> section = new HashSet<string>(result);
			section.ExceptWith(expected);
			counter += section.Count;
		}

		public override void Reset () {
			counter = 0;
		}
		#endregion
	
	}
}

