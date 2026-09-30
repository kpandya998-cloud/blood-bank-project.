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
    public partial class become_donor : System.Web.UI.Page
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

        void clear()
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

            // Direct SQL query using your form controls
            cmd = new SqlCommand("insert into tbl_Donors (FullName, Age, Gender, BloodGroup, Phone, Email, City, Address, LastDonationDate, HealthStatus) values ('" + txtName.Text.Trim() + "', '" + txtAge.Text.Trim() + "', '" + ddlGender.SelectedValue + "', '" + ddlBloodGroup.SelectedValue + "', '" + txtPhone.Text.Trim() + "', '" + txtEmail.Text.Trim() + "', '" + txtCity.Text.Trim() + "', '" + txtAddress.Text.Trim() + "', '" + txtLastDonationDate.Text.Trim() + "', '" + ddlHealthStatus.SelectedValue + "')", con);
            cmd.ExecuteNonQuery();

            con.Close();

            // Display SweetAlert2 success modal on page
            string script = "Swal.fire({'title':'Registration Successful!','text':'Thank you for registering as a blood donor. Your contribution saves lives.','icon':'success','confirmButtonColor':'#d33'});";
            ScriptManager.RegisterStartupScript(this, GetType(), "donorSuccessAlert", script, true);

            clear();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/login.aspx");
        }
    }
}