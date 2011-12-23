using System;
using System.Collections.Generic;

namespace MLTag {
	
	public abstract class EvaluationMetric {
		
		private readonly string name;
		
		public string Name {
			get {
				return name;
			}
		}
		public abstract double Result {
			get;
		}
		
		protected EvaluationMetric (string name) {
			this.name = name;
		}
		
		public abstract void Process(IEnumerable<String> expected, IEnumerable<String> result);
		public abstract void Reset ();
		
	}
	
}