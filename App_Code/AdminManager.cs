using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for AdminManager
/// </summary>
public class AdminManager
{
    public AdminManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public StringBuilder latestCourse()
    {
        StringBuilder shtml = new StringBuilder();
        List<Student> courses = new List<Student>();
        System.Data.SqlClient.SqlDataReader dr = new SqlManager().reader("Select TOP 8 username,Picture, Date from Student ORDER BY Date DESC");
        while (dr.Read())
        {
            courses.Add(new Student
            {
                FirstName = (string)dr[0],
                Image = (byte[])dr[1],
                Date = (DateTime)dr[2]
            });
        }
        foreach (var lm in courses)
        {

            shtml.AppendFormat("<li><img src='{0}'/>", new ProjectManager().ReadImage(lm.Image));
            shtml.AppendFormat("<a class='users-list-name'>{0}</a>", lm.FirstName);
            shtml.AppendFormat("<span class='users-list-date'>{0}</span>", new FacultyManager().checkDate(lm.Date));
        }
        return shtml;
    }
}