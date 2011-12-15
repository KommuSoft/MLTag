﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.IO;
using System.Globalization;
using Lucene.Net.Analysis;
using Lucene.Net.Analysis.Standard;

namespace MLTag {

	public class IOHandler {

		private static readonly Regex trainingRegex = new Regex (@"^([^#]+)( +#([^# ]+))+ *$", RegexOptions.Compiled);
		private static VotingSystem vs;
		private static List<Metric> metrics = new List<Metric>();
		
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
		
		public static int Main (string[] args) {//run met "mono MLTag.exe trainfile testfile ?logfile"
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
			metrics.Add(new HammingLossMetric(tags.Length));
			vs = new VotingSystem (tags);
			vs.AddRecommender (new CustomRecommender (tags.Length));
			#region Training
			Stream s = File.Open(args[0],FileMode.Open,FileAccess.Read);
			TextReader r = new StreamReader(s);
			string line = r.ReadLine();
			while(line != null) {
				Query(line);
				line = r.ReadLine();
			}
			#endregion
			TextReader tr = Console.In;
			line = tr.ReadLine();
			while(line != null) {
				foreach(string str in StringUtils.ToSyllables(line)) {
					Console.Write("-{0}",str);
				}
				foreach(Tuple<string,double> t in Query(line)) {
					Console.WriteLine("{0}/{1}",t.Item1,t.Item2);
				}
				line = tr.ReadLine();
			}
			/*#region TestInner
			s.Position = 0;
			line = r.ReadLine();
			while(line != null) {
				Test(line);
				line = r.ReadLine();
			}
			r.Close();
			s.Close();
			Console.WriteLine("Inner Results:");
			foreach(Metric m in metrics) {
				Console.WriteLine("\t{0} = {1}",m.Name,m.Result);
				m.Reset();
			}
			#endregion
			#region TestOuter
			s = File.Open(args[1],FileMode.Open,FileAccess.Read);
			r = new StreamReader(s);
			line = r.ReadLine();
			while(line != null) {
				Test(line);
				line = r.ReadLine();
			}
			r.Close();
			s.Close();
			Console.WriteLine("Outer Results:");
			foreach(Metric m in metrics) {
				Console.WriteLine("\t{0} = {1}",m.Name,m.Result);
			}
			#endregion
			#region writeLogs
			TextWriter tw;
			if(args.Length >= 3) {
				if(!File.Exists(args[2])) {
					s = File.Open(args[2],FileMode.Create,FileAccess.Write);
					tw = new StreamWriter(s);
					tw.Write("#");
					foreach(Metric m in metrics) {
						tw.Write("{0}\t",m.Name);
					}
					tw.Write("Comment");
				}
				else {
					s = File.Open(args[2],FileMode.Append,FileAccess.Write);
					tw = new StreamWriter(s);
				}
				tw.WriteLine();
				foreach(Metric m in metrics) {
					tw.Write("{0}\t",m.Result.ToString(NumberFormatInfo.InvariantInfo));
				}
				if(args.Length >= 4) {
					tw.Write(args[3]);//write comment about the sample
				}
				tw.Close();
				s.Close();
			}
			#endregion
			return 0;
			/*if (args.Length > 0) {
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
			}*/
			return 0;
		}

	}

}