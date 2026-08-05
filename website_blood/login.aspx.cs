using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// New Namespaces
using System.Data.SqlClient; // For Connection
using System.Data; // For Dataset
using System.Configuration; // For Connection String

namespace website_blood
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con; // For Connection
        SqlCommand cmd; // For insert, update, delete
        SqlDataAdapter da; // For Container
        DataSet ds; // For Select

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString; // For Connection String 

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        void getcon()
        {
            con = new SqlConnection(s);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string inputEmail = txtEmail.Text.Trim();
            string inputPassword = txtPassword.Text;

            // 1. Static Admin Login Check
            if (inputEmail.Equals("admin@gmail.com", StringComparison.OrdinalIgnoreCase) && inputPassword == "admin123")
            {
                Session["UserEmail"] = "admin@gmail.com";
                Session["UserRole"] = "Admin";
                Session["UserName"] = "Admin User";
                Response.Redirect("~/adminpanel.aspx");
                return;
            }

            // 2. Regular User Database Login Check using SqlDataAdapter & DataSet
            getcon();

            da = new SqlDataAdapter("select FullName, Email from tbl_Register where Email='" + inputEmail + "' and Password='" + inputPassword + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["UserEmail"] = ds.Tables[0].Rows[0]["Email"].ToString();
                Session["UserName"] = ds.Tables[0].Rows[0]["FullName"].ToString();
                Session["UserRole"] = "User";

                con.Close();
                Response.Redirect("~/userpanel.aspx");
            }
            else
            {
                con.Close();
                lblOutput.Visible = true;
                lblOutput.CssClass = "alert alert-danger d-block text-center";
                lblOutput.Text = "Invalid Email or Password!";
            }
        }
    }
}