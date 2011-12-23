using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MLTag;

namespace WebTodoApp.todo {
    public partial class Index : System.Web.UI.Page {
        private static int c = 0;
        private static Controller cont;
        private static Exception ex;

        protected void Page_Load(object sender, EventArgs e){
            if (cont == null) {
                try {
                    cont = new Controller("S:\\todos");
                } catch (Exception exe) {
                    ex = exe;
                }
            }
            
            //txtTodo.Attributes.Add("onChange", "$find('dpBeh').populate(this.value);");
            //tagOut.Attributes.Add("onclick", "alert('boe')");
        }



        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string Populate(string contextKey) {
            //return "'" + contextKey + "'";
            if (contextKey == null) {
                contextKey = "";
            }
            c++;
            string toRet = cont.Tag(contextKey).Count()+" suggestions:<br><br><br>";
            if (ex != null) {
                toRet += ex + "<br>";
            }
            foreach(Tuple<string,double> tup in cont.Tag(contextKey)){
                string g = ((int)Math.Round(tup.Item2 * 196)).ToString("x");
                string r = ((int)Math.Round((1-tup.Item2) * 196)).ToString("x");
                if (g.Length == 1) {
                    g = "0" + g;
                }
                if (r.Length == 1) {
                    r = "0" + r;
                }
                toRet += "<p style=\"color:#" + r + g + "00\"> <input class=\"todoCheckBox\" name="+tup.Item1+" type=\"checkbox\" checked > " + tup.Item1 + " (" + tup.Item2 + ")</input></p><br>";
            }
            toRet += "<i>Request number: "+c+"</i>";
            
            return toRet;
        }

    }
}