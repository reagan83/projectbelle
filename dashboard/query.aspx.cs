using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectBelle
{
    public partial class _query : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.AddHeader("Content-type", "text/json");
            int[] a  = new int[3];

            a[0] = 7;
            a[1] = 8;
            a[2] = 9;

            JavaScriptSerializer s = new JavaScriptSerializer();
            string arrayJson = s.Serialize(a);

            Response.Write(arrayJson);
            Response.End();



        }
    }
}