using System;
using System.Collections.Generic;
using AForge.Neuro;
using AForge.Neuro.Learning;

namespace MLTag {

	public class AdditionalNeuralNetwork {
		
		private readonly ActivationNetwork network;
		private readonly ISupervisedLearning[] teacher;
		private readonly List<double[]> inputs = new List<double[]>();
		private readonly List<double[]> outputs = new List<double[]>();
		private const int RELEARN_TRESHOLD = 20;
		private int counter = 0;
		
		public AdditionalNeuralNetwork (int numberOfTags) {
			this.network = new ActivationNetwork(new SigmoidFunction(1.0d),numberOfTags,numberOfTags);
			this.teacher = new ISupervisedLearning[] {new DeltaRuleLearning(this.network),new PerceptronLearning(this.network),new BackPropagationLearning(this.network)};
			//this.teacher.LearningRate = 0.10d;
			//this.teacher.Momentum = 0.10d;
		}
		
		public void Learn (double[] input, double[] output) {
			this.inputs.Add(input);
			this.outputs.Add(output);
			foreach(ISupervisedLearning isl in teacher)  {
						isl.Run(input,output);
					}
			//if(counter >= RELEARN_TRESHOLD) {
				//counter = 0;
				double error = double.MaxValue;
				double[][] inp = this.inputs.ToArray();
				double[][] oup = this.outputs.ToArray();
				for(int i = 0; i < 500 & error >= 0.05d; i++) {
					error = 0.0d;
					foreach(ISupervisedLearning isl in teacher)  {
						error += isl.RunEpoch(inp,oup);
					}
					error /= inp.Length;
				}
				Console.WriteLine(error);
			//}
			//else {
			//	counter++;
			//}
		}
		public double[] Activate (double[] input) {
			return this.network.Compute(input);
		}
		
	}
}

