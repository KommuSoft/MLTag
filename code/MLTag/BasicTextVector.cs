/*using System;
using System.Collections.Generic;
using System.IO;
using Lucene.Net.Analysis.Standard;
using SF.Snowball;
using SF.Snowball.Ext;

namespace MLTag {

	public class BasicTextVector {
		
		private static readonly Dictionary<string,int> texts = new Dictionary<string,int>();
		private readonly Dictionary<int,> 
		
		public BasicTextVector (string text) {
			TextReader tr = new StringReader(text);
			StandardTokenizer tok = new StandardTokenizer(tr);
			Token t = tok.getNextToken();
			EnglishStemmer stemmer = new EnglishStemmer();
			while(t.kind != 0) {
				stemmer.SetCurrent(t.image);
				Console.WriteLine("{0} <-> {1}",stemmer.GetCurrent());
				t = tok.getNextToken();
			}
		}
		
	}
	
}*/