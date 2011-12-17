using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MLTag {
	
	using Tag = String;

	public interface Recommender {
		int NumberOfTags {
			get;
			set;
		}

		void EndTrainingSession ();
		
		void Train (String text, IList<int> tags);

		/// <invar>return.Length == NumberOfTags</invar>
		/// <summary>
		/// </summary>
		/// <param name="text"></param>
		/// <returns></returns>
		IEnumerable<Double> Tag (String text);
	}

}
