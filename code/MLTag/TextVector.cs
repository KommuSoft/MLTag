using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;

namespace MLTag {

	public delegate double RatioHandler (double chance);
	
	public class TextVector {
		
		private static readonly Dictionary<string,int> items = new Dictionary<string,int> ();
		private static readonly List<int> staticCounters = new List<int>();
		private static int totalCounter = 0;
		private readonly Dictionary<int,int> counters;
		private readonly string text;
		private static RatioHandler ratio = (x => 1.0d-Math.Sqrt(x));//1-sqrt(x)
		//private static RatioHandler ratio = (x => -x*Math.Log(x));//Entropy
		private static double tresholdRatio = 0.1d;
		//private static Regex punctuation = new Regex(@"[!@#%^&*()+=-_<>,./?|\:;{}']+",RegexOptions.Compiled|RegexOptions.IgnoreCase);
		//private static Regex normalisation = new Regex(@"ing|ed|s$",RegexOptions.Compiled);
		
		public int this [string term] {
			get {
				int ind;
				if (!items.TryGetValue (term, out ind)) {
					return 0;
				}
				return this [ind];
			}
		}

		public int this [int index] {
			get {
				int val;
				if (!counters.TryGetValue (index, out val)) {
					return 0;
				}
				return val;
			}
		}
		
		public TextVector (string text) : this(text,true) {}
		public TextVector (string text, bool newItems) {
			this.text = text;
			this.counters = generateCounters (text,newItems);
		}
		
		private static Dictionary<int,int> generateCounters (string text, bool newItems) {
			Dictionary<int,int> counters = new Dictionary<int,int> ();
			text = text.Normalize().Trim('?','\"', ',', '\'', ';', ':', '.', '(', ')',' ');
			string[] terms = text.Split (new string[] {" "}, StringSplitOptions.RemoveEmptyEntries);//TODO: other split literals (punctuations).
			int ind, val;
			foreach (String s in terms) {
				//s = normalisation.Replace(st,"");
				if (!items.TryGetValue (s, out ind)) {
					ind = items.Count;
					if(newItems) {
						items.Add (s, ind);
						staticCounters.Add(0);
					}
				}
				if (!counters.TryGetValue (ind, out val)) {
					counters.Add (ind, 0x01);
					val = 0x00;
				}
				counters [ind] = val + 0x01;
				if(ind < staticCounters.Count) {
					staticCounters[ind]++;
					totalCounter++;
				}
			}
			return counters;
		}
		
		public static double CosinusDistance (TextVector a, TextVector b) {
			Dictionary<int,int > da = a.counters;
			Dictionary<int,int > db = b.counters;
			if (db.Count < da.Count) {//swap dictionaries (only for optimalisation)
				Dictionary<int,int > dc = da;
				da = db;
				db = dc;
			}
			int cross = 0;
			int na = 0;
			int nb = 0;
			int xa, id, xb;
			foreach (KeyValuePair<int,int> kvp in da) {
				xa = kvp.Value;
				id = kvp.Key;
				if (db.TryGetValue (id, out xb)) {
					cross += xa * xb;
				}
				na += xa * xa;
			}
			foreach (KeyValuePair<int,int> kvp in db) {
				xb = kvp.Value;
				nb += xb * xb;
			}
			return cross / Math.Sqrt (na * nb);
		}
		public static double CosinusDistanceWithRatios (TextVector a, TextVector b) {
			Dictionary<int,int > da = a.counters;
			Dictionary<int,int > db = b.counters;
			if (db.Count < da.Count) {//swap dictionaries (only for optimalisation)
				Dictionary<int,int > dc = da;
				da = db;
				db = dc;
			}
			double cross = 0.0d;
			double na = 0.0d;
			double nb = 0.0d;
			double H = 0.0d;
			int xa, id, xb;
			foreach (KeyValuePair<int,int> kvp in da) {
				id = kvp.Key;
				if(id < staticCounters.Count) {
					H = ratio((double) staticCounters[id]/totalCounter);
				}
				else {
					H = tresholdRatio;
				}
				xa = kvp.Value;
				if (db.TryGetValue (id, out xb)) {
					cross += xa * xb*H;
				}
				na += xa * xa*H;
			}
			foreach (KeyValuePair<int,int> kvp in db) {
				id = kvp.Key;
				if(id < staticCounters.Count) {
					H = ratio((double) staticCounters[id]/totalCounter);
				}
				else {
					H = tresholdRatio;
				}
				xb = kvp.Value;
				nb += xb * xb * H;
			}
			return cross / Math.Sqrt (na * nb);
		}
		public static double operator ^ (TextVector a, TextVector b) {//cos-operator
			return CosinusDistance (a, b);
		}
		public static double operator | (TextVector a, TextVector b) {//cos-operator with ratios
			return CosinusDistanceWithRatios (a, b);
		}
	}
}

