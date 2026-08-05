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
    public partial class contact : System.Web.UI.Page
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
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtSubject.Text = "";
            txtMessage.Text = "";
        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            // Server-side login check login n hoy toh n thay send msg 
            if (Session["UserEmail"] == null)
            {
                lblOutput.Visible = true;
                lblOutput.CssClass = "alert alert-danger d-block text-center";
                lblOutput.Text = "You must be logged in to send a message. <a href='login.aspx' class='alert-link'>Click here to Login</a>";
                return;
            }

            getcon();

            // Direct SQL query using string concatenation
            cmd = new SqlCommand("insert into tbl_Contact (FullName, Email, Phone, Subject, Message) values ('" + txtFullName.Text.Trim() + "', '" + txtEmail.Text.Trim() + "', '" + txtPhone.Text.Trim() + "', '" + txtSubject.Text.Trim() + "', '" + txtMessage.Text.Trim() + "')", con);
            cmd.ExecuteNonQuery();

            con.Close();

            lblOutput.Visible = true;
            lblOutput.CssClass = "alert alert-success d-block text-center";
            lblOutput.Text = "Your message has been sent successfully!";

            clear();
        }

        // Handles logout when triggered from the navbar header
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/login.aspx");
        }
    }
}