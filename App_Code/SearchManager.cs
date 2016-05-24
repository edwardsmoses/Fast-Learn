using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for SearchManager
/// </summary>
public class SearchManager
{
    public SearchManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public List<Student> studentInfo(string name)
    {
        List<Student> stud = new List<Student>();
        SqlDataReader dr = new SqlManager().reader("Select FirstName, LastName, Picture, Date, Address, StudentID, username from Student where FirstName like '" + "%" + name + "%' or LastName like '" + "%" + name + "%' ORDER BY DATE DESC");
        while (dr.Read())
        {
            var student = new Student();
            student.FirstName = (string)dr[0] + " " + (string)dr[1];
            student.LastName = (string)dr[6];
            student.Image = (byte[])dr[2];
            student.Date = (DateTime)dr[3];
            student.Address = (string)dr[4];
            student.ID = (int)dr[5];
            stud.Add(student);
        }
        return stud;
    }

    public StringBuilder search(string name)
    {
        StringBuilder sthml = new StringBuilder();
        List<Student> student = studentInfo(name);
        foreach (var s in student)
        {
               sthml.AppendFormat("<div class='col-lg-3'><div class='box box-primary'><div class='box-body box-profile'><img class='profile-user-img img-responsive img-circe' src='{0}' style='height:100px;'/>", new ProjectManager().ReadImage(s.Image));
               sthml.AppendFormat("<h3 class='profile-username text-center'>{0}</h3><p class='text-muted text-center'>lives at {1}</p>", s.FirstName, s.Address);
                sthml.AppendFormat("<ul class='list-group list-group-unbordered'><li class='list-group-item'><b>Username</b><a class='pull-right'>{1}</a></li><li class='list-group-item'><b>Courses</b><a class='pull-right'>{0}</a></li>", new CourseManager().coursesID(s.LastName).Count, s.LastName);
            sthml.AppendFormat("<li class='list-group-item'><b>Faculty</b><a class='pull-right'>{0}</a></li></ul></div></div></div>", FacultyCount(s.LastName)); ;
        }
        return sthml;
    }

    public string FacultyCount(string username)
    {
        int fC = 0;
        List<int> id = new CourseManager().coursesID(username);
        HashSet<int> fID = new HashSet<int>();
        foreach (var c in id)
        {
            SqlDataReader dr = new SqlManager().reader("Select FacultyID from FacultyCourse where CourseID like '" + c + "'");
            while (dr.Read())
            {
                fID.Add((int)dr[0]);
            }
        }
        fC = fID.Count;
        return fC.ToString();
    }

}