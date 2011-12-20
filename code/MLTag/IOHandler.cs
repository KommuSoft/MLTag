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
			while(true) {
				Console.WriteLine(StringUtils.Compute(Console.ReadLine(),4));
			}
			/*MaximumQueue<double> queue = new MaximumQueue<double>(3);
			Random rand = new Random();
			for(int i = 0; i < 200; i++) {
				double ra = rand.NextDouble();
				Console.WriteLine("Adding {0}",ra);
				queue.Add(ra);
				Console.WriteLine("Queue is now: {0}",queue);
			}//*/
			FileStream fs = File.Open("lang.dat",FileMode.Open,FileAccess.Read);
			StringUtils.ReadConfigStream(fs);
			fs.Close();
			/*
			fs = File.Open("todos2",FileMode.Open,FileAccess.Read);
			TextReader tre = new StreamReader(fs);
			string stri = tre.ReadLine();
			List<string> lines = new List<string>();
			while(stri != null) {
				Match M = trainingRegex.Match(stri);
				lines.Add(M.Groups[1].Value.ToLowerInvariant());
				stri = tre.ReadLine();
			}
			tre.Close();
			fs.Close();
			double relMax;
			double rel;
			string striMax = string.Empty;
			DateTime dt = DateTime.Now;
			double[][] relTable = new double[lines.Count][];
			for(int i = 0; i < lines.Count; i++) {
				relMax = -1.0d;
				relTable[i] = new double[lines.Count];
				for(int j = 0; j < lines.Count; j++) {
					rel = StringUtils.SentenceRelevance(lines[i],lines[j]);
					if(rel > relMax) {
						relMax = rel;
						striMax = lines[j];
					}
					relTable[i][j] = rel;
				}
				//Console.WriteLine("MAX OF \"{0}\" IS \"{1}\" WITH {2}",lines[i],striMax,relMax);
			}
			DateTime dt2 = DateTime.Now;
			Console.WriteLine((lines.Count*lines.Count/(dt2-dt).TotalSeconds)+" instances/second");
			FileStream tab = new FileStream("raw.dat",FileMode.Create,FileAccess.Write);
			TextWriter tabw = new StreamWriter(tab);
			foreach(double[] data in relTable) {
				tabw.WriteLine(string.Join("\t",data));
				Array.Sort(data);
			}
			tabw.Close();
			tab.Close();
			tab = new FileStream("sorted.dat",FileMode.Create,FileAccess.Write);
			tabw = new StreamWriter(tab);
			for(int i = 0; i < lines.Count; i++) {
				double avg = 0.0d;
				for(int j = 0; j < lines.Count; j++) {
					avg += relTable[j][i];
					tabw.Write(relTable[j][i].ToString(NumberFormatInfo.InvariantInfo)+"\t");
				}
				tabw.Write((avg/lines.Count).ToString(NumberFormatInfo.InvariantInfo));
				tabw.WriteLine();
			}
			tabw.Close();
			tab.Close();*/
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
			//vs.AddRecommender(new NeuralNetworkRecommender());
			//vs.AddRecommender (new CustomRecommender (tags.Length));
			//vs.AddRecommender (new ID3Recommender(0.7d));
			vs.AddRecommender (new NearestNeighbourRecommender());
			Console.WriteLine("train");
			#region Training
			Stream s = File.Open(args[0],FileMode.Open,FileAccess.Read);
			TextReader r = new StreamReader(s);
			string line = r.ReadLine();
			while(line != null) {
				Query(line);
				line = r.ReadLine();
			}//*/
			#endregion
			/*while(line != null) {
				Console.WriteLine(string.Join("-",StringUtils.ToSyllables(line)));
				line = tr.ReadLine();
			}*/
			///*
			/*List<string> words = new List<string>();
			fs = File.Open("words",FileMode.Open,FileAccess.Read);
			TextReader wr = new StreamReader(fs);
			line = wr.ReadLine();
			while(line != null) {
				words.Add(line);
				line = wr.ReadLine();
			}
			wr.Close();
			fs.Close();
			fs = File.Open("wordrel.txt",FileMode.Create,FileAccess.Write);
			TextWriter tw = new StreamWriter(fs);
			DateTime dt = DateTime.Now;
			int l = 0;
			for(int i = 0; i < words.Count; i++) {
				for(int j = i+1; j < words.Count; j++) {
					float rel = StringUtils.GetRelevance(words[i],words[j]);
					l++;
					if(rel >= 0.75f) {
						tw.WriteLine("{0} <> {1}: {2}",words[i],words[j],rel);
					}
				}
			}
			tw.Close();
			fs.Close();
			DateTime other = DateTime.Now;
			Console.WriteLine("Took {0} for {1} instances, that's {2} instances/second",other-dt,l,(float) l/(other-dt).TotalSeconds);
			Console.ReadLine();
			Console.WriteLine("-----------------------");
			for(int i = 0; i < words.Count; i++) {
				for(int j = i+1; j < words.Count; j++) {
					float rel;
					StringUtils.LevenshteinDistance(StringUtils.ToSyllables(words[i]),StringUtils.ToSyllables(words[j]),out rel);
					rel *= rel;
					if(rel > 0.4f) {
						Console.WriteLine("{0} <> {1}: {2}",words[i],words[j],rel);
					}
				}
			}//*/
			/*
			line = tr.ReadLine();
			string otherline;
			while(line != null) {
				otherline = tr.ReadLine();
				float rela, relb;
				line = line.Replace(" ","-");
				otherline = otherline.Replace(" ","-");
				Console.WriteLine(string.Join("-",StringUtils.ToSyllables(line)));
				Console.WriteLine(string.Join("-",StringUtils.ToSyllables(otherline)));
				Console.WriteLine(StringUtils.GetRelevance(line,otherline));
				line = tr.ReadLine();
			}//*/
			/*
			line = tr.ReadLine();
			while(line != null) {
				foreach(Tuple<string,double> t in Query(line)) {
					Console.WriteLine("{0}/{1}",t.Item1,t.Item2);
				}
				Console.Write("> ");
				line = tr.ReadLine();
			}//*/
			#region TestInner
			s.Position = 0;
			line = r.ReadLine();
			Console.WriteLine("Inner test");
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
			Console.WriteLine("Outer test");
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