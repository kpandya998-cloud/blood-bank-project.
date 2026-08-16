using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace website_blood
{
    public partial class request_blood : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindHospitals();
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

        // Fetch hospital names from tbl_Hospitals into ddlHospital
        void BindHospitals()
        {
            getcon();

            da = new SqlDataAdapter("select HospitalName from tbl_Hospitals order by HospitalName asc", con);
            ds = new DataSet();
            da.Fill(ds);

            ddlHospital.DataSource = ds.Tables[0];
            ddlHospital.DataTextField = "HospitalName";
            ddlHospital.DataValueField = "HospitalName";
            ddlHospital.DataBind();

            ddlHospital.Items.Insert(0, new ListItem("Select Hospital", ""));
            ddlHospital.Items[0].Attributes["disabled"] = "disabled";

            con.Close();
        }

        // Automatically update hospital phone number when selected
        protected void ddlHospital_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlHospital.SelectedValue))
            {
                getcon();

                da = new SqlDataAdapter("select Phone from tbl_Hospitals where HospitalName='" + ddlHospital.SelectedValue + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    txtHospitalContact.Text = ds.Tables[0].Rows[0]["Phone"].ToString();
                }

                con.Close();
            }
        }

        void clear()
        {
            txtPatientName.Text = "";
            ddlCity.ClearSelection();
            ddlHospital.ClearSelection();
            ddlBloodGroup.ClearSelection();
            txtUnitsRequired.Text = "";
            ddlEmergencyLevel.ClearSelection();
            txtHospitalContact.Text = "";
            txtReason.Text = "";
        }

        protected void btnSubmitRequest_Click(object sender, EventArgs e)
        {
            // Server-Side Login Check
            if (Session["UserEmail"] == null)
            {
                lblStatusMessage.Visible = true;
                lblStatusMessage.CssClass = "alert alert-danger d-block text-center mb-0";
                lblStatusMessage.Text = "You must be logged in to submit a request. <a href='login.aspx' class='alert-link'>Click here to Login</a>";
                return;
            }

            getcon();

            // Direct SQL query using string concatenation
            cmd = new SqlCommand("insert into tbl_BloodRequests (PatientName, City, Hospital, BloodGroup, UnitsRequired, EmergencyLevel, HospitalContact, Reason) values ('" + txtPatientName.Text.Trim() + "', '" + ddlCity.SelectedValue + "', '" + ddlHospital.SelectedValue + "', '" + ddlBloodGroup.SelectedValue + "', '" + txtUnitsRequired.Text.Trim() + "', '" + ddlEmergencyLevel.SelectedValue + "', '" + txtHospitalContact.Text.Trim() + "', '" + txtReason.Text.Trim() + "')", con);
            cmd.ExecuteNonQuery();

            con.Close();

            lblStatusMessage.Visible = true;
            lblStatusMessage.CssClass = "alert alert-success d-block text-center mb-0";
            lblStatusMessage.Text = "Emergency blood request submitted successfully!";

            clear();
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