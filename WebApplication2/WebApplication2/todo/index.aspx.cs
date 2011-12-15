using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.todo {
    public partial class WebForm1 : System.Web.UI.Page {
        private static int c = 0;

        protected void Page_Load(object sender, EventArgs e){
            //txtTodo.Attributes.Add("onKeyUp", "$find('dpBeh').populate(this.value);");
        }



        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string Populate(string contextKey) {
            c++;
            
            return "Suggested todos:<br>"+c+" : "+contextKey;
        }

    }
}