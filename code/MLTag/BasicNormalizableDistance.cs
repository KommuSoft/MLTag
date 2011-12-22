using System;
using weka.core;

namespace MLTag {

	public class BasicNormalizableDistance : NormalizableDistance {

		public BasicNormalizableDistance() {
		}

		public override string getRevision() {
			throw new NotImplementedException();
		}

		public override string globalInfo() {
			throw new NotImplementedException();
		}

		protected override double updateDistance(double currDist, double diff) {
			return (currDist + (diff * diff));
		}

		public override double distance(Instance first, Instance second, double cutOffValue, PerformanceStats stats) {
			double sqDistance = 0;
			int numAttributes = m_Data.numAttributes();

			validate();

			double diff;

			for (int i = 0; i < numAttributes; i++) {
				diff = 0;
				if (m_ActiveIndices[i]) {
					diff = difference(i, first.stringValue(i), second.stringValue(i));
				}
				sqDistance = updateDistance(sqDistance, diff);
				if (sqDistance > (cutOffValue * cutOffValue)) return Double.PositiveInfinity;
			}
			double distance = Math.Sqrt(sqDistance);
			return distance;
		}

		protected double difference(int index, String string1, String string2) {
			switch (m_Data.attribute(index).type()) {
				case weka.core.Attribute.STRING:
					double diff = stringDistance(string1, string2);
					if (m_DontNormalize == true) {
						return diff;
					} else {
						if (string1.Count() > string2.Count()) {
							return diff / ((double)string1.Count());
						} else {
							return diff / ((double)string2.Count());
						}
					}

				default:
					return 0;
			}
		}



		public abstract double stringDistance(String stringA, String stringB);

		
	}
}

