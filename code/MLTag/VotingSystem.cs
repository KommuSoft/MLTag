using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MLTag {
	
	using Tag = String;

	public class VotingSystem : Recommender {
		
		private List<Recommender> rcs = new List<Recommender> ();
		private Dictionary<Tag, int> dict = new Dictionary<Tag, int> ();
		private IOrderedEnumerable<Tag> tags;
		private double threshold = 0.5d;
		private int nbTags;
		private bool train = true;

		public int NumberOfTags {
			get {
				return nbTags;
			}
			set {
				nbTags = value;
			}
		}
		public double Threshold {
			get {
				return this.threshold;
			}
			set {
				this.threshold = value;
			}
		}

		public VotingSystem (ICollection<Tag> tags) {
			int c = 0;
			this.tags = tags.OrderBy (x => x);
			foreach (Tag tag in this.tags) {
				dict.Add (tag, c);
				c++;
			}
			NumberOfTags = c;
		}

		public void AddRecommender (Recommender r) {
			r.NumberOfTags = NumberOfTags;
			rcs.Add (r);
		}

		public void Train (string text, IList<Tag> tags) {
			IList<int> tagNbs = new List<int> ();
			foreach (string t in tags) {
				tagNbs.Add (dict [t]);
			}
			Train (text, tagNbs);
		}

		public void Train (string text, IList<int> tags) {
			this.train = true;
			foreach (Recommender r in rcs) {
				r.Train (text, tags);
			}
		}

		public IEnumerable<double> Tag (string text) {
			this.EndTrainingSession();
			IEnumerable<double> total = new double[NumberOfTags];
			foreach (Recommender r in rcs) {
				IEnumerable<double > cur = r.Tag (text);
				total = total.Zip (cur, (x,y) => x+y);
			}
			total = total.Select ((x) => x /rcs.Count);

			return total;
		}
		
		public void EndTrainingSession () {
			if(!this.train) {
				return;
			}
			this.train = false;
			foreach(Recommender r in this.rcs) {
				r.EndTrainingSession();
			}
		}

		public IEnumerable<Tuple<Tag,double>> TagFiltered (string text) {
			IEnumerable<double > ret = Tag (text);
            
			return ret
                .Zip (tags, (x, y) => new Tuple<Tag, double> (y, x))
                .OrderBy (x => -x.Item2)
                .Where (x => x.Item2 >= threshold);
		}
	}
}