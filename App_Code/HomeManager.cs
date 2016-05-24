using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for HomeManager
/// </summary>
public class HomeManager
{
    public HomeManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public StringBuilder latestCourse() {
        StringBuilder shtml = new StringBuilder();
        List<Course> courses = new List<Course>();
        System.Data.SqlClient.SqlDataReader dr = new SqlManager().reader("Select TOP 6 Name, Duration, Fee, ShortDescription, StartDate, Picture, Category from Courses ORDER BY CreatedDate DESC");
        while (dr.Read())
        {
            courses.Add(new Course
            {
                Name = (string)dr[0],
                Category = (string)dr[6],
                Duration = (string)dr[1],
                Fee = (int)dr[2],
                Information = (string)dr[3],
                StartDate = (DateTime)dr[4],
                Picture = (byte[])dr[5]
            });
        }
        foreach (var lm in courses)
        {
        shtml.AppendFormat("<div class='col-md-4'><div class='service'><div class='icon-holder'><img src='{0}' alt='' class='icon'></div>", new ProjectManager().ReadImage(lm.Picture));
        shtml.AppendFormat("<h4 class='heading'>{0}</h4><p class='description'>{1}</p>", lm.Name, lm.Information);
            shtml.AppendFormat("<a href='SignUp.aspx' class='btn btn-white-fill expand hvr hvr-pulse hvr-grow' title='Sign Up to enjoy this courses'>Register</a></div></div>");
        }
        return shtml;
    }

}