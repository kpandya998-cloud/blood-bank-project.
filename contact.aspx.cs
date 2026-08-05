using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace website_blood
{
    public partial class contact : System.Web.UI.Page
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
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtSubject.Text = "";
            txtMessage.Text = "";
        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            getcon();

            // Inserts contact form inputs into tbl_Contact
            cmd = new SqlCommand("insert into tbl_Contact(FullName, Email, Phone, Subject, Message) values('" + txtFullName.Text + "','" + txtEmail.Text + "','" + txtPhone.Text + "','" + txtSubject.Text + "','" + txtMessage.Text + "')", con);

            cmd.ExecuteNonQuery();

            lblOutput.Visible = true;
            lblOutput.CssClass = "alert alert-success d-block text-center";
            lblOutput.Text = "Your message has been sent successfully!";

            Clean();
        }
    }
}