using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["s"] == String.Empty || Request.QueryString["s"] == null)
        {
            cover.InnerText = " No Search Results found!";
            Page.Title = "No Search Results found";
            return;
        }
        else
        {
            if (new CourseManager().searchResults(Request.QueryString["s"]).ToString() == "")
            {
                cover.InnerText = "No Search Results found for '" + Request.QueryString["search"] + "'";
            }

            else
            {
                cover.InnerText = " Search Results for '" + Request.QueryString["s"] + "'";
                coursebox.InnerHtml = new CourseManager().searchResults(Request.QueryString["s"]).ToString();
            }
        }
    }
}
