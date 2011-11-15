using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MLTag
{
    public class Tag {
        private String tagName;

        public String TagName {
            get { return tagName; }
            set { tagName = value; }
        }        
    }

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

    public class VotingSystem : Recommender
    {
        private List<Recommender> rcs = new List<Recommender>();
        private Dictionary<String, int> dict = new Dictionary<String, int>();
        private int nbTags;

        public int NumberOfTags {
            get {
                return nbTags;
            }
            set {
                nbTags = value;
            }
        }

        public VotingSystem(ICollection<String> tags) {
            int c = 0;
            foreach (string tag in tags) {
                dict.Add(tag, c);
                c++;
            }
            NumberOfTags = c;
        }

        public void AddRecommender(Recommender r) {
            rcs.Add(r);
            r.NumberOfTags = NumberOfTags;
        }

        public void Train(string text, IList<string> tags) {
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

        public IList<double> Tag(string text) {
            throw new NotImplementedException();
        }
    }
}
