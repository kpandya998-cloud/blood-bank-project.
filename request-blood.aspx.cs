using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace website_blood
{
    public partial class request_blood : System.Web.UI.Page
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
            txtPatientName.Text = "";
            ddlCity.SelectedIndex = 0;
            ddlHospital.SelectedIndex = 0;
            ddlBloodGroup.SelectedIndex = 0;
            txtUnitsRequired.Text = "";
            ddlEmergencyLevel.SelectedIndex = 0;
            txtReason.Text = "";
        }

        protected void btnSubmitRequest_Click(object sender, EventArgs e)
        {
            getcon();

            // Inserts form fields into tbl_BloodRequests
            cmd = new SqlCommand("insert into tbl_BloodRequests(PatientName, City, Hospital, BloodGroup, UnitsRequired, EmergencyLevel, HospitalContact, Reason) values('" + txtPatientName.Text + "','" + ddlCity.SelectedValue + "','" + ddlHospital.SelectedValue + "','" + ddlBloodGroup.SelectedValue + "','" + txtUnitsRequired.Text + "','" + ddlEmergencyLevel.SelectedValue + "','" + txtHospitalContact.Text + "','" + txtReason.Text + "')", con);

            cmd.ExecuteNonQuery();

            lblStatusMessage.Visible = true;
            lblStatusMessage.CssClass = "alert alert-success d-block text-center mb-0";
            lblStatusMessage.Text = "Emergency blood request submitted successfully!";

            Clean();
        }
    } 
}