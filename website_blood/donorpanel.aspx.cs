using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace website_blood
{
    public partial class donorpanel : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        // Fetch connection string from Web.config
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Verify active user session
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("~/login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                FetchDonorData();
                FetchRequests();
                FetchDonationHistory();
            }
        }

        // Initialize SQL Connection
        public void getcon()
        {
            con = new SqlConnection(s);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        // Fetch profile details using DataSet and bind using Rows[0][index] / Rows[0]["ColumnName"]
        public void FetchDonorData()
        {
            getcon();

            da = new SqlDataAdapter("SELECT r.FullName, r.Email, r.Phone, r.City, d.BloodGroup, d.Address, d.LastDonationDate FROM tbl_Register r INNER JOIN tbl_Donors d ON r.Email = d.Email WHERE r.Email = '" + Session["UserEmail"].ToString() + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                string fullName = ds.Tables[0].Rows[0][0].ToString();
                string email = ds.Tables[0].Rows[0]["Email"].ToString();
                string phone = ds.Tables[0].Rows[0][2].ToString();
                string city = ds.Tables[0].Rows[0]["City"].ToString();
                string bloodGroup = ds.Tables[0].Rows[0]["BloodGroup"].ToString();
                string address = ds.Tables[0].Rows[0]["Address"].ToString();

                // Bind Header and Dashboard Literals
                litWelcomeName.Text = fullName;
                litTopName.Text = fullName;
                litAvatar.Text = !string.IsNullOrEmpty(fullName) ? fullName.Substring(0, 1).ToUpper() : "D";
                litBloodGroup.Text = bloodGroup;

                // Safe Date parsing from DataSet row
                string rawDate = ds.Tables[0].Rows[0]["LastDonationDate"].ToString();
                DateTime parsedDate;

                if (!string.IsNullOrEmpty(rawDate) && DateTime.TryParse(rawDate, out parsedDate))
                {
                    litLastDonation.Text = parsedDate.ToString("dd-MMM-yyyy");
                }
                else
                {
                    litLastDonation.Text = "N/A";
                }

                // Bind Profile Form Fields
                txtFullName.Text = fullName;
                txtEmail.Text = email;
                txtPhone.Text = phone;
                txtCity.Text = city;
                txtAddress.Text = address;

                if (ddlBloodGroup.Items.FindByValue(bloodGroup) != null)
                {
                    ddlBloodGroup.SelectedValue = bloodGroup;
                }
            }

            con.Close();
        }

        // Fetch blood requests matching the donor's city or blood group
        public void FetchRequests()
        {
            getcon();

            da = new SqlDataAdapter("SELECT DISTINCT br.Hospital, br.City, br.BloodGroup, br.UnitsRequired, br.EmergencyLevel, br.HospitalContact FROM tbl_BloodRequests br INNER JOIN tbl_Register r ON br.City = r.City INNER JOIN tbl_Donors d ON br.BloodGroup = d.BloodGroup WHERE r.Email = '" + Session["UserEmail"].ToString() + "' OR d.Email = '" + Session["UserEmail"].ToString() + "' ORDER BY br.Hospital", con);
            ds = new DataSet();
            da.Fill(ds);

            // Bind top 3 requests to Dashboard overview
            DataTable dtTop = ds.Tables[0].Clone();
            for (int i = 0; i < ds.Tables[0].Rows.Count && i < 3; i++)
            {
                dtTop.ImportRow(ds.Tables[0].Rows[i]);
            }

            gvDashRequests.DataSource = dtTop;
            gvDashRequests.DataBind();

            // Bind all requests to Nearby Requests grid
            gvAllRequests.DataSource = ds.Tables[0];
            gvAllRequests.DataBind();

            con.Close();
        }

        // Fetch completed donation records into DataSet
        public void FetchDonationHistory()
        {
            getcon();

            da = new SqlDataAdapter("SELECT GETDATE() AS DonationDate, br.Hospital, br.City, br.UnitsRequired AS Units FROM tbl_BloodRequests br INNER JOIN tbl_Register r ON br.PatientName = r.FullName WHERE r.Email = '" + Session["UserEmail"].ToString() + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            gvHistory.DataSource = ds.Tables[0];
            gvHistory.DataBind();
            litTotalDonations.Text = ds.Tables[0].Rows.Count.ToString();

            con.Close();
        }

        // Handle profile save button click using inline SQL string statements
        protected void btnSave_Click(object sender, EventArgs e)
        {
            getcon();

            // Update tbl_Register details
            cmd = new SqlCommand("UPDATE tbl_Register SET FullName='" + txtFullName.Text.Trim() + "', Phone='" + txtPhone.Text.Trim() + "', City='" + txtCity.Text.Trim() + "' WHERE Email='" + Session["UserEmail"].ToString() + "'", con);
            cmd.ExecuteNonQuery();

            // Update tbl_Donors details
            cmd = new SqlCommand("UPDATE tbl_Donors SET FullName='" + txtFullName.Text.Trim() + "', Phone='" + txtPhone.Text.Trim() + "', City='" + txtCity.Text.Trim() + "', BloodGroup='" + ddlBloodGroup.SelectedValue + "', Address='" + txtAddress.Text.Trim() + "' WHERE Email='" + Session["UserEmail"].ToString() + "'", con);
            cmd.ExecuteNonQuery();

            con.Close();

            lblMsg.Visible = true;
            FetchDonorData();
        }

        // Navigate back to user panel
        protected void btnBackToUserPanel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/userpanel.aspx");
        }

        // Handle donor logout
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/login.aspx");
        }
    }
}