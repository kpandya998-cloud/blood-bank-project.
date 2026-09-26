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
    public partial class userpanel : System.Web.UI.Page
    {
        SqlConnection con; // For Connection
        SqlCommand cmd; // For Insert, Update, Delete
        SqlDataAdapter da; // For Data Adapter
        DataSet ds; // For Dataset

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString; // Connection String

        protected void Page_Load(object sender, EventArgs e)
        {
            // Verify User Session
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("~/login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                FetchUserData();
                CheckDonorStatus();
                FetchRequestHistory();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        // Retrieve Logged-in User Profile Details using SqlDataAdapter & DataSet
        void FetchUserData()
        {
            getcon();

            da = new SqlDataAdapter("select FullName, Email, Phone, City from tbl_Register where Email='" + Session["UserEmail"].ToString() + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                txtFullName.Text = ds.Tables[0].Rows[0]["FullName"].ToString();
                txtEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                txtPhone.Text = ds.Tables[0].Rows[0]["Phone"].ToString();
                txtCity.Text = ds.Tables[0].Rows[0]["City"].ToString();
            }

            con.Close();
        }

        // Check if current user exists in tbl_Donors
        void CheckDonorStatus()
        {
            getcon();

            da = new SqlDataAdapter("select count(*) from tbl_Donors where Email='" + Session["UserEmail"].ToString() + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            int donorCount = Convert.ToInt32(ds.Tables[0].Rows[0][0]);

            con.Close();

            if (donorCount > 0)
            {
                // User is registered as a donor
                lnkDonorPanel.Visible = true;
                lnkBecomeDonor.Visible = false;
            }
            else
            {
                // User is not a donor
                lnkDonorPanel.Visible = false;
                lnkBecomeDonor.Visible = true;
            }
        }

        // Fetch Blood Requests from Database using SqlDataAdapter & DataSet
        void FetchRequestHistory()
        {
            getcon();

            da = new SqlDataAdapter("select RequestDate, BloodGroup, Hospital, 'Pending' as Status from tbl_BloodRequests where PatientName = (select FullName from tbl_Register where Email='" + Session["UserEmail"].ToString() + "') order by RequestDate desc", con);
            ds = new DataSet();
            da.Fill(ds);

            gvRequests.DataSource = ds.Tables[0];
            gvRequests.DataBind();

            con.Close();
        }

        // Save Updated Profile Details
        protected void btnSave_Click(object sender, EventArgs e)
        {
            getcon();

            cmd = new SqlCommand("update tbl_Register set FullName='" + txtFullName.Text.Trim() + "', Phone='" + txtPhone.Text.Trim() + "', City='" + txtCity.Text.Trim() + "' where Email='" + Session["UserEmail"].ToString() + "'", con);
            cmd.ExecuteNonQuery();

            con.Close();

            lblMsg.Visible = true;
        }

        // Logout Handler
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/login.aspx");
        }
    }
}