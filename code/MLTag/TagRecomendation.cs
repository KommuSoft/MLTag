using System;
using System.Collections.Generic;
using System.IO;
using System.Text.RegularExpressions;

namespace MLTag {
	
	public class TagRecommendation : Recommender {
		
		private readonly Dictionary<TextVector,ICollection<string>> memory = new Dictionary<TextVector,ICollection<string>>();
		private const double treshold = 0.4d;
		private static readonly Regex trainingRegex = new Regex(@"^([^#]+)( +#([^# ]+))+ *$",RegexOptions.Compiled);
		
		public TagRecommendation () {
		}
		
		public void Train (string text, ICollection<string> tags) {
			memory.Add(new TextVector(text),tags);
		}
		
		public List<Tuple<string,double>> Recommend (string text) {
			TextVector tv = new TextVector(text);
			double total = 0.0d, score, temp;
			Dictionary<string,double> tags = new Dictionary<string,double>();
			foreach(KeyValuePair<TextVector,ICollection<string>> kvp in memory) {
				score = tv^kvp.Key;
				Console.WriteLine("score: {0}",score);
				total += score;
				foreach(string tag in kvp.Value) {
					if(!tags.TryGetValue(tag,out temp)) {
						tags.Add(tag,0.0d);
						temp = 0.0d;
					}
					tags[tag] = temp+score;
				}
			}
			List<Tuple<string,double>> result = new List<Tuple<string, double>>();
			if(total <= Double.Epsilon) {
				return result;
			}
			foreach(KeyValuePair<string,double> kvp in tags) {
				Console.WriteLine("Evaluating {0}/{1}",kvp.Key,kvp.Value/total);
				if(kvp.Value/total >= treshold) {
					result.Add(new Tuple<string,double>(kvp.Key,kvp.Value/total));
				}
			}
			return result;
		}
		public List<Tuple<string,double>> Query (string line) {
			Match m = trainingRegex.Match(line);
			if(m.Success) {//training data
				string text = m.Groups[1].Value;
				List<String> tags = new List<String>();
				foreach(Capture c in m.Groups[3].Captures) {
					tags.Add(c.Value);
				}
				Train(text,tags);
				return null;
			}
			else {//query
				return Recommend(line);
			}
		}
		
		public static int Main (string[] args) {//run met "mono MLTag.exe todos"
			TagRecommendation tr = new TagRecommendation();
			if(args.Length > 0) {
				Stream s = File.Open(args[0],FileMode.Open,FileAccess.Read);
				TextReader r = new StreamReader(s);
				string line = r.ReadLine();
				while(line != null) {
					tr.Query(line);
					line = r.ReadLine();
				}
				r.Close();
				s.Close();
			}
			while(true) {
				Console.WriteLine();
				Console.WriteLine("Type in Training data or Query?");
				string line = Console.ReadLine().ToLower();
				//line = line.Substring(0,line.Length-1);
				List<Tuple<string,double>> result = tr.Query(line);
				
				if(result == null) {
					Console.WriteLine("training successfull");
				}
				else {
					Console.WriteLine("recommend the following:");
					foreach(Tuple<string,double> t in result) {
						Console.WriteLine("{0}: {1}",t.Item1,t.Item2);
					}
				}
			}
		}


        public int NumberOfTags {
            get {
                throw new NotImplementedException();
            }
            set {
                throw new NotImplementedException();
            }
        }

        public void Train(string text, IList<int> tags) {
            throw new NotImplementedException();
        }

        public IEnumerable<double> Tag(string text) {
            throw new NotImplementedException();
        }
    }
}