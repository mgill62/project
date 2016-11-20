using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Create_Forum_Project
{
    public partial class forumLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btn_Login_Click(object sender, EventArgs e)
        {
            int flag = 0;
            int ID = 0;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FRCon"].ConnectionString);
            SqlCommand cmd = new SqlCommand("select * from Forum_Registration where username='" + txtusername.Text + "'", con);
            con.Open();
            if (con.State == ConnectionState.Open)
            {
                SqlDataReader dr;
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    if (dr["username"].ToString().Equals(txtusername.Text) && dr["password"].ToString().Equals(txtpassword.Text))
                    {
                        flag = 1;
                        ID = Convert.ToInt32(dr["usernameID"].ToString());
                        break;
                    }
                }
                if (flag == 1)
                {
                    Session["nam"] = txtusername.Text;
                    Session["ID"] = ID;
                    Response.Redirect("~/default.aspx?id="+ID);
                }
            }
            Response.Write("Invalid Username and Password");
        }
    }
}