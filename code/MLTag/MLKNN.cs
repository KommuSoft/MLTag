using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using mulan;
using mulan.data;
using weka.core;
using java.util;
using mulan.classifier;
using weka.core.neighboursearch;

namespace MLTag {

    public class MLkNNRecommender : Recommender {
        private Instances dataSet;
        private mulan.classifier.lazy.MLkNN cl;

        public MLkNNRecommender() {
            ArrayList nomi = new ArrayList();
            nomi.add("0");
            nomi.add("1");
            ArrayList attr = new ArrayList();
            weka.core.Attribute stringAttr = new weka.core.Attribute("todoString", (List)null);
            attr.add(stringAttr);
            for (int i = 1; i <= 15; i++) {
                attr.add(new weka.core.Attribute("label" + i, nomi));
            }
            dataSet = new Instances("Todo-Instances", attr, 500);

        }

        private LabelsMetaData loadLabelsMeta(Instances data, int numLabels) {
            LabelsMetaDataImpl labelsData = new LabelsMetaDataImpl();
            int numAttributes = data.numAttributes();
            for (int index = numAttributes - numLabels; index < numAttributes; index++) {
                String attrName = data.attribute(index).name();
                labelsData.addRootNode(new LabelNodeImpl(attrName));
            }
            return labelsData;
        }

        private int tagsNb = 15;
        public int NumberOfTags {
            get {
                return tagsNb;
            }
            set {
                tagsNb = value;
            }
        }

        public void EndTrainingSession() {
            MultiLabelInstances mli = new MultiLabelInstances(dataSet, loadLabelsMeta(dataSet, 15));
            cl = new mulan.classifier.lazy.MLkNN();
            cl.setDfunc(new CurDistance());
            cl.build(mli);
        }

        public void Train(string text, IList<int> tags) {
            Instance ins = new DenseInstance(16);
            ins.setDataset(dataSet);
            ins.setValue(0, text);
            for (int i = 0; i < tagsNb; i++) {
                if (tags.Contains(i)) {
                    ins.setValue(i + 1, 1);
                } else {
                    ins.setValue(i + 1, 0);
                }

            }
            dataSet.add(ins);


        }

        public IEnumerable<double> Tag(string text) {
            Instance ins = new DenseInstance(16);
            ins.setDataset(dataSet);
            ins.setValue(0, text);
            MultiLabelOutput mlo = cl.makePrediction(ins);
            List<double> outp = new List<Double>();
            foreach (bool b in mlo.getBipartition()) {
                if (b) {
                    outp.Add(1);
                } else {
                    outp.Add(0);
                }
            }
            return outp;
        }
    }

    public class CurDistance : NormalizableDistance {

        public override string getRevision() {
            throw new NotImplementedException();
        }

        public override string globalInfo() {
            throw new NotImplementedException();
        }

        protected override double updateDistance(double currDist, double diff) {
            return (currDist + (diff * diff));
        }

        public override double distance(Instance first, Instance second, double cutOffValue, PerformanceStats stats) {
            double sqDistance = 0;
            int numAttributes = m_Data.numAttributes();

            validate();

            double diff;

            for (int i = 0; i < numAttributes; i++) {
                diff = 0;
                if (m_ActiveIndices[i]) {
                    diff = difference(i, first.stringValue(i), second.stringValue(i));
                }
                sqDistance = updateDistance(sqDistance, diff);
                if (sqDistance > (cutOffValue * cutOffValue)) return Double.PositiveInfinity;
            }
            double distance = Math.Sqrt(sqDistance);
            return distance;
        }

        protected double difference(int index, String string1, String string2) {
            switch (m_Data.attribute(index).type()) {
                case weka.core.Attribute.STRING:
                    double diff = stringDistance(string1, string2);
                    if (m_DontNormalize == true) {
                        return diff;
                    } else {
                        if (string1.Count() > string2.Count()) {
                            return diff / ((double)string1.Count());
                        } else {
                            return diff / ((double)string2.Count());
                        }
                    }

                default:
                    return 0;
            }
        }

        double stringDistance(String stringA, String stringB) {
            int lengthA = stringA.Count();
            int lengthB = stringB.Count();

            double[][] distanceMatrix = new double[lengthA + 1][];

            for (int i = 0; i <= lengthA; i++) {
                distanceMatrix[i] = new double[lengthB + 1];
                distanceMatrix[i][0] = i;
            }

            for (int j = 1; j <= lengthB; j++) {
                distanceMatrix[0][j] = j;
            }

            for (int i = 1; i <= lengthA; i++) {
                for (int j = 1; j <= lengthB; j++) {
                    if (stringA[i - 1] == stringB[j - 1]) {
                        distanceMatrix[i][j] = distanceMatrix[i - 1][j - 1];
                    } else {
                        distanceMatrix[i][j] = 1 + Math.Min(distanceMatrix[i - 1][j],
                                                            Math.Min(distanceMatrix[i][j - 1],
                                                                     distanceMatrix[i - 1][j - 1]));
                    }
                }
            }
            return distanceMatrix[lengthA][lengthB];
        }
    }

}
