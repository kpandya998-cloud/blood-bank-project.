using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace website_blood
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            lblOutput.CssClass = "text-dark fw-normal d-block p-3 bg-white border rounded shadow-sm";
            lblOutput.Text = "<b>Email:</b> " + txtEmail.Text + "<br />" +
                             "<b>Password:</b> " + txtPassword.Text + "<br />" +
                             "<b>Remember Me:</b> " + (chkRememberMe.Checked ? "Yes" : "No");

            lblOutput.Visible = true;
        }
    }
}