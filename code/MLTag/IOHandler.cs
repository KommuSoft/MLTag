using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.IO;

namespace MLTag {

	public class IOHandler {

		private static readonly Regex trainingRegex = new Regex (@"^([^#]+)( +#([^# ]+))+ *$", RegexOptions.Compiled);
		private static VotingSystem vs;
		
		public IOHandler () {
		}
		
		public static void Train (string text, IList<string> tags) {
			vs.Train(text,tags);
		}
		
		public static IEnumerable<Tuple<string,double>> Recommend (string text) {
			return vs.TagFiltered (text);
		}

		public static IEnumerable<Tuple<string,double>> Query (string line) {
			Match m = trainingRegex.Match (line);
			if (m.Success) {//training data
				string text = m.Groups [1].Value;
				List<String > tags = new List<String> ();
				foreach (Capture c in m.Groups[3].Captures) {
					tags.Add (c.Value);
				}
				Train (text, tags);
				return null;
			} else {//query
				return Recommend (line);
			}
		}
		
		public static int Main (string[] args) {//run met "mono MLTag.exe training"
			string[] tags = new string[]{"shop","sport","travel","home","reading","work","mlcourse","family","appointment","chore","urgent","school","finance","leisure","friends"};
			vs = new VotingSystem (tags);
			vs.AddRecommender (new CustomRecommender ());
			if (args.Length > 0) {
				Stream s = File.Open (args [0], FileMode.Open, FileAccess.Read);
				TextReader r = new StreamReader (s);
				string line = r.ReadLine ();
				while (line != null) {
					Query (line);
					line = r.ReadLine ();
				}
				r.Close ();
				s.Close ();
			}
			while (true) {
				Console.WriteLine ();
				Console.WriteLine ("Type in Training data or Query?");
				string line = Console.ReadLine ().ToLower ();
				//line = line.Substring(0,line.Length-1);
				IEnumerable<Tuple<string, double >> result = Query (line);

				if (result == null) {
					Console.WriteLine ("training successfull");
				} else {
					Console.WriteLine ("recommend the following:");
					foreach (Tuple<string, double> t in result) {
						Console.WriteLine ("{0}: {1}", t.Item1, t.Item2);
					}
				}
			}
		}

	}

}