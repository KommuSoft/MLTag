using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.IO;

namespace MLTag {

    public class IOHandler {

		private const double treshold = 0.4d;
		private static readonly Regex trainingRegex = new Regex(@"^([^#]+)( +#([^# ]+))+ *$",RegexOptions.Compiled);
		
		public IOHandler () {
		}
		
		public void Train (string text, ICollection<string> tags) {
		}
		
		public List<Tuple<string,double>> Recommend (string text) {
			
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
        
        public static int Main(string[] args) {//run met "mono MLTag.exe todos"
            TagRecommendation tr = new TagRecommendation();
            if (args.Length > 0) {
                Stream s = File.Open(args[0], FileMode.Open, FileAccess.Read);
                TextReader r = new StreamReader(s);
                string line = r.ReadLine();
                while (line != null) {
                    tr.Query(line);
                    line = r.ReadLine();
                }
                r.Close();
                s.Close();
            }
            while (true) {
                Console.WriteLine();
                Console.WriteLine("Type in Training data or Query?");
                string line = Console.ReadLine().ToLower();
                //line = line.Substring(0,line.Length-1);
                List<Tuple<string, double>> result = tr.Query(line);

                if (result == null) {
                    Console.WriteLine("training successfull");
                } else {
                    Console.WriteLine("recommend the following:");
                    foreach (Tuple<string, double> t in result) {
                        Console.WriteLine("{0}: {1}", t.Item1, t.Item2);
                    }
                }
            }
        }

    }

}