using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Text.RegularExpressions;

namespace MLTag {
    class Thesis {
        private static string[] tags = new string[] { "dtai", "machinelearningendatamining", "distrinet", "veiligesoftware", "objectgerichtesoftwareontwikkeling", "dutch", "java", "practical", "voorstellingvanenredenerenmetkennis", "chihumancomputerinteractie", "hci", "english", "mobile", "ui", "nlp", "matlab", "gedistribueerdesoftware", "industrial", "programmeertalen", "logic", "declarativelanguages", "safety", "c", "cplusplus", "perl", "recommendersystem", "web", "computationeleinformatica", "experimental", "ehealth", "kr", "theoretical", "ocaml", "ruby", "bash", "python", "graphmining", "srl", "prolog", "urn", "uml", "softwarepatterns", "social", "w3c", "twr", "computervision", "problog", "nines", "sat", "textmining", "javascript", "php", "reo", "scala", "machinelearning", "clustering", "cp", "ilp", "abs", "imageprocessing", "gui", "video", "codes", "elearning", "computergraphicsenvisualisatie", "csharp", "chr", "logicprogramming", "nalag", "d", "eiffel", "lisp", "clojure", "groovy", "haskell", "music", "multidisciplinary", "visualization", "bioinformatics", "theoretischeinformatica", "computergraphics", "agda", "sport", "basketball", "erlang", "flash", "digitalization", "mda", "businesslogic", "xml", "occampi", "opendata", "fortran", "soccer" };

        private static readonly Regex trainingRegex = new Regex(@"( +#([^# ]+))+ *$", RegexOptions.Compiled);
        private static VotingSystem vs;
        private static List<EvaluationMetric> metrics = new List<EvaluationMetric>();
        private const int TRAIN_PERCENTAGE = 95;

        public Thesis() {
        }

        public static void Train(string text, IList<string> tags) {
            vs.Train(text, tags);
        }
        public static void Train(string line) {
            string text;
            List<String> tags = ParseTags(line, out text);
            Train(text, tags);
        }

        public static IEnumerable<Tuple<string, double>> Recommend(string text) {
            return vs.TagFiltered(text);
        }
        public static List<String> ParseTags(string line, out string text) {
            Match m = trainingRegex.Match(line);
            text = line.Substring(0, line.Length - m.Groups[0].Value.Length);
            List<String> tags = new List<String>();
            foreach (Capture c in m.Groups[2].Captures) {
                tags.Add(c.Value);
                //alltags.Add(c.Value);
            }
            return tags;
        }
        public static IEnumerable<Tuple<string, double>> Query(string line) {
            Match m = trainingRegex.Match(line);
            if (m.Success) {//training data
                Train(line);
                return null;
            } else {//query
                return Recommend(line);
            }
        }

        public static void Test(string line) {
            string text;
            List<String> tags = ParseTags(line, out text);
            IEnumerable<String> result = vs.TagFiltered(text).Select(x => x.Item1);
            foreach (EvaluationMetric m in metrics) {
                m.Process(tags, result);
            }
        }

        public static int Main(string[] args) {//run met "mono MLTag.exe trainfile+testfile ?logfile"
            args = new string[] { "S:\\thesis.txt" };
            metrics.Add(new TruePositivesMetric());
            metrics.Add(new FalsePositivesMetric());
            metrics.Add(new TrueNegativesMetric(tags.Length));
            metrics.Add(new FalseNegativesMetric());
            metrics.Add(new PrecisionMetric());
            metrics.Add(new RecallMetric());
            metrics.Add(new AccuracyMetric());
            metrics.Add(new FMeasureMetric());
            metrics.Add(new HammingLossMetric(tags.Length));
            vs = new VotingSystem(tags);

            //vs.AddRecommender(new NeuralNetworkRecommender());
            //vs.AddRecommender (new CustomRecommender (tags.Length));
            //vs.AddRecommender (new ID3Recommender(0.7d));
            //vs.AddRecommender (new NearestNeighbourRecommender());

            //vs.AddRecommender(new C45Recommender(tags));
            //vs.AddRecommender(new MLkNNRecommender(tags.Count()));
            //vs.AddRecommender(new VectorClassif(tags.Count()));
            vs.AddRecommender(new ConcreteCustomVectorRecommender(tags));

            Console.WriteLine("train");
            Stream s = File.Open(args[0], FileMode.Open, FileAccess.Read);
            List<string> test = new List<string>(readLines(s));
            List<string> train = new List<string>();
            s.Close();
            int tp = TRAIN_PERCENTAGE * test.Count / 100;
            Random rand = new Random();
            for (int i = 0; i < tp; i++) {
                int k = rand.Next(test.Count);
                train.Add(test[k]);
                test.RemoveAt(k);
            }
            #region Training
            foreach (string l in train) {
                Query(l);
            }
            vs.EndTrainingSession();
            #endregion
            #region TestInner
            foreach (string l in train) {
                Test(l);
            }
            Console.WriteLine("Inner Results:");
            foreach (EvaluationMetric m in metrics) {
                Console.WriteLine("\t{0} = {1}", m.Name, m.Result);
                m.Reset();
            }
            #endregion
            #region TestOuter
            foreach (string l in test) {
                Test(l);
            }
            Console.WriteLine("Outer Results:");
            foreach (EvaluationMetric m in metrics) {
                Console.WriteLine("\t{0} = {1}", m.Name, m.Result);
            }
            #endregion
            #region testFree
            string line = Console.ReadLine();
            while (line != "exit") {
                foreach (Tuple<string, double> kvp in vs.TagFiltered(line)) {
                    Console.WriteLine("{0} / {1}", kvp.Item1, kvp.Item2);
                }
                Console.WriteLine("-----------------");
                line = Console.ReadLine();
            }
            #endregion
            return 0;
        }

        private static IEnumerable<string> readLines(Stream s) {
            TextReader r = new StreamReader(s);
            string line = r.ReadLine();
            while (line != null) {
                yield return line;
                line = r.ReadLine();
            }
            r.Close();
        }

    }

}

