using System;
using System.Collections.Generic;

namespace MLTag {

	public class LevenshteinDistance : StringDistanceMetric {
		
		public LevenshteinDistance () {}
		
		public double GetDistance (string a, string b) {
			float relevance;
			return GetDistance(a.ToCharArray(),b.ToCharArray(), out relevance);
		}
		
		public int GetDistance<T> (IList<T> a, IList<T> b, out float relevance) where T:IComparable<T> {
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
			relevance = 1.0f-(float) grid[m,n]/Math.Max(m,n);
			return grid[m,n];
		}
		
	}
	
}