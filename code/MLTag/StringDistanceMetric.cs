using System;

namespace MLTag {

	public interface StringDistanceMetric {
		
		double GetDistance (string a, string b);
		
	}
}

