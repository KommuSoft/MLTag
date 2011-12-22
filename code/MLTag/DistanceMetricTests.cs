using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Text.RegularExpressions;
using System.Diagnostics;
using System.Linq;

namespace MLTag {

	public static class DistanceMetricTests {
		
		private static readonly Regex trainingRegex = new Regex (@"^([^#]+)( +#([^# ]+))+ *$", RegexOptions.Compiled);
		private static readonly NumberFormatInfo nfi = NumberFormatInfo.InvariantInfo;
		
		public static List<String> ParseTags (string line, out string text) {
			Match m = trainingRegex.Match (line);
			text = m.Groups [1].Value;
			List<String> tags = new List<String> ();
			foreach (Capture c in m.Groups[3].Captures) {
				tags.Add (c.Value);
			}
			return tags;
		}
		
		public static int Main (string[] args) {
			StringDistanceMetric metric = new LevenshteinWordDistance();
			List<List<string>> tags = new List<List<string>>();
			List<string> lines = new List<string>();
			Stream s = File.Open("todos2",FileMode.Open,FileAccess.Read);
			TextReader tr = new StreamReader(s);
			string line = tr.ReadLine();
			string text;
			while(line != null) {
				tags.Add(ParseTags(line,out text));
				lines.Add(text);
				line = tr.ReadLine();
			}
			tr.Close();
			s.Close();
			double max = double.NegativeInfinity;
			for(int i = 0; i < lines.Count; i++) {
				for(int j = i+1; j < lines.Count; j++) {
					max = Math.Max((double) metric.GetDistance(lines[i],lines[j]),max);
				}
			}
			s = File.Open("DistanceMetricResults.dat",FileMode.Create,FileAccess.Write);
			TextWriter tw = new StreamWriter(s);
			HashSet<string> xdiff = new HashSet<string>();
			//Dictionary<Tuple<double,double>,int> mem = new Dictionary<Tuple<double, double>, int>();
			int ndx = 20;
			int ndy = 40;
			int[] vari = new int[ndx+1];
			int[,] chart = new int[ndx+1,ndy+1];
			for(int i = 0; i < lines.Count; i++) {
				for(int j = i+1; j < lines.Count; j++) {
					xdiff.Clear();
					xdiff.UnionWith(tags[i]);
					xdiff.IntersectWith(tags[j]);
					double xdistance = 2.0d*xdiff.Count/(tags[i].Count+tags[j].Count);
					double distance = (double) metric.GetDistance(lines[i],lines[j]);
					//Tuple<double,double> pt = new Tuple<double, double>(xdistance,distance);
					chart[(int) Math.Floor(xdistance*ndx),(int) Math.Floor(distance*ndy/max)]++;
					vari[(int) Math.Floor(xdistance*ndx)]++;
				}
			}
			for(int i = 0; i <= ndx; i++) {
				if(vari[i] == 0) {
					vari[i] = 1;
				}
				for(int j = 0; j <= ndy; j++) {
					tw.WriteLine("{0}\t{1}\t{2}",((double) i/ndx).ToString(nfi),((double) j*max/ndy).ToString(nfi),((double) chart[i,j]/vari[i]).ToString(nfi));
				}
				tw.WriteLine();
			}
			/*List<KeyValuePair<Tuple<double,double>,int>> buff = new List<KeyValuePair<Tuple<double, double>, int>>();
			foreach(KeyValuePair<Tuple<double,double>,int> kvp in mem) {
				buff.Add(kvp);
				//tw.WriteLine("{0}\t{1}\t{2}",kvp.Key.Item1.ToString(nfi),kvp.Key.Item2.ToString(nfi),kvp.Value);
			}
			buff.Sort((x,y) => x.Key.Item1.CompareTo(y.Key.Item1));
			double old = double.NaN;*/
			/*foreach(KeyValuePair<Tuple<double,double>,int> kvp in buff) {
				if(old != kvp.Key.Item1) {
					tw.WriteLine();
				}
				tw.WriteLine("{0}\t{1}\t{2}",kvp.Key.Item1.ToString(nfi),kvp.Key.Item2.ToString(nfi),kvp.Value);
				old = kvp.Key.Item1;
			}*/
			tw.Close();
			s.Close();
			ProcessStartInfo psi = new ProcessStartInfo();
			psi.FileName = "sh";
			psi.Arguments = "plotdata.sh";
			Process proc = new Process();
			proc.StartInfo = psi;
			proc.Start();
			Console.ReadKey();
			return 0;
		}
		
	}
	
}