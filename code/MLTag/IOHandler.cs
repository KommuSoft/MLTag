using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.IO;
using System.Globalization;
using Lucene.Net.Analysis.Snowball;
using Lucene.Net.Analysis;
using Lucene.Net.Analysis.Standard;

namespace MLTag {

	public class IOHandler {

		private static readonly Regex trainingRegex = new Regex (@"( +#([^# ]+))+ *$", RegexOptions.Compiled);
		private static VotingSystem vs;
		private static List<EvaluationMetric> metrics = new List<EvaluationMetric>();
		private static int TRAIN_PERCENTAGE = 50;
		private static NumberFormatInfo nfi = NumberFormatInfo.InvariantInfo;
		
		public IOHandler () {
		}
		
		public static void Train (string text, IList<string> tags) {
			vs.Train(text,tags);
		}
		public static void Train (string line) {
			string text;
			List<String> tags = ParseTags(line,out text);
			Train(text,tags);
		}
		
		public static IEnumerable<Tuple<string,double>> Recommend (string text) {
			return vs.TagFiltered (text);
		}
		public static List<String> ParseTags (string line, out string text) {
			Match m = trainingRegex.Match (line);
			text = line.Substring(0,line.Length-m.Groups[0].Value.Length);
			List<String> tags = new List<String> ();
			foreach (Capture c in m.Groups[2].Captures) {
				tags.Add(c.Value);
			}
			return tags;
		}
		public static IEnumerable<Tuple<string,double>> Query (string line) {
			Match m = trainingRegex.Match (line);
			if (m.Success) {//training data
				Train(line);
				return null;
			} else {//query
				return Recommend (line);
			}
		}
		public static void Test (string line) {
			string text;
			List<String> tags = ParseTags(line,out text);
			IEnumerable<String> result = vs.TagFiltered(text).Select(x => x.Item1);
			foreach(EvaluationMetric m in metrics) {
				m.Process(tags,result);
			}
		}
		
		public static int Main (string[] args) {
            args = new string[]{"todos2"};
			
			Stream s = File.Open(args[0],FileMode.Open,FileAccess.Read);
			List<string> total = new List<string>(readLines(s));
			s.Close();
			
			string[] tags = new string[]{"shop","sport","travel","home","reading","work","mlcourse","family","appointment","chore","urgent","school","finance","leisure","friends"};
			metrics.Add(new TruePositivesMetric());
			metrics.Add(new FalsePositivesMetric());
			metrics.Add(new TrueNegativesMetric(tags.Length));
			metrics.Add(new FalseNegativesMetric());
			metrics.Add(new PrecisionMetric());
			metrics.Add(new RecallMetric());
			metrics.Add(new AccuracyMetric());
			metrics.Add(new FMeasureMetric());
			metrics.Add(new HammingLossMetric(tags.Length));
			
			FileStream fsin = File.Open("innerstats.dat",FileMode.Create,FileAccess.Write);
			FileStream fsou = File.Open("outerstats.dat",FileMode.Create,FileAccess.Write);
			TextWriter twin = new StreamWriter(fsin);
			TextWriter twou = new StreamWriter(fsou);
			twin.Write("#k");
			twou.Write("#k");
			foreach(EvaluationMetric m in metrics) {
				twin.Write("\t{0}",m.Name);
				twou.Write("\t{0}",m.Name);
			}
			twou.WriteLine();
			twin.WriteLine();
			
			for(int pct = 2; pct < 100; pct++) {
				
				TRAIN_PERCENTAGE = pct;
				
				for(int sam = 0; sam < 10; sam++) {
			
					vs = new VotingSystem (tags);
					//vs.AddRecommender(new NeuralNetworkRecommender());
					//vs.AddRecommender (new CustomRecommender (tags.Length));
					//vs.AddRecommender (new ID3Recommender(0.7d));
					//vs.AddRecommender (new NearestNeighbourRecommender());
					//vs.AddRecommender(new C45Recommender(tags));
					//vs.AddRecommender(new MLkNNRecommender(tags.Count()));
					vs.AddRecommender(new VectorClassif(tags.Count()));
					//vs.AddRecommender(new C45Recommender());
					
					Console.WriteLine("train");
					List<string> test = new List<string>(total);
					List<string> train = new List<string>();
					int tp = TRAIN_PERCENTAGE*test.Count/100;
					Random rand = new Random();
					for(int i = 0; i < tp; i++) {
						int k = rand.Next(test.Count);
						train.Add(test[k]);
						test.RemoveAt(k);
					}
					#region Training
					foreach(string l in train) {
						Query(l);
					}
					vs.EndTrainingSession();
					#endregion
					#region TestInner
					foreach(string l in train) {
						Test(l);
					}
					twin.Write(pct);
					//Console.WriteLine("Inner Results:");
					foreach(EvaluationMetric m in metrics) {
						//Console.WriteLine("\t{0} = {1}",m.Name,m.Result);
						twin.Write("\t{0}",m.Result.ToString(nfi));
						m.Reset();
					}
					twin.WriteLine();
					#endregion
					#region TestOuter
					foreach(string l in test) {
						Test(l);
					}
					twou.Write(pct);
					//Console.WriteLine("Outer Results:");
					foreach(EvaluationMetric m in metrics) {
						//Console.WriteLine("\t{0} = {1}",m.Name,m.Result);
						twou.Write("\t{0}",m.Result.ToString(nfi));
						m.Reset();
					}
					twou.WriteLine();
					#endregion
				}
				twin.Flush();
				twou.Flush();
			}
			
			twin.Close();
			twou.Close();
			fsin.Close();
			fsou.Close();
			
			#region testFree
			string line = Console.ReadLine();
			while(line != "exit") {
				foreach(Tuple<string,double> kvp in vs.TagFiltered(line)) {
					Console.WriteLine("{0} / {1}",kvp.Item1,kvp.Item2);
				}
				Console.WriteLine("-----------------");
				line = Console.ReadLine();
			}
			#endregion
			return 0;
		}
		
		private static IEnumerable<string> readLines (Stream s) {
			TextReader r = new StreamReader(s);
			string line = r.ReadLine();
			while(line != null) {
				yield return line;
				line = r.ReadLine();
			}
			r.Close();
		}

	}

}
