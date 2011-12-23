using System;
using System.Collections.Generic;
using System.IO;
using Lucene.Net.Analysis;
using SF.Snowball;
using SF.Snowball.Ext;
using System.Linq;
using System.Globalization;

namespace MLTag {

	public abstract class AbstractBasicTextVector {
		
		private static readonly Dictionary<string,int> terms = new Dictionary<string,int>();
		private readonly Dictionary<int,double> vector = new Dictionary<int, double>();
		
		public static string[] Attributes {
			get {
				string[] atts = new string[terms.Count];
				foreach(KeyValuePair<string,int> kvp in terms) {
					atts[kvp.Value] = kvp.Key;
				}
				return atts;
			}
		}
		
		protected AbstractBasicTextVector (string text) : this(text,true) {}
		protected AbstractBasicTextVector (string text, bool addTerms) {
			int idx;
			double score, s;
			string v;
			foreach(Tuple<string,double> vs in GetTerms(text)) {
				v = vs.Item1;
				s = vs.Item2;
				if(!terms.TryGetValue(v,out idx)) {
					idx = terms.Count;
					if(addTerms) {
						terms.Add(v,idx);
					}
				}
				if(idx < terms.Count) {
					if(!vector.TryGetValue(idx,out score)) {
						vector.Add(idx,0.0d);
						score = 0.0d;
					}
					vector[idx] = AddingMethod(vector[idx],s);
				}
			}
		}
		
		public abstract IEnumerable<Tuple<string,double>> GetTerms (string text);
		public virtual double AddingMethod (double a, double b) {
			return a+b;
		}
		
		public static void WriteInstancesArff (TextWriter tw, IEnumerable<AbstractBasicTextVector> vectors, string relation, IEnumerable<string> classifiers, IEnumerable<IEnumerable<bool>> result) {
			tw.WriteLine("@relation '{0}'",relation);
			foreach(string att in Attributes) {
				tw.WriteLine("@attribute '{0}' {1}",att,"{0,1}");
			}
			foreach(string cla in classifiers) {
				tw.WriteLine("@attribute 'tag+{0}' {1}",cla,"{0,1}");
			}
			IEnumerator<IEnumerable<bool>> ien = result.GetEnumerator();
			tw.WriteLine("@data");
			foreach(AbstractBasicTextVector btv in vectors) {
				ien.MoveNext();
				tw.WriteLine(string.Join(",",btv.ToVector().Select(x => x.ToString(NumberFormatInfo.InvariantInfo)))+","+string.Join(",",ien.Current.Select(x=> x?"1":"0")));
			}
		}
		public double[] ToVector () {
			return this.ToVector(0);
		}
		public double[] ToVector (int extra) {
			double[] result = new double[terms.Count+extra];
			foreach(KeyValuePair<int,double> kvp in vector) {
				result[kvp.Key] = kvp.Value;
			}
			return result;
		}
		
	}
	
}