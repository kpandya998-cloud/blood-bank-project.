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
    public partial class search_blood : System.Web.UI.Page
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
                BindHospitalsDropdown();
                BindSearchResults("", "", "");
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

        // Populate hospital dropdown filter dynamically
        void BindHospitalsDropdown()
        {
            getcon();

            da = new SqlDataAdapter("select HospitalName from tbl_Hospitals order by HospitalName asc", con);
            ds = new DataSet();
            da.Fill(ds);

            ddlHospital.DataSource = ds.Tables[0];
            ddlHospital.DataTextField = "HospitalName";
            ddlHospital.DataValueField = "HospitalName";
            ddlHospital.DataBind();

            ddlHospital.Items.Insert(0, new ListItem("Any", ""));

            con.Close();
        }

        // Query database based on City, Blood Group, and Hospital selection
        void BindSearchResults(string city, string bloodGroup, string hospital)
        {
            getcon();

            string query = "SELECT HospitalId, HospitalName, City, Phone, ISNULL(AvailableBloodGroups, 'O+, B+, A+') AS AvailableBloodGroups, ISNULL(UnitsAvailable, 0) AS UnitsAvailable FROM tbl_Hospitals WHERE 1=1";

            if (!string.IsNullOrEmpty(city))
            {
                query += " AND City = '" + city + "'";
            }

            if (!string.IsNullOrEmpty(bloodGroup))
            {
                query += " AND AvailableBloodGroups LIKE '%" + bloodGroup + "%'";
            }

            if (!string.IsNullOrEmpty(hospital) && hospital != "Any")
            {
                query += " AND HospitalName = '" + hospital + "'";
            }

            query += " ORDER BY HospitalName ASC";

            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);

            rptrSearchResults.DataSource = ds.Tables[0];
            rptrSearchResults.DataBind();

            con.Close();
        }

        // Search button handler
        protected void btnFindBlood_Click(object sender, EventArgs e)
        {
            string city = ddlCity.SelectedValue.Trim();
            string bloodGroup = ddlBloodGroup.SelectedValue.Trim();
            string hospital = ddlHospital.SelectedValue.Trim();

            BindSearchResults(city, bloodGroup, hospital);
        }

        // Render color-coded status badges based on available stock
        public string GetStatusBadge(int units)
        {
            if (units >= 10)
            {
                return "<span class='badge bg-success'>Available</span>";
            }
            else if (units > 0)
            {
                return "<span class='badge bg-warning text-dark'>Limited</span>";
            }
            else
            {
                return "<span class='badge bg-danger'>Urgent</span>";
            }
        }

        // Handles header navbar logout request via triggerLogout JS call
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/login.aspx");
        }
    }
}