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
		
		private static readonly Regex timeRegex = new Regex(@"^(((0?[0-9]|1[0-9]|2[0-4])(h|u))|((0?[0-9]|1[0-9])(am|pm)([0-5][0-9])?))$");
		private static readonly Regex yearRegex = new Regex(@"^[0-9]{4}(-[0-9]{4})?$",RegexOptions.Compiled|RegexOptions.IgnoreCase|RegexOptions.CultureInvariant);
		private static readonly Regex numberRegex = new Regex(@"^[0-9]+?$",RegexOptions.Compiled|RegexOptions.IgnoreCase|RegexOptions.CultureInvariant);
		private static readonly Dictionary<string,string> conversions = new Dictionary<string, string>();
		private static readonly Dictionary<string,string> classifications = new Dictionary<string, string>();
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
			addClassifications(dtfi.DayNames,"#Day");
			addClassifications(dtfi.MonthNames,"#Month");
		}
		private void addClassifications (IEnumerable<string> frms, string addit) {
			foreach(string frm in frms) {
				if(!classifications.ContainsKey(frm)) {
					classifications.Add(frm.ToLowerInvariant(),addit);
				}
			}
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
		
		public override IEnumerable<Tuple<string,double>> GetTerms (string text) {
			string token;
			foreach(string v in StringUtils.GetLuceneTokens(text)) {
				token = v;
				if(token != null && token != string.Empty) {
					string tmp;
					if(conversions.TryGetValue(token,out tmp)) {
						token = tmp;
					}
					yield return new Tuple<string, double>(token,1.0d);
					string clas;
					if(classifications.TryGetValue(token,out clas)) {
						yield return new Tuple<string, double>(clas,1.0d);
					}
					if(timeRegex.IsMatch(token)) {
						yield return new Tuple<string, double>("#Time",1.0d);
					}
					if(yearRegex.IsMatch(token)) {
						yield return new Tuple<string, double>("#Year",1.0d);
					}
					if(numberRegex.IsMatch(token)) {
						yield return new Tuple<string, double>("#Number",1.0d);
					}
				}
			}
		}
		
	}
	
}