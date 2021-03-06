﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Create_Forum_Project
{
    public partial class Home : System.Web.UI.Page
    {
        string user1;
        int ID;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["FRCon"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            //if(!IsPostBack)
            //{
                user1 = Session["nam"].ToString();
                ID = Convert.ToInt32(Session["ID"].ToString());
                welcome.InnerHtml = user1.ToString();
                div_dashboard_box.Visible = true;
                LoadPost();
            //}
            //else
            //{
            //    Response.Redirect("~/Default.aspx");
            //}
        }
        
        public void LoadPost()
        {
            SqlDataAdapter da = new SqlDataAdapter("select f.postid, (select username from Forum_Registration where usernameID ='" + ID + "') as username, f.posttitle, f.postmessage, f.posteddate from forum_post f where usernameID =" +ID, con);
            con.Open();
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {



                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    string id = ds.Tables[0].Rows[i]["postid"].ToString();
                    string author = ds.Tables[0].Rows[i]["username"].ToString();
                    string title = ds.Tables[0].Rows[i]["posttitle"].ToString();
                    string postmsg = ds.Tables[0].Rows[i]["postmessage"].ToString();
                    HtmlGenericControl divpost = new HtmlGenericControl("div");
                    divpost.Attributes.Add("class", "div_post_display");
                    divpost.Attributes.Add("id", id);
                    /* Post Authro */
                    HtmlGenericControl lblauthor = new HtmlGenericControl("label");
                    lblauthor.Attributes.Add("class", "divauthor");
                    lblauthor.InnerText = "Author :" + author; ;
                    /* Post Title (H2) */
                    HtmlGenericControl h2 = new HtmlGenericControl("h2");
                    h2.InnerText = title.ToString();
                    /* Post Message */
                    HtmlGenericControl divpostmsg = new HtmlGenericControl("div");
                    divpostmsg.Attributes.Add("class", "divpostmsg");
                    divpostmsg.InnerText = postmsg; ;


                    HtmlGenericControl divreader = new HtmlGenericControl("div");
                    divreader.Attributes.Add("class", "divreader");
                    divpost.Controls.Add(divreader);


                    divpost.Controls.Add(lblauthor);
                    divpost.Controls.Add(h2);
                    divpost.Controls.Add(divpostmsg);
                    divpost.Controls.Add(divreader);
                    div_post_display_panel.Controls.Add(divpost);
                }
            }
        }
       
        public void ReadArticles1(string id)
        {
            Response.Write(id);
        }

        protected void btnProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Profile.aspx?id=" + ID);
        }
    }
}
