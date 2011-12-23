using System;
using System.Collections.Generic;
using System.IO;
using Lucene.Net.Analysis;
using System.Text;

namespace MLTag {

    public static class StringUtils {

        private static readonly Dictionary<string, int[]> syllablesExceptions = new Dictionary<string, int[]>();
        private static readonly Dictionary<string, string> startDictionary = new Dictionary<string, string>();
        private static readonly Dictionary<string, string> stopDictionary = new Dictionary<string, string>();
        private static readonly Dictionary<string, string> bothDictionary = new Dictionary<string, string>();
        private static readonly Dictionary<string, string> hyphenDictionary = new Dictionary<string, string>();
        private const int LEFT = 0;
        private const int RIGHT = 0;
        private static readonly Dictionary<string, string[]> syllablesCache = new Dictionary<string, string[]>();
        private static IDictionary<String, HashSet<String>> dict = new Dictionary<String, HashSet<String>>();
		
        public static HashSet<string> GetLuceneTokens(string text) {
            HashSet<string> val;
            if(!dict.TryGetValue(text,out val)) {
                val = new HashSet<string>(InnerGetLuceneTokens(text));
                dict.Add(text,val);
            }
            return val;
        }
        public static IEnumerable<string> InnerGetLuceneTokens(string text) {
            TextReader tr = new StringReader(text);
            TokenStream tok = new Lucene.Net.Analysis.Standard.StandardTokenizer(tr);
            tok = new LowerCaseFilter(tok);
            tok = new PorterStemFilter(tok);
            Token t = tok.Next();
            while (t != null) {
                yield return t.TermText();
                t = tok.Next();
            }
            tr.Close();
        }

        public static string[] GetTokens(string sentence) {
            List<string> tokens = new List<string>();
            TextReader tr = new StringReader(sentence);
            Lucene.Net.Analysis.Standard.StandardTokenizer t = new Lucene.Net.Analysis.Standard.StandardTokenizer(tr);
            Token T = t.Next();
            while (T != null) {
                tokens.Add(T.TermText());
                T = t.Next();
            }
            t.Close();
            tr.Close();
            return tokens.ToArray();
        }
        public static void ReadConfigStream(Stream stream) {
            syllablesExceptions.Clear();
            startDictionary.Clear();
            stopDictionary.Clear();
            bothDictionary.Clear();
            hyphenDictionary.Clear();
            TextReader tr = new StreamReader(stream);
            string line = tr.ReadLine();
            bool start, stop;
            int n;
            while (line != null) {
                n = line.Length;
                start = line.StartsWith(".");
                if (start) {
                    line = line.Substring(1);
                    n--;
                }
                stop = line.EndsWith(".");
                if (stop) {
                    line = line.Substring(0, --n);
                }
                if (!char.IsNumber(line[0])) {
                    line = "0" + line;
                    n++;
                }
                for (int i = 1; i < n - 1; i++) {
                    if (char.IsLetter(line[i]) && char.IsLetter(line[i + 1])) {
                        line = line.Substring(0, i + 1) + "0" + line.Substring(i + 1);
                        n++;
                        i++;
                    }
                }
                string tag = "";
                string val = "";
                for (int i = 1; i < n; i += 2) {
                    tag += line[i];
                }
                for (int i = 0; i < n; i += 2) {
                    val += line[i];
                }
                try {
                    if (start & stop) {
                        bothDictionary.Add(tag, val);
                    } else if (start) {
                        startDictionary.Add(tag, val);
                    } else if (stop) {
                        stopDictionary.Add(tag, val);
                    } else {
                        hyphenDictionary.Add(tag, val);
                    }
                } catch { }
                line = tr.ReadLine();
            }
        }
        private static void updater(Dictionary<string, string> hash, string str, int[] result, int pos) {
            string fromHash;
            if (hash.TryGetValue(str, out fromHash)) {
                for (int i = 0; i < fromHash.Length; i++) {
                    result[i + pos] = Math.Max(result[i + pos], int.Parse(fromHash[i].ToString()));
                }
            }
        }
        public static int[] Hyphenate(string word) {
            word = word.ToLowerInvariant();
            int[] result;
            if (syllablesExceptions.TryGetValue(word, out result)) {
                return result;
            }
            int n = word.Length;
            result = new int[n + 1];
            int right_stop = n - RIGHT;
            for (int pos = 0; pos <= right_stop; pos++) {
                int rest_length = n - pos;
                for (int length = 1; length <= rest_length; length++) {
                    string substr = word.Substring(pos, length);
                    updater(hyphenDictionary, substr, result, pos);
                    if (pos == 0) {
                        updater(startDictionary, substr, result, pos);
                    }
                    if (length == rest_length) {
                        updater(stopDictionary, substr, result, pos);
                    }
                }
            }
            updater(bothDictionary, word, result, 0);
            List<int> ints = new List<int>();
            int idx;
            for (int i = LEFT; i <= n - RIGHT; i++) {
                idx = i * (result[i] & 0x01);
                if (idx != 0x00) {
                    ints.Add(idx);
                }
            }

            return ints.ToArray();
        }
        public static string[] ToSyllables(string input) {
            string[] result;
            input = input.ToLowerInvariant();
            if (!syllablesCache.TryGetValue(input, out result)) {
                string[] vals = input.Split(' ', '-', '\'');
                List<string> syl = new List<string>();
                foreach (string word in vals) {
                    int[] splits = Hyphenate(word);
                    int i1 = 0, i2;
                    for (int i = 0; i < splits.Length; i++) {
                        i2 = splits[i];
                        if (i2 > i1) {
                            syl.Add(word.Substring(i1, i2 - i1));
                        }
                        i1 = i2;
                    }
                    if (i1 < word.Length) {
                        syl.Add(word.Substring(i1));
                    }
                }
                result = syl.ToArray();
                syllablesCache.Add(input, result);
            }
            return result;
        }

    }
}

