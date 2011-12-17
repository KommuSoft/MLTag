using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Lucene.Net.Analysis.Standard;

namespace MLTag {

	public class TextVector2 {
		
		private static readonly Dictionary<string,int> terms = new Dictionary<string, int>();
		private double[] data;
		private readonly string text;
		
		public static int NumberOfTerms {
			get {
				return terms.Count;
			}
		}
		
		public TextVector2 (string line) : this(line,true) {}
		public TextVector2 (string line, bool addTerms) {
			this.text = line;
			TextReader tr = new StringReader(text);
			StandardTokenizer t = new StandardTokenizer(tr);
			Lucene.Net.Analysis.Token T = t.Next();
			double[] data = new double[NumberOfTerms];
			MaximumQueue<float> maximums = new MaximumQueue<float>(3);
			while(T != null) {
				bool candrop = false;
				string st = T.TermText();
				foreach(KeyValuePair<string,int> kvp in terms) {
					float ratio = StringUtils.GetRelevance(kvp.Key,st);
					maximums.Add(ratio);
					if(ratio == 1.0d) {
						candrop = true;
					}
					data[kvp.Value] += ratio;
				}
				if(!candrop && maximums.Average() < 0.75d) {
					terms.Add(st,NumberOfTerms);
				}
				T = t.Next();
				maximums.Clear();
			}
			this.data = data;
		}
		
		public double[] getDoubleArray () {
			if(NumberOfTerms != data.Length) {
				double[] datb = new double[NumberOfTerms];
				for(int i = 0; i < this.data.Length; i++) {
					datb[i] = this.data[i];
				}
				for(int i = this.data.Length; i < NumberOfTerms; i++) {
					datb[i] = 0.0d;//TODO: recalc other factors
				}
				this.data = datb;
			}
			return this.data;
		}
		
	}
	
}