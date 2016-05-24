using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for FacultyManager
/// </summary>
public class FacultyManager
{
    public FacultyManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public List<Faculty> facInfo(string username)
    {
        List<Faculty> f = new List<Faculty>();
        SqlDataReader dr = new SqlManager().reader("Select FirstName, LastName, Picture, Address, FacultyID from Faculty where username like '" + username + "'");
        while (dr.Read())
        {
            var student = new Faculty();
            student.FirstName = (string)dr[0];
            student.LastName = (string)dr[1];
            student.Image = (byte[])dr[2];
            student.Address = (string)dr[3];
            student.ID = (int)dr[4];
            f.Add(student);
        }
        return f;
    }

    public string Names(string username)
    {
        string fName = "";
        List<Faculty> f = new List<Faculty>();
        f = this.facInfo(username);
        foreach(var c in f)
        {
            fName = c.FirstName + " " + c.LastName;
        }
        return fName;
    }

    public string Location(string username)
    {
        string location = "";
        List<Faculty> f = new List<Faculty>();
        f = this.facInfo(username);
        foreach (var c in f)
        {
            location = c.Address;
        }
        return location;
    }

    public string MessageCount(string username)
    {
        int count = 0;
        string str = "Select MessageID from Message where username = '" + username + "'";
        SqlDataReader dr = new SqlManager().reader(str);
        while (dr.Read())
        {
            count++;
        }
        return count.ToString();
    }
    public string CourseCount(string username)
    {
        int count = 0;
        string str = "Select CourseID from FacultyCourse where FacultyID = (Select FacultyID from Faculty where username  = '"+ username+"')";
        SqlDataReader dr = new SqlManager().reader(str);
        while(dr.Read())
        {
            count++;
        }
        return count.ToString();
    }

    public string QueryCount(string username)
    {
        int count = 0;
        string str = "Select QueryID from Query where [to] = '" + username + "'";
        SqlDataReader dr = new SqlManager().reader(str);
        while (dr.Read())
        {
            count++;
        }
        return count.ToString();
    }
    public string StudentCount(string username)
    {
        int count = 0;
        HashSet<int> Courses = new HashSet<int>();
        HashSet<int> stu = new HashSet<int>();
        SqlDataReader cdr = new SqlManager().reader("Select CourseID from FacultyCourse where FacultyID = (select FacultyID from Faculty where username = '" + username + "')");
        while (cdr.Read())
        {
            Courses.Add((int)cdr[0]);
        }
        foreach (var c in Courses)
        {
            string str = "Select StudentID from StudentCourse where CourseID = '" + c.ToString() + "'";
            SqlDataReader dr = new SqlManager().reader(str);
            while (dr.Read())
            {
                stu.Add((int)dr[0]);
            }
        }
        foreach(var f in stu)
        {
            count++;
        }
        return count.ToString();
    }

    public string profilepic(string username)
    {
        var c = new ProjectManager();
        string src = "";
        List<Faculty> f = new List<Faculty>();
        byte[] imgSource = null;
        f = this.facInfo(username);
        foreach (var g in f)
        {
            imgSource = (byte[])g.Image;
        }
        src = c.ReadImage(imgSource);
        return src;
    }

    public StringBuilder fCourse(string username)
    {
        StringBuilder sml = new StringBuilder();
        List<int> Courses = new List<int>();
        List<Course> course = new List<Course>();
        SqlDataReader cdr = new SqlManager().reader("Select CourseID from FacultyCourse where FacultyID = (select FacultyID from Faculty where username = '" + username + "')");
        while (cdr.Read())
        {
            Courses.Add((int)cdr[0]);
        }
        foreach (var g in Courses)
        {
            string str = "Select Name, Fee, Picture from Courses where CourseID = '" + g + "'";
            SqlDataReader dr = new SqlManager().reader(str);
            while (dr.Read())
            {
                var c = new Course();
                c.Name = (string)dr[0];
                c.Fee = (int)dr[1];
                c.Picture = (byte[])dr[2];
                course.Add(c);
            }
        }
        foreach(var c in course)
        {
            var p = new ProjectManager();
            sml.Append("<div class='fcourse'>");
            sml.AppendFormat("<img src='{0}'></img>" , p.ReadImage(c.Picture) );
            sml.AppendFormat("<div class='dropdown'><a data-toggle = 'dropdown' aria-haspopup= 'true' aria-expanded = 'false' class='dropw'><i class='fa fa-ellipsis-v fa-2x'></i></a><ul class='dropdown-menu dropdown-menu-right dropmenu' aria-labelledby='dLabel'><li><a href='Materials.aspx?course={0}'>Add Materials</a></li></ul></div>", c.Name);
            sml.AppendFormat("<h3>{0}</h3>", c.Name);
            string name = username;
            sml.AppendFormat("<p class='price'>{0}</p>", name);
            int Cid = 0;
            SqlDataReader gdr = new SqlManager().reader("Select CourseID from Courses where Name = '"+c.Name + "'");
            while (gdr.Read())
            {
                Cid = (int)gdr[0];
            }
            string student = "Select StudentID from StudentCourse where CourseID = '" + Cid + "'";
            SqlDataReader fdr = new SqlManager().reader(student);
            int l = 0;
            while(fdr.Read())
            {
                l++;
            }
            sml.AppendFormat("<p class='students student'>Total Students taking this Course</p><p class='students studentsno'> {0}</p></div>", l.ToString());
            while (gdr.Read())
            { }

        }
        return sml;
    }

    public StringBuilder nameList(string username)
    {
        StringBuilder shtml = new StringBuilder();
        int fid = 0;
        HashSet<int> ids = new HashSet<int>();
        var f = new SqlManager();
        var u = new Student();
        HashSet<Student> student = new HashSet<Student>();
        System.Data.SqlClient.SqlDataReader dr = f.reader("Select FacultyID from Faculty where username like '" + username + "'");
        while (dr.Read())
        {
            fid = (int)dr[0];
        }
        HashSet<int> message = new HashSet<int>();
        System.Data.SqlClient.SqlDataReader sdr = f.reader("Select CourseID from FacultyCourse where FacultyID like '" + fid + "'");
        while (sdr.Read())
        {
            message.Add((int)sdr[0]);
        }
        foreach (var c in message)
        {
            System.Data.SqlClient.SqlDataReader fdr = f.reader("Select StudentID from StudentCourse where CourseID like '" + c + "'ORDER BY DATE DESC");
            while (fdr.Read())
            {
                ids.Add((int)fdr[0]);
            }
        }
        foreach (var i in ids)
        {
            System.Data.SqlClient.SqlDataReader fdr = f.reader("Select username, Picture from Student where StudentID like '" + i + "'");
            while (fdr.Read())
            {
                u.FirstName = (string)fdr[0];
                u.Image = (byte[])fdr[1];
                student.Add(u);
            }
            foreach (var s in student)
            {
                byte[] bytes = s.Image;
                string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                shtml.AppendFormat("<a href='Discuss.aspx?u={0}'><div class='names' title='{0}'>", s.FirstName);
                shtml.AppendFormat("<img src=\" data:image/png;base64, " + base64String + "\" />");
                shtml.AppendFormat("<p>{0}</p></div></a>", s.FirstName);
            }
        }


        return shtml;
    }

    public string checkDate(DateTime d)
    {
        string dates = "";
        if (d.ToShortDateString() == DateTime.Today.ToShortDateString())
        {
            dates = "Today " + d.ToShortTimeString();
        }
        else
        {
            string fine = d.ToShortDateString().Replace("/", "-");
            dates = fine + " " + d.ToShortTimeString();
        }
        return dates;
    }

    public StringBuilder ChatBody(string username, string p)
    {
        StringBuilder shtml = new StringBuilder();
        List<Query> query = new List<Query>();
        SqlDataReader dr = new SqlManager().reader("Select message, date, [from], [to] from Query");
        while (dr.Read())
        {
            var q = new Query();
            q.message = (string)dr[0];
            q.date = (DateTime)dr[1];
            q.from = (string)dr[2];
            q.to = (string)dr[3];
            query.Add(q);
        }
        foreach (var q in query)
        {

            if (q.from == username & q.to == p)
            {
                shtml.Append("<div class=''><div class='msg'>");
                shtml.Append("<div class='messages messages-out pull-right'>");
                shtml.AppendFormat("<p>{0}</p>", q.message);
                shtml.AppendFormat("<p class='time'><i class='fa fa-clock-o'></i> {0}</p></div></div></div>", checkDate(q.date));
            }
            if (q.to == username & q.from == p)
            {
                shtml.Append("<div class=''><div class='msg'>");
                shtml.Append("<div class='messages messages-in pull-left'>");
                shtml.AppendFormat("<p>{0}</p>", q.message);
                shtml.AppendFormat("<p class='time'><i class='fa fa-clock-o'></i> {0}</p></div></div></div>", checkDate(q.date));
            }

        }
        return shtml;
    }
}
