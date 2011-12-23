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
using weka.filters.unsupervised.attribute;

namespace MLTag {

    public class MLkNNRecommender : Recommender {
        private Instances dataSet;
        private mulan.classifier.lazy.MultiLabelKNN cl;


        public MLkNNRecommender(int nbTags) {
            tagsNb = nbTags;
            ArrayList nomi = new ArrayList();
            nomi.add("0");
            nomi.add("1");
            ArrayList attr = new ArrayList();
            weka.core.Attribute stringAttr = new weka.core.Attribute("todoString", (List)null);
            attr.add(stringAttr);
            for (int i = 1; i <= nbTags; i++) {
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

        private int tagsNb;
        public int NumberOfTags {
            get {
                return tagsNb;
            }
            set {
                tagsNb = value;
            }
        }

        public void EndTrainingSession() {
            MultiLabelInstances mli = new MultiLabelInstances(dataSet, loadLabelsMeta(dataSet, tagsNb));
            cl = new mulan.classifier.lazy.MLkNN();
            cl.setDfunc(new LevWord());
//            cl.setDistanceWeighting(10000);
            cl.build(mli);
        }

        public void Train(string text, IList<int> tags) {
            Instance ins = new DenseInstance(tagsNb+1);
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
            Instance ins = new DenseInstance(tagsNb+1);
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

    public class LevWord : BasicNormalizableDistance {

        private StringDistanceMetric sdm = new CosineDistanceMetric();
        int c = 0;
        public override double stringDistance(string stringA, string stringB) {
            if (++c % 1000 == 0) {
                Console.Write("-");
                if (c % 10000 == 0) {
                    Console.WriteLine();
                }
            }
            return sdm.GetDistance(stringA, stringB);
        }
    }

    public class CurDistance : BasicNormalizableDistance {
        private TextWriter tw;
        private TokenFilter filt;
        private MemoryStream ms;

        public CurDistance() {
            ms = new MemoryStream();
            filt = new PorterStemFilter(new LowerCaseFilter(new WhitespaceTokenizer(new StreamReader(ms))));
            tw = new StreamWriter(ms);
        }
        
        public override double stringDistance(String stringA, String stringB) {
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
        }
    }

}
