using System;
using System.Collections.Generic;

namespace MLTag {

	public delegate F SymmetricFunction<X,F> (X x1, X x2);
	
	public class SymmetricFunctionCache<X,F> {
		
		private readonly Dictionary<X,int> dict1 = new Dictionary<X,int>();
		private readonly Dictionary<long,F> dict2 = new Dictionary<long,F>();
		private readonly SymmetricFunction<X,F> function;
		
		public F this [X x1, X x2] {
			get {
				int x1i, x2i;
				if(!this.dict1.TryGetValue(x1,out x1i)) {
					return cacheValue(x1,x2);
				}
				if(!this.dict1.TryGetValue(x2,out x2i)) {
					return cacheValue(x1,x2,x1i);
				}
				long val;
				if(x1i < x2i) {
					val = ((long) x1i<<0x20)|x2i;
				}
				else {
					val = ((long) x2i<<0x20)|x1i;
				}
				F result;
				if(!this.dict2.TryGetValue(val,out result)) {
					return cacheValue(x1,x2,val);
				}
				return result;
			}
		}
		
		public SymmetricFunctionCache (SymmetricFunction<X,F> function) {
			this.function = function;
		}
		
		private F cacheValue (X x1, X x2) {
			int i = dict1.Count;
			this.dict1.Add(x1,i);
			int x2i;
			if(!this.dict1.TryGetValue(x2,out x2i)) {
				return cacheValue(x1,x2,i);
			}
			else {
				long val = ((long) x2i<<0x20)|i;
				return cacheValue(x1,x2,val);
			}
		}
		private F cacheValue (X x1, X x2, int x1i) {
			int i = dict1.Count;
			this.dict1.Add(x2,i);
			long val = ((long) x1i<<0x20)|i;
			return cacheValue(x1,x2,val);
		}
		private F cacheValue (X x1, X x2, long val) {
			F result = function(x1,x2);
			this.dict2.Add(val,result);
			return result;
		}
		
		public void Clear () {
			this.dict1.Clear();
			this.dict2.Clear();
		}
		
	}
}

