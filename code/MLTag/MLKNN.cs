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
using SF.Snowball.Ext;
using Lucene.Net.Analysis.Snowball;
using Lucene.Net.QueryParsers;
using Lucene.Net.Analysis;
using System.IO;

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
        private TextWriter tw;
        private TokenFilter filt;
        MemoryStream ms;

        public CurDistance() {
            ms = new MemoryStream();
            filt = new PorterStemFilter(new LowerCaseFilter(new WhitespaceTokenizer(new StreamReader(ms))));
            tw = new StreamWriter(ms);
        }

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
            HashSet<string> ha = new HashSet<string>();
            HashSet<string> hb = new HashSet<string>();
            long pos = ms.Position;
            tw.WriteLine(stringA);
            tw.Flush();
            ms.Position = pos;
            Lucene.Net.Analysis.Token t = filt.Next();
            while (t != null) {
                ha.Add(t.TermText());
                t = filt.Next();
            }
            pos = ms.Position;
            tw.WriteLine(stringB);
            tw.Flush();
            ms.Position = pos;
            Lucene.Net.Analysis.Token tb = filt.Next();
            while (tb != null) {
                hb.Add(tb.TermText());
                tb = filt.Next();
            }
            double uc = ha.Union(hb).Count();
            double ic = ha.Intersect(hb).Count();
            return (uc - ic) / uc;
            /*int total = 0;
            foreach (string sa in a) {
                int min = int.MaxValue;
                foreach (string sb in b) {
                    min = Math.Min(min, LD(sa, sb));
                }
                total += min;
            }
            foreach (string sb in b) {
                int min = int.MaxValue;
                foreach (string sa in a) {
                    min = Math.Min(min, LD(sa, sb));
                }
                total += min;
            }
            return total;*/

            //return LD(stringA, stringB);
        }

        public int LD(string s, string t) {
            int n = s.Length; //length of s
            int m = t.Length; //length of t
            int[,] d = new int[n + 1, m + 1]; // matrix
            int cost; // cost
            if (n == 0) return m;
            if (m == 0) return n;
            for (int i = 0; i <= n; d[i, 0] = i++) ;
            for (int j = 0; j <= m; d[0, j] = j++) ;
            for (int i = 1; i <= n; i++) {
                for (int j = 1; j <= m; j++) {
                    cost = (t.Substring(j - 1, 1) == s.Substring(i - 1, 1) ? 0 : 1);
                    d[i, j] = System.Math.Min(System.Math.Min(d[i - 1, j] + 1, d[i, j - 1] + 1),
                              d[i - 1, j - 1] + cost);
                }
            }
            return d[n, m];
        }
    }

}
