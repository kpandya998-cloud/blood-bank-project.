using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace website_blood
{
    public partial class become_donor : System.Web.UI.Page
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
            txtName.Text = "";
            txtAge.Text = "";
            ddlGender.ClearSelection();
            ddlBloodGroup.ClearSelection();
            txtPhone.Text = "";
            txtEmail.Text = "";
            txtCity.Text = "";
            txtAddress.Text = "";
            txtLastDonationDate.Text = "";
            ddlHealthStatus.ClearSelection();
        }

        protected void btnRegisterDonor_Click(object sender, EventArgs e)
        {
            getcon();

            // Insert donor details into tbl_Donors
            cmd = new SqlCommand("insert into tbl_Donors(FullName, Age, Gender, BloodGroup, Phone, Email, City, Address, LastDonationDate, HealthStatus) values('" + txtName.Text + "','" + txtAge.Text + "','" + ddlGender.SelectedValue + "','" + ddlBloodGroup.SelectedValue + "','" + txtPhone.Text + "','" + txtEmail.Text + "','" + txtCity.Text + "','" + txtAddress.Text + "','" + txtLastDonationDate.Text + "','" + ddlHealthStatus.SelectedValue + "')", con);

            cmd.ExecuteNonQuery();

            lblOutput.Visible = true;
            lblOutput.CssClass = "alert alert-success d-block text-center";
            lblOutput.Text = "Donor registered successfully!";

            Clean();
        }
    }
}