using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectBelle
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                if (txtEmail.Text.Length > 0 && txtPassword.Text.Length > 0)
                {
                    dbProcedures db = new dbProcedures();

                    string strPasswordHash = db.GetAccountHash(txtEmail.Text);

                    if (strPasswordHash.Length > 0)
                    {
                        if (PasswordHash.PasswordHash.ValidatePassword(txtPassword.Text, strPasswordHash))
                        {
                            Session["revei"] = db.CreateSession(txtEmail.Text, Request.UserHostAddress);
                            Response.Redirect("/dashboard");
                        }
                    }

                    db.Close();
                }

                txtPassword.Text = "";
                lblMessage.Text = "Invalid login.";
            }
            else
            {
                if (Session["otanalytics"] != null)
                {
                    if (Session["otanalytics"].ToString().Length > 0)
                    {
                        dbProcedures db = new dbProcedures();
                        if (db.ValidateSessionKey(Session["otanalytics"].ToString(), Request.UserHostAddress))
                        {
                            Response.Redirect("/dashboard");
                        }

                        db.Close();
                    }
                }

            }
        }
    }
}