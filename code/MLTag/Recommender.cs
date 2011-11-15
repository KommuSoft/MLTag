using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MLTag
{

    using Tag = String;
    public interface Recommender
    {
        public int NumberOfTags {
            get;
            set;
        }
        public void Train(String text,IList<int> tags);

        /// <invar>return.Length == NumberOfTags</invar>
        /// <summary>
        /// </summary>
        /// <param name="text"></param>
        /// <returns></returns>
        public IList<Double> Tag(String text);
    }

    public class VotingSystem : Recommender {
        private List<Recommender> rcs = new List<Recommender>();
        private Dictionary<Tag, int> dict = new Dictionary<Tag, int>();
        private IOrderedEnumerable<Tag> tags;
        private double treshold = 0.6d;
        private int nbTags;

        public int NumberOfTags {
            get {
                return nbTags;
            }
            set {
                nbTags = value;
            }
        }

        public VotingSystem(ICollection<Tag> tags) {
            int c = 0;
            this.tags = tags.OrderBy(x => x);
            foreach (Tag tag in this.tags) {
                dict.Add(tag, c);
                c++;
            }
            NumberOfTags = c;
        }

        public void AddRecommender(Recommender r) {
            rcs.Add(r);
            r.NumberOfTags = NumberOfTags;
        }

        public void Train(string text, IList<Tag> tags) {
            IList<int> tagNbs = new List<int>();
            foreach (string t in tags) {
                tagNbs.Add(dict[t]);
            }
            Train(text, tagNbs);
        }

        public void Train(string text, IList<int> tags) {
            foreach (Recommender r in rcs) {
                r.Train(text, tags);
            }
        }

        public IEnumerable<double> Tag(string text) {
            IEnumerable<double> total = new List<double>(NumberOfTags);
            foreach(Recommender r in rcs){
                IList<double> cur = r.Tag(text);
                total = total.Zip(cur, (x,y) => x+y);
            }
            total = total.Select((x) => x / NumberOfTags);

            return total;
        }

        public IEnumerable<Tuple<Tag,double>> TagFiltered(string text) {
            IEnumerable<double> ret = Tag(text);
            
            return ret.Zip(tags, (x, y) => new Tuple<Tag, double>(y, x));
        }
    }
}
