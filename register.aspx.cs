using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
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
            ddlRole.ClearSelection();
            txtFullName.Text = "";
            txtPhone.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtCity.Text = "";
            txtOrganization.Text = "";
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            getcon();

            // Table name updated to match tbl_Register in your database
            cmd = new SqlCommand("insert into tbl_Register(Role,FullName,Phone,Email,Password,City,Organization) values('" + ddlRole.SelectedValue + "','" + txtFullName.Text + "','" + txtPhone.Text + "','" + txtEmail.Text + "','" + txtPassword.Text + "','" + txtCity.Text + "','" + txtOrganization.Text + "')", con);
            cmd.ExecuteNonQuery();

            lblOutput.Visible = true;
            lblOutput.CssClass = "alert alert-success d-block text-center";
            lblOutput.Text = "Registration successful!";

            Clean();
        }
    }
} 