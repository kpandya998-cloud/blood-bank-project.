using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text;

namespace website_blood
{
    public partial class adminpanel : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null || Session["UserEmail"].ToString().ToLower() != "admin@gmail.com")
            {
                Response.Redirect("~/login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadAdminProfile();
                LoadDashboardStats();
                LoadHospitalStockBreakdown();
                LoadRecentRequests();
                LoadDonors();
                LoadHospitals();
                LoadAllRequests();
                LoadUsers();
            }
        }

        public void getcon()
        {
            con = new SqlConnection(s);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        private void LoadAdminProfile()
        {
            litAdminName.Text = "Admin User";
            litAdminAvatar.Text = "A";
            txtAdminName.Text = "Admin User";
            txtAdminEmail.Text = "admin@gmail.com";
        }

        private void LoadDashboardStats()
        {
            getcon();

            da = new SqlDataAdapter("select count(*) from tbl_Donors", con);
            ds = new DataSet();
            da.Fill(ds);
            litTotalDonors.Text = ds.Tables[0].Rows[0][0].ToString();

            da = new SqlDataAdapter("select count(*) from tbl_Hospitals", con);
            ds = new DataSet();
            da.Fill(ds);
            litTotalHospitals.Text = ds.Tables[0].Rows[0][0].ToString();

            da = new SqlDataAdapter("select count(*) from tbl_BloodRequests", con);
            ds = new DataSet();
            da.Fill(ds);
            litPendingRequests.Text = ds.Tables[0].Rows[0][0].ToString();

            da = new SqlDataAdapter("select isnull(sum(UnitsAvailable), 0) from tbl_Hospitals", con);
            ds = new DataSet();
            da.Fill(ds);
            litUnitsAvailable.Text = ds.Tables[0].Rows[0][0].ToString();

            con.Close();
        }

        // Binds hospital blood stock breakdown table for the Dashboard
        private void LoadHospitalStockBreakdown()
        {
            getcon();

            da = new SqlDataAdapter("select HospitalName, City, Phone, isnull(AvailableBloodGroups, '') as AvailableBloodGroups, isnull(UnitsAvailable, 0) as UnitsAvailable from tbl_Hospitals order by UnitsAvailable desc", con);
            ds = new DataSet();
            da.Fill(ds);

            gvHospitalStockBreakdown.DataSource = ds.Tables[0];
            gvHospitalStockBreakdown.DataBind();

            con.Close();
        }

        // Formats blood groups into tags showing calculated units per blood group
        public string FormatBloodGroupStock(string rawGroups, object totalUnitsObj)
        {
            if (string.IsNullOrEmpty(rawGroups))
                return "<span class='text-muted small'>No blood groups specified</span>";

            int totalUnits = 0;
            if (totalUnitsObj != null && totalUnitsObj != DBNull.Value)
            {
                int.TryParse(totalUnitsObj.ToString(), out totalUnits);
            }

            string[] groups = rawGroups.Split(new char[] { ',', ' ' }, StringSplitOptions.RemoveEmptyEntries);
            if (groups.Length == 0) return "<span class='text-muted small'>None</span>";

            // Calculates available units per blood group
            int perGroupUnits = totalUnits > 0 ? (int)Math.Ceiling((double)totalUnits / groups.Length) : 0;

            StringBuilder sb = new StringBuilder();

            foreach (string group in groups)
            {
                string cleanGroup = group.Trim();
                if (!string.IsNullOrEmpty(cleanGroup))
                {
                    sb.AppendFormat("<div class='bc-blood-unit-tag'><strong>{0}:</strong> <span>{1} Units</span></div>", cleanGroup, perGroupUnits);
                }
            }

            return sb.ToString();
        }

        private void LoadRecentRequests()
        {
            getcon();

            da = new SqlDataAdapter("select top 4 Id, PatientName, BloodGroup, Hospital, City, EmergencyLevel, HospitalContact from tbl_BloodRequests order by Id desc", con);
            ds = new DataSet();
            da.Fill(ds);

            gvDashRequests.DataSource = ds.Tables[0];
            gvDashRequests.DataBind();

            con.Close();
        }

        private void LoadDonors()
        {
            getcon();

            string query = "select Id as DonorId, FullName, BloodGroup, City, Phone, isnull(convert(varchar, LastDonationDate, 105), 'N/A') as LastDonationDate, 'Eligible' as Status from tbl_Donors where 1=1";

            if (txtSearchDonor.Text.Trim() != "")
            {
                query += " and FullName like '%" + txtSearchDonor.Text.Trim() + "%'";
            }

            if (ddlFilterBloodGroup.SelectedValue != "")
            {
                query += " and BloodGroup = '" + ddlFilterBloodGroup.SelectedValue + "'";
            }

            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);

            gvDonors.DataSource = ds.Tables[0];
            gvDonors.DataBind();

            con.Close();
        }

        private void LoadHospitals()
        {
            getcon();

            da = new SqlDataAdapter("select HospitalId, HospitalName, City, Phone, UnitsAvailable, isnull(ImageUrl, 'uploads/hospitals/default-hospital.jpg') as ImageUrl from tbl_Hospitals", con);
            ds = new DataSet();
            da.Fill(ds);

            gvHospitals.DataSource = ds.Tables[0];
            gvHospitals.DataBind();

            con.Close();
        }

        private void LoadAllRequests()
        {
            getcon();

            da = new SqlDataAdapter("select Id, PatientName, City, Hospital, BloodGroup, UnitsRequired, EmergencyLevel, HospitalContact, Reason, RequestDate from tbl_BloodRequests order by Id desc", con);
            ds = new DataSet();
            da.Fill(ds);

            gvAllRequests.DataSource = ds.Tables[0];
            gvAllRequests.DataBind();

            con.Close();
        }

        private void LoadUsers()
        {
            getcon();

            da = new SqlDataAdapter("select Id as UserId, FullName, Email, 'User' as Role, 'Active' as Status from tbl_Register", con);
            ds = new DataSet();
            da.Fill(ds);

            gvUsers.DataSource = ds.Tables[0];
            gvUsers.DataBind();

            con.Close();
        }

        protected void btnSaveHospital_Click(object sender, EventArgs e)
        {
            string imagePath = "uploads/hospitals/default-hospital.jpg";

            if (fuHospitalImage.HasFile)
            {
                string ext = Path.GetExtension(fuHospitalImage.FileName).ToLower();
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext == ".webp")
                {
                    string folderPath = Server.MapPath("~/uploads/hospitals/");
                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }

                    string uniqueFileName = Guid.NewGuid().ToString() + ext;
                    fuHospitalImage.SaveAs(folderPath + uniqueFileName);
                    imagePath = "uploads/hospitals/" + uniqueFileName;
                }
            }

            int units = txtHospitalUnits.Text.Trim() == "" ? 0 : Convert.ToInt32(txtHospitalUnits.Text.Trim());

            getcon();

            cmd = new SqlCommand("insert into tbl_Hospitals (HospitalName, City, Phone, Address, AvailableBloodGroups, BadgeType, ImageUrl, UnitsAvailable) values ('" + txtHospitalName.Text.Trim() + "', '" + txtHospitalCity.Text.Trim() + "', '" + txtHospitalPhone.Text.Trim() + "', '" + txtHospitalAddress.Text.Trim() + "', '" + txtHospitalBloodGroups.Text.Trim() + "', '" + ddlBadgeType.SelectedValue + "', '" + imagePath + "', " + units + ")", con);
            cmd.ExecuteNonQuery();

            con.Close();

            txtHospitalName.Text = "";
            txtHospitalCity.Text = "";
            txtHospitalPhone.Text = "";
            txtHospitalAddress.Text = "";
            txtHospitalBloodGroups.Text = "";
            txtHospitalUnits.Text = "0";

            LoadHospitals();
            LoadHospitalStockBreakdown();
            LoadDashboardStats();
        }

        protected void gvHospitals_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "RemoveHospital")
            {
                getcon();

                cmd = new SqlCommand("delete from tbl_Hospitals where HospitalId='" + e.CommandArgument.ToString() + "'", con);
                cmd.ExecuteNonQuery();

                con.Close();

                LoadHospitals();
                LoadHospitalStockBreakdown();
                LoadDashboardStats();
            }
        }

        protected void gvAllRequests_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRequest")
            {
                getcon();

                cmd = new SqlCommand("delete from tbl_BloodRequests where Id='" + e.CommandArgument.ToString() + "'", con);
                cmd.ExecuteNonQuery();

                con.Close();

                LoadAllRequests();
                LoadRecentRequests();
                LoadDashboardStats();
            }
        }

        protected void btnSaveDonor_Click(object sender, EventArgs e)
        {
            getcon();

            cmd = new SqlCommand("insert into tbl_Donors (FullName, BloodGroup, City, Phone, Email) values ('" + txtDonorName.Text.Trim() + "', '" + ddlDonorBloodGroup.SelectedValue + "', '" + txtDonorCity.Text.Trim() + "', '" + txtDonorPhone.Text.Trim() + "', '" + txtDonorEmail.Text.Trim() + "')", con);
            cmd.ExecuteNonQuery();

            con.Close();

            txtDonorName.Text = "";
            txtDonorCity.Text = "";
            txtDonorPhone.Text = "";
            txtDonorEmail.Text = "";

            LoadDonors();
            LoadDashboardStats();
        }

        protected void btnFilterDonors_Click(object sender, EventArgs e)
        {
            LoadDonors();
        }

        protected void gvDonors_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "RemoveDonor")
            {
                getcon();

                cmd = new SqlCommand("delete from tbl_Donors where Id='" + e.CommandArgument.ToString() + "'", con);
                cmd.ExecuteNonQuery();

                con.Close();

                LoadDonors();
                LoadDashboardStats();
            }
        }

        protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ToggleUserStatus")
            {
                getcon();

                cmd = new SqlCommand("delete from tbl_Register where Id='" + e.CommandArgument.ToString() + "'", con);
                cmd.ExecuteNonQuery();

                con.Close();

                LoadUsers();
            }
        }

        protected void btnSaveSettings_Click(object sender, EventArgs e)
        {
            lblSettingsMsg.Text = "Settings updated successfully.";
            lblSettingsMsg.Visible = true;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/login.aspx");
        }
    }
}