using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace Create_Forum_Project
{
    public partial class Profile : System.Web.UI.Page
    {
        string user1;
        int ID;
        string datetime = System.DateTime.Now.Date.ToLongDateString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["nam"] == null)
                {
                    Response.Redirect("~/forumLogin.aspx");
                }
                else
                {
                    user1 = Session["nam"].ToString();
                   // ID = Convert.ToInt32(Session["ID"].ToString());
                    lblwelcom.InnerHtml = user1.ToString();
                    div_dashboard_box.Visible = true;

                    if (Int32.TryParse(Request.QueryString["id"], out ID))
                    {
                        DataTable profile = getProfile(ID);
                        DisplayProfile(profile);
                        imgProfile.ImageUrl = "~/images/" + ID + ".jpg";
                    }
                }
            }
        }

         //Getting data from View Stored Proc
        DataTable getProfile(Int32 profileId)
        {
            DataTable pT = new DataTable();
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["FRCon"].ConnectionString;
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "usp_ViewProfile";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Pid", profileId);
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(pT);
            return pT;
        }

        //Adding values from fetched data to text boxes
        void DisplayProfile(DataTable dt)
        {
            if(dt.Rows.Count > 0)
            {
                txtFirstName.Text = dt.Rows[0].GetStringValue("FirstName");
                txtLastName.Text = dt.Rows[0].GetStringValue("LastName");
                txtMiddleName.Text = dt.Rows[0].GetStringValue("MiddleName");
                txtContactNo.Text = dt.Rows[0].GetStringValue("ContactNo");
                txtCollege.Text = dt.Rows[0].GetStringValue("College");
                txtLocation.Text = dt.Rows[0].GetStringValue("Location");
                txtDescription.Text = dt.Rows[0].GetStringValue("Description");
                txtProfession.Text = dt.Rows[0].GetStringValue("Profession");
            }            
        }

       //On clicking update button
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Int32 id, ret = 0;
            Int32.TryParse(Request.QueryString["id"], out id);
            
            //Executing Update Stored Proc
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["FRCon"].ConnectionString;
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "usp_UpdateProfile";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Pid", id);
            cmd.Parameters.AddWithValue("@Pfirstname", txtFirstName.Text.ToString());
            cmd.Parameters.AddWithValue("@Plastname", txtLastName.Text.ToString());
            cmd.Parameters.AddWithValue("@Pmiddlename", txtMiddleName.Text.ToString());
            cmd.Parameters.AddWithValue("@Pcontact", txtContactNo.Text.ToString());
            cmd.Parameters.AddWithValue("@Plocation", txtLocation.Text.ToString());
            cmd.Parameters.AddWithValue("@Pdesc",txtDescription.Text.ToString());
            cmd.Parameters.AddWithValue("@Pcollege", txtCollege.Text.ToString());
            cmd.Parameters.AddWithValue("@Pprofession",txtProfession.Text.ToString());

            //To capture output from Stored Procedure
            SqlParameter retval = new SqlParameter("@Pret", DbType.Int32);
            retval.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(retval);
            con.Open();
            cmd.ExecuteNonQuery();
            ret = Convert.ToInt32(retval.Value);
            con.Close();

            if (ret == 0)
                Response.Write("<script>alert('Error while updating profile')</script");
            else if (ret == 1)
                Response.Write("<script>alert('Profile updated successfully')</script");            
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            Int32 id = 0;
            Int32.TryParse(Request.QueryString["id"], out id);
            if (FileUpload1.HasFile)
            {
                string fileName = id.ToString();
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/images/") + fileName + ".jpg");
                Response.Redirect(Request.Url.AbsoluteUri);
            }
        }
        protected void btnProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Profile.aspx?id=" + ID);
        }

    }

    //Class to get value of column
    public static class Extensions
    {
        public static string GetStringValue(this DataRow dr, string columnName)
        {
            string res = string.Empty;
            if (dr.Table.Columns.Contains(columnName))
            {
                //If value of that column is null then return empty string nor return the value
                res = Convert.IsDBNull(dr[columnName]) ? string.Empty : dr[columnName].ToString();
            }
            return res;
        }
    }
}