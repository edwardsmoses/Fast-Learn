using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Text;

/// <summary>
/// Summary description for StudentManager
/// </summary>
public class StudentManager
{
    public StudentManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    
    public List<Student> studentInfo(string username)
    {
        List<Student> stud = new List<Student>();
        SqlDataReader dr = new SqlManager().reader("Select FirstName, LastName, Picture, Date, Address, StudentID from Student where username like '"  + username + "'");
        while (dr.Read())
        {
            var student = new Student();
            student.FirstName = (string)dr[0];
            student.LastName = (string)dr[1];
            student.Image = (byte[])dr[2];
            student.Date = (DateTime)dr[3];
            student.Address = (string)dr[4];
            student.ID = (int)dr[5];
            stud.Add(student);
        }
        return stud;
    }

    public string studentPicture(string username)
    {
        string src = "";
        foreach(var p in studentInfo(username))
        {
            src = new ProjectManager().ReadImage(p.Image);
        }
        return src;
    }


    public StringBuilder nameList(string username)
    {
        StringBuilder shtml = new StringBuilder();
        int fid = 0;
        HashSet<int> ids = new HashSet<int>();
        var f = new SqlManager();
        var u = new Student();
        HashSet<Student> student = new HashSet<Student>();
        System.Data.SqlClient.SqlDataReader dr = f.reader("Select StudentID from Student where username like '" + username + "'");
        while (dr.Read())
        {
            fid = (int)dr[0];
        }
        HashSet<int> message = new HashSet<int>();
        System.Data.SqlClient.SqlDataReader sdr = f.reader("Select CourseID from StudentCourse where StudentID like '" + fid + "'");
        while (sdr.Read())
        {
            message.Add((int)sdr[0]);
        }
        foreach (var c in message)
        {
            System.Data.SqlClient.SqlDataReader fdr = f.reader("Select FacultyID from FacultyCourse where CourseID like '" + c + "'ORDER BY DATE DESC");
            while (fdr.Read())
            {
                ids.Add((int)fdr[0]);
            }
        }
        foreach (var i in ids)
        {
            System.Data.SqlClient.SqlDataReader fdr = f.reader("Select username, Picture from Faculty where FacultyID like '" + i + "'");
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