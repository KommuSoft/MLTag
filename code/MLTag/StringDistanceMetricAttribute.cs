using System;

[AttributeUsage(AttributeTargets.Class)]
public class StringDistanceMetricAttribute : Attribute {
	
	private readonly string metricName;
	
	public string MetricName {
		get {
			return metricName;
		}
	}
	
	public StringDistanceMetricAttribute (string metricName) {
		this.metricName = metricName;
	}
	
}