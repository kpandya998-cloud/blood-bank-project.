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
using System.Text;

namespace website_blood
{
    public partial class hospitals : System.Web.UI.Page
    {
        SqlConnection con; // For Connection
        SqlCommand cmd; // For insert, update, delete
        SqlDataAdapter da; // For Container
        DataSet ds; // For Select

        // Fetch connection string from Web.config
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Bind hospital list on initial page load
            if (!IsPostBack)
            {
                BindHospitals();
            }
        }

        // open database connection
        void getcon()
        {
            con = new SqlConnection(s);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        // Fetch all registered hospitals using DataSet
        private void BindHospitals()
        {
            getcon();

            da = new SqlDataAdapter("SELECT HospitalId, HospitalName, City, Phone, ISNULL(Address, City) AS Address, ISNULL(AvailableBloodGroups, 'O+, B+, A+') AS AvailableBloodGroups, ISNULL(BadgeType, 'Verified') AS BadgeType, ISNULL(ImageUrl, 'https://images.unsplash.com/photo-1586773860418-d37222d8fce3?q=80&w=800&auto=format&fit=crop') AS ImageUrl, ISNULL(UnitsAvailable, 0) AS UnitsAvailable FROM tbl_Hospitals", con);
            ds = new DataSet();
            da.Fill(ds);

            rptrHospitals.DataSource = ds.Tables[0];
            rptrHospitals.DataBind();

            con.Close();
        }

        // Helper function to render styled HTML badges for blood groups
        public string GetBloodGroupPills(string bgList)
        {
            if (string.IsNullOrEmpty(bgList)) return "";

            string[] groups = bgList.Split(new char[] { ',', ' ' }, StringSplitOptions.RemoveEmptyEntries);
            StringBuilder sb = new StringBuilder();

            string[] colors = { "blood-pill-red", "blood-pill-blue", "blood-pill-green" };
            int index = 0;

            foreach (string bg in groups)
            {
                string colorClass = colors[index % colors.Length];
                sb.AppendFormat("<span class='blood-pill {0}'>{1}</span>", colorClass, bg.Trim());
                index++;
            }

            return sb.ToString();
        } 

        // Handles logout when triggered from header/navbar
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/login.aspx");
        }
    }
} 