using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace website_blood
{
    public partial class register : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public void getcon()
        {
            con = new SqlConnection(s);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        public void Clean()
        {
            txtFullName.Text = "";
            txtPhone.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtCity.Text = "";
            txtOrganization.Text = "";
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Server-side fallback validation check
            if (string.IsNullOrWhiteSpace(txtFullName.Text) ||
                string.IsNullOrWhiteSpace(txtPhone.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtPassword.Text) ||
                string.IsNullOrWhiteSpace(txtCity.Text))
            {
                lblOutput.Visible = true;
                lblOutput.CssClass = "alert alert-danger d-block text-center";
                lblOutput.Text = "Please fill in all required fields.";
                return;
            }

            getcon();

            // Check if email already exists using direct query string
            cmd = new SqlCommand("select count(*) from tbl_Register where Email='" + txtEmail.Text.Trim() + "'", con);
            int count = Convert.ToInt32(cmd.ExecuteScalar());

            if (count > 0)
            {
                lblOutput.Visible = true;
                lblOutput.CssClass = "alert alert-warning d-block text-center";
                lblOutput.Text = "An account with this email address already exists. Please login.";
                con.Close();
                return;
            }

            // Insert user into database using direct string concatenation
            cmd = new SqlCommand("insert into tbl_Register (Role, FullName, Phone, Email, Password, City, Organization) values ('User', '" + txtFullName.Text.Trim() + "', '" + txtPhone.Text.Trim() + "', '" + txtEmail.Text.Trim() + "', '" + txtPassword.Text + "', '" + txtCity.Text.Trim() + "', '" + txtOrganization.Text.Trim() + "')", con);
            cmd.ExecuteNonQuery();

            con.Close();

            lblOutput.Visible = true;
            lblOutput.CssClass = "alert alert-success d-block text-center";
            lblOutput.Text = "Registration successful! You can now log in.";

            Clean();
        }

        // Handles header navbar logout request
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/login.aspx");
        }
    }
} 