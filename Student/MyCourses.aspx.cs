using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_MyCourses : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        coursebox.InnerHtml = new CourseManager().mycourses(HttpContext.Current.User.Identity.Name).ToString();
        countcourses.InnerText = new CourseManager().coursesID(HttpContext.Current.User.Identity.Name).Count.ToString();
    }
}