using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace website_blood
{
    public partial class emergency : System.Web.UI.Page
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
                BindEmergencyResults("", "");
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

        // Search emergency blood availability from tbl_Hospitals
        void BindEmergencyResults(string city, string bloodGroup)
        {
            getcon();

            string query = "SELECT HospitalId, HospitalName, City, Phone, ISNULL(Address, City) AS Address, ISNULL(AvailableBloodGroups, 'O+, B+, A+') AS AvailableBloodGroups, ISNULL(BadgeType, 'Verified') AS BadgeType, ISNULL(UnitsAvailable, 0) AS UnitsAvailable FROM tbl_Hospitals WHERE 1=1";

            if (!string.IsNullOrEmpty(city))
            {
                query += " AND City = '" + city + "'";
            }

            if (!string.IsNullOrEmpty(bloodGroup))
            {
                query += " AND AvailableBloodGroups LIKE '%" + bloodGroup + "%'";
            }

            query += " ORDER BY UnitsAvailable DESC, HospitalName ASC";

            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);

            rptrEmergencyResults.DataSource = ds.Tables[0];
            rptrEmergencyResults.DataBind();

            lblResultCount.Text = ds.Tables[0].Rows.Count + " Available Center(s)";

            con.Close();
        }

        protected void btnEmergencySearch_Click(object sender, EventArgs e)
        {
            string city = ddlEmergencyCity.SelectedValue.Trim();
            string bloodGroup = hfSelectedBlood.Value.Trim();

            BindEmergencyResults(city, bloodGroup);
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