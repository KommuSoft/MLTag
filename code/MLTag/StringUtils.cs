using System;
using System.Collections.Generic;
using System.IO;

namespace MLTag {

	public static class StringUtils {
		
		
		private static readonly Dictionary<string,int[]> syllablesExceptions = new Dictionary<string, int[]>();
		private static readonly Dictionary<string,string> startDictionary = new Dictionary<string, string>();
		private static readonly Dictionary<string,string> stopDictionary = new Dictionary<string, string>();
		private static readonly Dictionary<string,string> bothDictionary = new Dictionary<string, string>();
		private static readonly Dictionary<string,string> hyphenDictionary = new Dictionary<string, string>();
		private const int LEFT = 2;
		private const int RIGHT = 2;
		
		public static int LevenshteinDistance (string a, string b) {
			return LevenshteinDistance(a.ToCharArray(),b.ToCharArray());
		}
		public static int LevenshteinDistance<T> (IList<T> a, IList<T> b) where T:IComparable<T> {
			int m = a.Count;
			int n = b.Count;
			int[,] grid = new int[m+1,n+1];
			for(int i = 0; i <= m; i++) {
				grid[i,0] = i;
			}
			for(int i = 0; i <= n; i++) {
				grid[0,i] = i;
			}
			for(int j = 0; j < n; j++) {
				for(int i = 0; i < m; i++) {
					if(a[i].Equals(b[j])) {
						grid[i+1,j+1] = grid[i,j];
					}
					else {
						grid[i+1,j+1] = Math.Min(grid[i,j],Math.Min(grid[i+1,j],grid[i,j+1]))+1;
					}
				}
			}
			return grid[m,n];
		}
		public static void ReadConfigStream (Stream stream) {
			syllablesExceptions.Clear();
			startDictionary.Clear();
			stopDictionary.Clear();
			bothDictionary.Clear();
			hyphenDictionary.Clear();
			//TODO: read config list
			TextReader tr = new StreamReader(stream);
			string line = tr.ReadLine();
			bool start, stop;
			int n;
			while(line != null) {
				n = line.Length;
				start = line.StartsWith(".");
				if(start) {
					line = line.Substring(1);
					n--;
				}
				stop = line.EndsWith(".");
				if(stop) {
					line = line.Substring(0,--n);
				}
				if(!char.IsNumber(line[0])) {
					line = "0"+line;
					n++;
				}
				for(int i = 1; i < n-1; i++) {
					if(char.IsLetter(line[i]) && char.IsLetter(line[i+1])) {
						line = line.Substring(0,i+1)+"0"+line.Substring(i+1);
						n++;
						i++;
					}
				}
				string tag = "";
				string val = "";
				for(int i = 1; i < n; i += 2) {
					tag += line[i];
				}
				for(int i = 0; i < n; i += 2) {
					val += line[i];
				}
				if(start & stop) {
					bothDictionary.Add(tag,val);
				}
				else if(start) {
					startDictionary.Add(tag,val);
				}
				else if(stop) {
					stopDictionary.Add(tag,val);
				}
				else {
					hyphenDictionary.Add(tag,val);
				}
				
				line = tr.ReadLine();
			}
		}
		private static void updater (Dictionary<string,string> hash, string str, int[] result, int pos) {
			string fromHash;
			if(hash.TryGetValue(str,out fromHash)) {
				for(int i = 0; i < fromHash.Length; i++) {
					result[i+pos] = Math.Max((int) result[i+pos],fromHash[i]);
				}
			}
		}
		public static int[] Hyphenate (string word) {
			word = word.ToLowerInvariant();
			int[] result;
			if(syllablesExceptions.TryGetValue(word,out result)) {
				return result;
			}
			int n = word.Length;
			result = new int[n+1];
			int right_stop = n-RIGHT;
			for(int pos = 0; pos <= right_stop; pos++) {
				int rest_length = n-pos;
				for(int length = 1; length <= rest_length; length++) {
					string substr = word.Substring(pos,length);
					updater(hyphenDictionary,substr,result,pos);
					if(pos == 0) {
						updater(startDictionary,substr,result,pos);
					}
					if(length == rest_length) {
						updater(stopDictionary,substr,result,pos);
					}
				}
			}
			updater(bothDictionary,word,result,0);
			/*for(int i = 0; i < LEFT; i++) {
				result[i] = 0x00;
			}
			for(int i = n-1; i >= n-RIGHT; i--) {
				result[i] = 0x00;
			}*/
			List<int> ints = new List<int>();
			int idx;
			for(int i = LEFT; i <= n-RIGHT; i++) {
				idx = i*(result[i]&0x01);
				if(idx != 0x00) {
					ints.Add(idx);
				}
			}
			
			return ints.ToArray();
			//letters = word
		}
		public static string[] ToSyllables (string word) {
			int[] splits = Hyphenate(word);
			string[] syllables = new string[splits.Length+1];
			int i1 = 0, i2;
			for(int i = 0; i < splits.Length; i++) {
				i2 = splits[i];
				syllables[i] = word.Substring(i1,i2-i1);
				i1 = i2;
			}
			syllables[splits.Length] = word.Substring(i1);
			return syllables;
		}
		
	}
}

