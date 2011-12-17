using System;
using System.Collections.Generic;

namespace MLTag {

	public class MaximumQueue<T> : IEnumerable<T>, ICollection<T> where T:IComparable<T> {
		
		private readonly LinkedList<T> data;
		private readonly int maxCount;
		private int count = 0;
		
		public int Count {
			get {
				return this.count;
			}
		}
		public bool IsReadOnly {
			get {
				return false;
			}
		}
		
		public MaximumQueue (int maxCount) {
			this.data = new LinkedList<T>();
			this.maxCount = maxCount;
		}
		
		public void Add (T item) {
			LinkedListNode<T> node = data.Last;
			while(node != null && node.Value.CompareTo(item) < 0) {
				node = node.Previous;
			}
			if(node == null) {
				data.AddFirst(item);
				this.count++;
				if(count > maxCount) {
					data.RemoveLast();
					this.count--;
				}
			}
			else if(count < maxCount) {
				data.AddAfter(node,item);
				this.count++;
			}
			else if(node != data.Last) {
				data.AddAfter(node,item);
				data.Remove(data.Last);
			}
		}
		public void Clear () {
			this.count = 0;
			this.data.Clear();
		}
		public bool Contains (T item) {
			foreach(T t in this) {
				if(item.Equals(t)) {
					return true;
				}
			}
			return false;
		}
		public IEnumerator<T> GetEnumerator () {
			return ((IEnumerable<T>) this.data).GetEnumerator();
		}
		public bool Remove (T item) {
			if(this.Count == 0 || this.data.Last.Value.CompareTo(item) > 0 || this.data.First.Value.CompareTo(item) < 0) {
				return false;
			}
			LinkedListNode<T> node = this.data.Last;
			while(node != null && node.Value.CompareTo(item) <= 0) {
				if(node.Value.Equals(item)) {
					this.count--;
					this.data.Remove(node);
					return true;
				}
				node = node.Previous;
			}
			return false;
		}
		System.Collections.IEnumerator System.Collections.IEnumerable.GetEnumerator () {
			return this.data.GetEnumerator();
		}
		public void CopyTo (T[] array, int arrayIndex) {
			int n = Math.Min(array.Length,count+arrayIndex);
			LinkedListNode<T> node = this.data.First;
			for(int i = arrayIndex; i < n; i++) {
				array[i] = node.Value;
				node = node.Next;
			}
		}
		public override string ToString () {
			return "[ "+string.Join(" , ",this)+" ]";
		}
		
	}
}

