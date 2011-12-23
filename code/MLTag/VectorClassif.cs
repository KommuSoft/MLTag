using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using weka.core;
using java.util;
using mulan.data;
using weka.filters.unsupervised.attribute;
using weka.classifiers.meta;
using mulan.classifier.transformation;
using mulan.classifier;
using mulan.classifier.neural;
using weka.filters;
using weka.classifiers.bayes;
using weka.classifiers.trees;
using mulan.classifier.meta;

namespace MLTag {
    class VectorClassif : Recommender {
        private Instances dataSet;
        private Instances oDataSet;
        private StringToWordVector stv;

        public VectorClassif(int nbTags) {
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
            oDataSet = new Instances("Todo-Instances", attr, 500);

        }

        private LabelsMetaData loadLabelsMeta(Instances data, int numLabels) {
            LabelsMetaDataImpl labelsData = new LabelsMetaDataImpl();
            int numAttributes = data.numAttributes();
            for (int index = 1; index <= numLabels; index++) {
                String attrName = "label" + index; // data.attribute(index).name();
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

        private RAkEL lps;
        public void EndTrainingSession() {
            Console.WriteLine("End"); 
            stv = new StringToWordVector();
            stv.setAttributeNamePrefix("#");
            stv.setLowerCaseTokens(true);
            stv.setOutputWordCounts(true);
            stv.setInputFormat(oDataSet);
            stv.setStemmer(new weka.core.stemmers.LovinsStemmer());
            stv.setIDFTransform(true);
            dataSet = Filter.useFilter(oDataSet, stv);
            MultiLabelInstances mli = new MultiLabelInstances(dataSet, loadLabelsMeta(dataSet, tagsNb));
            BinaryRelevance br = new mulan.classifier.transformation.BinaryRelevance(new NaiveBayes());
            lps = new mulan.classifier.meta.RAkEL(br);
            br.setDebug(true);
            lps.setDebug(true);
            lps.build(mli);

        }

        public void Train(string text, IList<int> tags) {
            
            Instance ins = new DenseInstance(tagsNb + 1);
            ins.setDataset(oDataSet);
            ins.setValue(0, text);
            for (int i = 0; i < tagsNb; i++) {
                if (tags.Contains(i)) {
                    ins.setValue(i + 1, 1);
                } else {
                    ins.setValue(i + 1, 0);
                }

            }
            oDataSet.add(ins);
        }

        public IEnumerable<double> Tag(string text) {
            Instance ins = new DenseInstance(tagsNb + 1);
            ins.setDataset(oDataSet);
            ins.setValue(0, text);
            stv.input(ins);
            ins = stv.output();
            MultiLabelOutput mlo = lps.makePrediction(ins);
            List<double> outp = new List<Double>();
            int i = 0;
            foreach (bool b in mlo.getBipartition()) {
                if (b) {
                    outp.Add(mlo.getConfidences()[i++]/2 + 0.5);
                } else {
                    outp.Add(0.5 - mlo.getConfidences()[i++]/2);
                }
            }
            return outp;
        }
    }
}
