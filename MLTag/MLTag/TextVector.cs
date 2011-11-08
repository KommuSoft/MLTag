using System;
using System.Collections.Generic;

namespace MLTag {
	
	public class TextVector {
		
		private static readonly Dictionary<string,int> items = new Dictionary<string,int>();
		private readonly Dictionary<int,int> counters;
		private readonly string text;
		
		public int this [string term] {
			get {
				int ind;
				if(!items.TryGetValue(term,out ind)) {
					return 0;
				}
				return this[ind];
			}
		}
		public int this [int index] {
			get {
				int val;
				if(!counters.TryGetValue(index,out val)) {
					return 0;
				}
				return val;
			}
		}
		
		public TextVector (string text) {
			this.text = text;
			this.counters = generateCounters(text);
		}
		
		private static Dictionary<int,int> generateCounters (string text) {
			Dictionary<int,int> counters = new Dictionary<int,int>();
			string[] terms = text.Split(new string[] {" "},StringSplitOptions.RemoveEmptyEntries);//TODO: other split literals (punctuations).
			int ind,val;
			foreach(String s in terms) {
				if(!items.TryGetValue(s,out ind)) {
					ind = items.Count;
					items.Add(s,ind);
				}
				if(!counters.TryGetValue(ind,out val)) {
					counters.Add(ind,0x01);
					val = 0x00;
				}
				counters[ind] = val+0x01;
			}
			return counters;
		}
		
		public static double CosinusDistance (TextVector a, TextVector b) {
			/*foreach(KeyValuePair<string,int> kvp in items) {
				Console.Write("\"{0}\"/{1}\t",kvp.Key,kvp.Value);
			}//*/
			Dictionary<int,int> da = a.counters;
			Dictionary<int,int> db = b.counters;
			if(db.Count < da.Count) {//swap dictionaries (only for optimalisation)
				Dictionary<int,int> dc = da;
				da = db;
				db = dc;
			}
			/*Console.WriteLine("Counters: {0}/{1}",da.Count,db.Count);
			Console.Write("Vector a \"{0}\": ",a.text);
			foreach(KeyValuePair<int,int> kvp in da) {
				Console.Write("{0}/{1}",kvp.Key,kvp.Value);
			}
			Console.WriteLine();
			Console.Write("Vector b \"{0}\": ",b.text);
			foreach(KeyValuePair<int,int> kvp in db) {
				Console.Write("{0}/{1}",kvp.Key,kvp.Value);
			}
			Console.WriteLine();//*/
			
			int cross = 0;
			int na = 0;
			int nb = 0;
			int xa, id, xb;
			foreach(KeyValuePair<int,int> kvp in da) {
				xa = kvp.Value;
				id = kvp.Key;
				if(db.TryGetValue(id,out xb)) {
					cross += xa*xb;
				}
				na += xa*xa;
			}
			foreach(KeyValuePair<int,int> kvp in db) {
				xb = kvp.Value;
				nb += xb*xb;
			}
			return cross/Math.Sqrt(na*nb);
		}
		
		public static double operator ^ (TextVector a, TextVector b) {//cos-operator
			return CosinusDistance(a,b);
		}
	}
}

