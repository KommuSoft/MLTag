using System;

namespace MLTag {

	public class IngmarDistance : StringDistanceMetric{
		public IngmarDistance () {
		}

		#region StringDistanceMetric implementation
		public double GetDistance (string a, string b)
		{
			return 0.5;
		}
		#endregion
	}
}

