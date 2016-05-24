using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_SearchResults : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        username.InnerText = HttpContext.Current.User.Identity.Name;
        if (Request.QueryString["Search"] == String.Empty)
        {
            cover.InnerText = " No Search Results found!";
            Page.Title = "No Search Results found";
            return;
        }
        else
        {
            if (new CourseManager().searchResult(Request.QueryString["search"]).ToString() == "")
            {
                cover.InnerText = "No Search Results found for '" + Request.QueryString["Search"] + "'";
            }

            else
            {
                cover.InnerText = " Search Results for '" + Request.QueryString["Search"] + "'";
                coursebox.InnerHtml = new CourseManager().searchResult(Request.QueryString["search"]).ToString();
            }
        }
    }
}
