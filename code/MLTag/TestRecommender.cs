using System;

namespace MLTag {

	public class TestRecommender : Recommender {
		#region Recommender implementation
		public void EndTrainingSession ()
		{
			Console.WriteLine("endTraining");
		}

		public void Train (string text, System.Collections.Generic.IList<int> tags)
		{
			Console.WriteLine();
		}

		public System.Collections.Generic.IEnumerable<double> Tag (string text)
		{
			throw new NotImplementedException ();
		}

		public int NumberOfTags {
			get {
				throw new NotImplementedException ();
			}
			set {
				throw new NotImplementedException ();
			}
		}
		#endregion
		
	}
	
}