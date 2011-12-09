using System;
using System.Collections.Generic;

namespace MLTag {

	public static class StringUtils {
		
		
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
		public static string[] ToSyllables (string word) {
			return null;
		}
		
	}
}

