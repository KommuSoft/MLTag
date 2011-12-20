using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Lucene.Net.Analysis.Standard;

namespace MLTag {

	public class TextVector2 {
		
		private static readonly List<string> terms = new List<string>();
		private double[] data;
		private readonly string text;
		
		public static int NumberOfTerms {
			get {
				return terms.Count;
			}
		}
		
		public static IEnumerable<string> GetTerms () {
			return terms;
		}
		public TextVector2 (string line) : this(line,true) {}
		public TextVector2 (string line, bool addTerms) {
			this.text = line;
			TextReader tr = new StringReader(text);
			StandardTokenizer t = new StandardTokenizer(tr);
			Lucene.Net.Analysis.Token T = t.Next();
			double[] data = new double[NumberOfTerms];
			while(T != null) {
				bool candrop = false;
				string st = T.TermText();
				int i = 0;
				foreach(string term in terms) {
					if(i >= data.Length) {
						break;
					}
					float ratio = StringUtils.GetRelevance(term,st);
					if(ratio == 1.0d) {
						candrop = true;
					}
					data[i++] += ratio;
				}
				if(!candrop && addTerms) {
					terms.Add(st);
				}
				T = t.Next();
			}
			this.data = data;
		}
		
		public double[] ToDoubleArray () {
			if(NumberOfTerms != this.data.Length) {
				double[] datb = new double[NumberOfTerms];
				for(int i = 0; i < this.data.Length; i++) {
					datb[i] = this.data[i];
				}
				TextReader tr = new StringReader(text);
				StandardTokenizer t = new StandardTokenizer(tr);
				Lucene.Net.Analysis.Token T = t.Next();
				while(T != null) {
					string st = T.TermText();
					for(int i = this.data.Length; i < NumberOfTerms; i++) {
						datb[i] += StringUtils.GetRelevance(terms[i],st);//TODO: recalc other factors
					}
					T = t.Next();
				}
				this.data = datb;
			}
			return this.data;
		}
		
	}
	
}