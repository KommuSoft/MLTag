using System;
using System.Collections.Generic;
using System.Globalization;
using Lucene.Net.Analysis;
using SF.Snowball.Ext;
using System.Text.RegularExpressions;
using System.Linq;
using Wnlib;
using WordsMatching;

namespace MLTag {

	public class ConcreteBasicTextVector : AbstractBasicTextVector {
		
		private static readonly Regex timeRegex = new Regex(@"^(0?[0-9]|1[0-9]|2[0-4])(h|u)|(0?[0-9]|1[0-2])(am|pm)$",RegexOptions.Compiled|RegexOptions.IgnoreCase|RegexOptions.CultureInvariant);
		private static readonly Regex yearRegex = new Regex(@"^[0-9][0-9][0-9][0-9](-[0-9][0-9][0-9][0-9])?$",RegexOptions.Compiled|RegexOptions.IgnoreCase|RegexOptions.CultureInvariant);
		private static readonly Regex numberRegex = new Regex(@"^[0-9]+?$",RegexOptions.Compiled|RegexOptions.IgnoreCase|RegexOptions.CultureInvariant);
		private static readonly Dictionary<string,string> conversions = new Dictionary<string, string>();
		private static readonly PartsOfSpeech[] POSEnum = (PartsOfSpeech[]) Enum.GetValues(typeof(PartsOfSpeech));
		private static bool dataDetectorsInstalled = false;
		
		public ConcreteBasicTextVector (string text,bool addTerms) : base(text,addTerms) {
			setupDataDetectors();
		}
		public ConcreteBasicTextVector (string text) : base(text) {
			setupDataDetectors();
		}
		
		private void setupDataDetectors () {
			if(dataDetectorsInstalled)
				return;
			dataDetectorsInstalled = true;
			DateTimeFormatInfo dtfi = DateTimeFormatInfo.InvariantInfo;
			addConversions(new string[][] {dtfi.AbbreviatedDayNames},dtfi.DayNames);
			addConversions(new string[][] {dtfi.AbbreviatedMonthGenitiveNames,dtfi.AbbreviatedMonthNames,dtfi.MonthGenitiveNames},dtfi.MonthNames);
		}
		
		private void addConversions (IEnumerable<IEnumerable<string>> frms, IEnumerable<string> tos) {
			List<IEnumerator<string>> items = new List<IEnumerator<string>>(frms.Select(x => x.GetEnumerator()));
			foreach(string to in tos) {
				for(int i = 0; i < items.Count; i++) {
					if(items[i].MoveNext() && !conversions.ContainsKey(items[i].Current.ToLowerInvariant())) {
						conversions.Add(items[i].Current.ToLowerInvariant(),to.ToLowerInvariant());
					}
				}
			}
		}
		
		public override double AddingMethod (double a, double b) {
			return Math.Max(a,b);
		}
		
		public override IEnumerable<Tuple<string,double>> GetTerms (System.IO.TextReader tr) {
			TokenStream tok = new Lucene.Net.Analysis.Standard.StandardTokenizer(tr);
			tok = new ISOLatin1AccentFilter(tok);
			tok = new StopFilter(tok,StopAnalyzer.ENGLISH_STOP_WORDS);
			Token t = tok.Next();
			EnglishStemmer stemmer = new EnglishStemmer();
			string v, org, tmp;
			while(t != null) {
				v = t.TermText();
				org = v;
				if(v != null && v != string.Empty) {
					if(conversions.TryGetValue(v.ToLowerInvariant(),out tmp)) {
						v = tmp;
					}
					else {
						stemmer.SetCurrent(v);
						stemmer.Stem();
						v = stemmer.GetCurrent();
						if(timeRegex.IsMatch(v)) {
							v = "#time";
						}
						else if(yearRegex.IsMatch(v)) {
							v = "#year";
						}
						else if(numberRegex.IsMatch(v)) {
							v = "#number";
						}
						else if(t.Type() != "<ALPHANUM>") {
							v = t.Type();
							v = string.Format("#{0}",v.Substring(1,v.Length-2).ToLowerInvariant());
							//Console.WriteLine("{0}/{1} < {2}",t.Type(),v,org);
						}
						else {
							//Console.WriteLine("{0}/{1} < {2}",t.Type(),v,org);
						}
					}
					if(v != string.Empty) {
						yield return new Tuple<string, double>(v.ToLowerInvariant(),2.0d);
						for(int i = 1; i < POSEnum.Length; i++) {
							HierarchicalWordData hwd = new HierarchicalWordData(new MyWordInfo(org,POSEnum[i]));
							foreach(System.Collections.DictionaryEntry de in hwd.Distance) {
								string key = "#WD"+de.Key.ToString();
								int val = (int) de.Value;
								//Console.WriteLine(new Tuple<string, double>(key,val));
								yield return new Tuple<string, double>(key,(val+1.0d)/val);
							}
							//Console.ReadKey();
						}
					}
				}
				t = tok.Next();
			}
		}
		
	}
	
}