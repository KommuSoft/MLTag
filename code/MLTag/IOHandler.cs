﻿using System;
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

		private static readonly Regex trainingRegex = new Regex (@"^([^#]+)( +#([^# ]+))+ *$", RegexOptions.Compiled);
		private static VotingSystem vs;
		private static List<Metric> metrics = new List<Metric>();
		private const int TRAIN_PERCENTAGE = 95;
		
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
			text = m.Groups [1].Value;
			List<String> tags = new List<String> ();
			foreach (Capture c in m.Groups[3].Captures) {
				tags.Add (c.Value);
			}
			return tags;
		}
		public static IEnumerable<Tuple<string,double>> Query (string line) {
			Match m = trainingRegex.Match (line);
			if (m.Success) {//training data
				Train (line);
				return null;
			} else {//query
				return Recommend (line);
			}
		}
		public static void Test (string line) {
			string text;
			List<String> tags = ParseTags(line,out text);
			IEnumerable<String> result = vs.TagFiltered(text).Select(x => x.Item1);
			foreach(Metric m in metrics) {
				m.Process(tags,result);
			}
		}
		
		public static int Main (string[] args) {//run met "mono MLTag.exe trainfile+testfile ?logfile"
			FileStream fs = File.Open("lang.dat",FileMode.Open,FileAccess.Read);
			StringUtils.ReadConfigStream(fs);
			fs.Close();
			if(args.Length <= 1) {
				Console.WriteLine("INVALID PROGRAM USAGE!! Program format: MLTag train test");
				return 0;
			}
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
			vs = new VotingSystem (tags);
			
			//vs.AddRecommender(new NeuralNetworkRecommender());
			//vs.AddRecommender (new CustomRecommender (tags.Length));
			//vs.AddRecommender (new ID3Recommender(0.7d));
			//vs.AddRecommender (new NearestNeighbourRecommender());
			
			vs.AddRecommender(new C45Recommender(tags));
			Console.WriteLine("train");
			Stream s = File.Open(args[0],FileMode.Open,FileAccess.Read);
			List<string> test = new List<string>(readLines(s));
			List<string> train = new List<string>();
			s.Close();
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
			Console.WriteLine("Inner Results:");
			foreach(Metric m in metrics) {
				Console.WriteLine("\t{0} = {1}",m.Name,m.Result);
				m.Reset();
			}
			#endregion
			#region TestOuter
			foreach(string l in test) {
				Test(l);
			}
			Console.WriteLine("Outer Results:");
			foreach(Metric m in metrics) {
				Console.WriteLine("\t{0} = {1}",m.Name,m.Result);
			}
			#endregion
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