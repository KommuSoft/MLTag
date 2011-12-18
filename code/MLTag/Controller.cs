using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.IO;

namespace MLTag {
    public class Controller {

        private static readonly string[] tags = new string[]{"shop","sport","travel","home","reading","work","mlcourse","family","appointment","chore","urgent","school","finance","leisure","friends"};
        private static readonly Regex trainingRegex = new Regex(@"^([^#]+)( +#([^# ]+))+ *$", RegexOptions.Compiled);
        private VotingSystem vs = new VotingSystem(tags);

        public Controller(string learnPath) {
            //vs.AddRecommender(new CustomRecommender(15));
            //vs.AddRecommender(new ID3Recommender(0.6d));
            vs.AddRecommender(new MLkNNRecommender());
            Stream s = File.Open(learnPath, FileMode.Open, FileAccess.Read);
            TextReader r = new StreamReader(s);
            string line = r.ReadLine();
            while (line != null) {
                Train(line);
                line = r.ReadLine();
            }
            vs.EndTrainingSession();
        }

        public void Train(string line) {
            string text;
            List<String> tags = ParseTags(line, out text);
            vs.Train(text, tags);
        }

        public IEnumerable<Tuple<string,double>> Tag(string query) {
            return vs.TagFiltered(query);
        }

        public static List<String> ParseTags(string line, out string text) {
            Match m = trainingRegex.Match(line);
            text = m.Groups[1].Value;
            List<String> tags = new List<String>();
            foreach (Capture c in m.Groups[3].Captures) {
                tags.Add(c.Value);
            }
            return tags;
        }

    }
}
