using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_Courses : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string category = Request.QueryString["c"];
        if(category != string.Empty)
        {
            coursebox.InnerHtml = new CourseManager().coursedisplay(category).ToString();
            username.InnerText = HttpContext.Current.User.Identity.Name;
            smalltitle.InnerText = category;
            bigtitle.InnerText = category;
        }
    }
}