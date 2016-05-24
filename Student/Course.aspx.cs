using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_Course : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.validcourse();
        List<Course> course = new List<Course>();
        course = new CourseManager().courseinfo((string)Request.QueryString["course"]);
        foreach (var c in course)
        {
            shortdescription.InnerText = c.Information;
            startingdate.InnerText = c.StartDate.ToLongDateString();
            coursefee.InnerText = "₦" + string.Format("{0:n0}", c.Fee);
        }
        IContainer.InnerHtml = new CourseManager().facultyDisplay(Request.QueryString["course"]).ToString();
        this.checkenroll();
    }

    protected void btnenroll_Click(object sender, EventArgs e)
    {
        Response.Redirect("Payment.aspx?course=" + Request.QueryString["course"]);
    }

    public void checkenroll()
    {
        int CID = 0;
        int SID = 0;
        List<Course> courses = new List<Course>();
        List<Student> students = new List<Student>();
        courses = new CourseManager().courseinfo((string)Request.QueryString["course"]);
        students = new StudentManager().studentInfo(HttpContext.Current.User.Identity.Name);
        foreach (var s in students)
        {
            SID = s.ID;
        }
        foreach (var c in courses)
        {
            CID = c.ID;
        }
        System.Data.SqlClient.SqlDataReader sdr = new SqlManager().reader("Select CourseID from StudentCourse where StudentID like '" + SID + "' ORDER BY Date DESC");
        while (sdr.Read())
        {
            if (CID == (int)sdr[0])
            {
                btnenroll.CssClass = "btn btn-primary pull-right enroll";
                btnenroll.Text = "Enrolled";
                btnenroll.Enabled = false;
                return;
            }
        }
    }

    public void validcourse()
    {
        string desc = "";
        List<Course> course = new List<Course>();
        course = new CourseManager().courseinfo((string)Request.QueryString["course"]);
        foreach (var c in course)
        {
            desc = c.Information;
        }
        if (desc == String.Empty)
        {
            Response.Redirect("Browse.aspx");
        }
    }
}
