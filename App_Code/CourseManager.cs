using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for CourseManager
/// </summary>
public class CourseManager
{
    public CourseManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public List<Course> coursesinfo(string category)
    {
        List<Course> courses = new List<Course>();
        System.Data.SqlClient.SqlDataReader dr = new SqlManager().reader("Select Name, Duration, Fee, ShortDescription, StartDate, Picture, Category from Courses where Category like '" + "%" + category + "%' ORDER BY StartDate DESC");
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
        return courses;
    }

    public List<Course> courseinfo(string course)
    {
        List<Course> courses = new List<Course>();
        System.Data.SqlClient.SqlDataReader dr = new SqlManager().reader("Select Name, Duration, Fee, ShortDescription, StartDate, Picture, Category, CourseID from Courses where Name like '" + "%" + course + "%'");
        while (dr.Read())
        {
            courses.Add(new Course
            {
                ID = (int)dr[7],
                Name = (string)dr[0],
                Category = (string)dr[6],
                Duration = (string)dr[1],
                Fee = (int)dr[2],
                Information = (string)dr[3],
                StartDate = (DateTime)dr[4],
                Picture = (byte[])dr[5]
            });
        }
        return courses;
    }

    public StringBuilder searchResults(string name)
    {
        StringBuilder strHTML = new StringBuilder();
        List<Course> courses = new List<Course>();
        int i = 0;
        System.Data.SqlClient.SqlDataReader dr = new SqlManager().reader("Select Name, Duration, Fee, ShortDescription, StartDate, Picture, Category from Courses where Name like '" + "%" + name + "%' ORDER BY StartDate DESC");
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
        foreach (var c in courses)
        {
            i++;
            strHTML.AppendFormat("<div class='courses' onclick='onclicked{0}()'>", i);
            strHTML.Append("<script type='text/javascript'>function onclicked" + i + "(){window.location='Student/Courses.aspx?course=" + c.Name + "';}</script>");
            strHTML.Append("<div class='row'>");
            strHTML.Append("<div class='col-lg-2'>");
            byte[] bytes = c.Picture;
            string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            strHTML.AppendFormat("<img src=\" data:image/png;base64, " + base64String + "\" /></div>");
            strHTML.Append("<div class='col-lg-10'><div class='coursesinfo'>");
            strHTML.AppendFormat("<h2>{0}</h2>", c.Name);
            strHTML.AppendFormat("<p class='time'>{0} Course</p>", c.Duration);
            strHTML.AppendFormat("<p class='price'>₦{0}</p>", string.Format("{0:n0}", c.Fee));
            strHTML.AppendFormat("<p>{0}</p>", c.Information);
            strHTML.Append("</div></div></div></div>");
        }
        return strHTML;
    }

    public List<Course> listofcourses(List<int> ids)
    {
        List<Course> courses = new List<Course>();
        foreach (var i in ids)
        {
            System.Data.SqlClient.SqlDataReader dr = new SqlManager().reader("Select Name, Duration, Fee, ShortDescription, StartDate, Picture, Category, CourseID from Courses where CourseID like '" + i + "'");
            while (dr.Read())
            {
                courses.Add(new Course
                {
                    ID = (int)dr[7],
                    Name = (string)dr[0],
                    Category = (string)dr[6],
                    Duration = (string)dr[1],
                    Fee = (int)dr[2],
                    Information = (string)dr[3],
                    StartDate = (DateTime)dr[4],
                    Picture = (byte[])dr[5]
                });
            }
        }
        return courses;
    }
    public List<int> coursesID(string username)
    {
        List<int> cID = new List<int>();
        System.Data.SqlClient.SqlDataReader dr = new SqlManager().reader("Select StudentID from Student where  username like '" + username + "'");
        int sID = 0;
        while (dr.Read())
        {
            sID = (int)dr[0];
        }
        System.Data.SqlClient.SqlDataReader sdr = new SqlManager().reader("Select CourseID from StudentCourse where StudentID like '" + sID + "' ORDER BY Date DESC");
        while (sdr.Read())
        {
            cID.Add((int)sdr[0]);
        }
        return cID;
    }
    public StringBuilder mycourses(string username)
    {
        StringBuilder strHTML = new StringBuilder();
        List<int> cID = coursesID(username);
        List<Course> course = this.listofcourses(cID);
        int i = 0;
        foreach (var c in course)
        {
            i++;
            strHTML.AppendFormat("<div class='courses' onclick='onclicked{0}()'>", i);
            strHTML.Append("<script type='text/javascript'>function onclicked" + i + "(){window.location='Materials.aspx?course=" + c.Name + "';}</script>");
            strHTML.Append("<div class='row'>");
            strHTML.Append("<div class='col-lg-2'>");
            byte[] bytes = c.Picture;
            string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            strHTML.AppendFormat("<img src=\" data:image/png;base64, " + base64String + "\" /></div>");
            strHTML.Append("<div class='col-lg-10'><div class='coursesinfo'>");
            strHTML.AppendFormat("<h2>{0}</h2>", c.Name);
            strHTML.AppendFormat("<p class='time'>{0} Course</p>", c.Duration);
            strHTML.AppendFormat("<p>{0}</p>", c.Information);
            strHTML.Append("</div></div></div></div>");
        }
        return strHTML;
    }

    public StringBuilder mymaterials(string name)
    {
        StringBuilder strHTML = new StringBuilder();
        int cid = 0;
        List<Material> mat = new List<Material>();
        SqlDataReader sdr = new SqlManager().reader("Select CourseID from Courses where Name ='" + name + "'");
        while(sdr.Read())
        {
            cid = (int)sdr[0];
        }
        SqlDataReader gdr = new SqlManager().reader("Select Title, Description, Date, Attachment from Materials where CourseID = '" + cid + "'");
        while (gdr.Read())
        {
            mat.Add(new Material { Title = (string)gdr[0], Date = (DateTime)gdr[2], Description = (string)gdr[1], Attachment=(string)gdr[3]});
        }

        int i = 0;
        if (mat.Count == 0)
        {
            strHTML.AppendFormat("<h2 style='margin-top:50px;'><i class='fa fa-question-circle fa-3x'></i>  Your Faculty have not uploaded any Course Materials.   You can remind him <a href='Discuss.aspx'>here</a>.</h2>");
            return strHTML;
        }
        foreach (var c in mat)
        {
            i++;
            strHTML.AppendFormat("<div class='courses' onclick='onclicked{0}()'>", i);
            strHTML.Append("<div class='row'>");
            strHTML.Append("<div class='col-lg-10'><div class='coursesinfo'>");
            strHTML.AppendFormat("<h2>{0}</h2>", c.Title);
            strHTML.AppendFormat("<p class='time'>{0}</p>", new FacultyManager().checkDate(c.Date));
            strHTML.AppendFormat("<p>{0}</p>", c.Description);
            strHTML.AppendFormat("<div class='pull-right' style='left: 47em;position: absolute;top: 10px;'><a href='{0}' class='fa fa-download fa-2x' download></a></div>", "../Materials/" + c.Attachment);
            strHTML.Append("</div></div></div></div>");
        }
        return strHTML;
    }
    public string getExt(string fileName)
    {
        FileInfo f = new FileInfo(fileName);
        string ext = f.Extension;
        switch (ext.ToLower())
        {
            case ".doc":
            case ".docx":
                return "download";
            case ".mp4":
            case ".avi":
            case ".mkv":
                return "view";
            default:
                return "unknown";
        }

    }

   public StringBuilder searchResult(string name)
    {
        StringBuilder strHTML = new StringBuilder();
        List<Course> courses = new List<Course>();
        int i = 0;
        System.Data.SqlClient.SqlDataReader dr = new SqlManager().reader("Select Name, Duration, Fee, ShortDescription, StartDate, Picture, Category from Courses where Name like '" + "%" + name + "%' ORDER BY StartDate DESC");
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
        foreach (var c in courses)
        {
            i++;
            strHTML.AppendFormat("<div class='courses' onclick='onclicked{0}()'>", i);
            strHTML.Append("<script type='text/javascript'>function onclicked" + i + "(){window.location='Course.aspx?course=" + c.Name + "';}</script>");
            strHTML.Append("<div class='row'>");
            strHTML.Append("<div class='col-lg-2'>");
            byte[] bytes = c.Picture;
            string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            strHTML.AppendFormat("<img src=\" data:image/png;base64, " + base64String + "\" /></div>");
            strHTML.Append("<div class='col-lg-10'><div class='coursesinfo'>");
            strHTML.AppendFormat("<h2>{0}</h2>", c.Name);
            strHTML.AppendFormat("<p class='time'>{0} Course</p>", c.Duration);
            strHTML.AppendFormat("<p class='price'>₦{0}</p>", string.Format("{0:n0}", c.Fee));
            strHTML.AppendFormat("<p>{0}</p>", c.Information);
            strHTML.Append("</div></div></div></div>");
        }
        return strHTML;
    }
    public StringBuilder coursedisplay(string category)
    {
        StringBuilder strHTML = new StringBuilder();
        List<Course> course = this.coursesinfo(category);
        int i = 0;
        foreach (var c in course)
        {
            i++;
            strHTML.AppendFormat("<div class='courses' onclick='onclicked{0}()'>", i);
            strHTML.Append("<script type='text/javascript'>function onclicked" + i + "(){window.location='Course.aspx?course=" + c.Name + "';}</script>");
            strHTML.Append("<div class='row'>");
            strHTML.Append("<div class='col-lg-2'>");
            byte[] bytes = c.Picture;
            string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            strHTML.AppendFormat("<img src=\" data:image/png;base64, " + base64String + "\" /></div>");
            strHTML.Append("<div class='col-lg-10'><div class='coursesinfo'>");
            strHTML.AppendFormat("<h2>{0}</h2>", c.Name);
            strHTML.AppendFormat("<p class='time'>{0} Course</p>", c.Duration);
            strHTML.AppendFormat("<p class='price'>₦{0}</p>", string.Format("{0:n0}", c.Fee));
            strHTML.AppendFormat("<p>{0}</p>", c.Information);
            strHTML.Append("</div></div></div></div>");
        }
        return strHTML;
    }

    public StringBuilder facultyDisplay(string course)
    {
        StringBuilder shtml = new StringBuilder();
        List<Faculty> fac = new List<Faculty>();
        List<int> fId = new List<int>();
        SqlDataReader sdr = new SqlManager().reader("Select FacultyID from FacultyCourse where CourseID  = (Select CourseID from Courses where Name like '" + "" + course + "')");
        while (sdr.Read())
        {
            fId.Add((int)sdr[0]);
        }
        foreach (var x in fId)
        {
            SqlDataReader dr = new SqlManager().reader("Select FirstName, LastName, Picture from Faculty where FacultyID = '" + x + "'");
            while (dr.Read())
            {
                var f = new Faculty();
                f.FirstName = (string)dr[0] + " " + (string)dr[1];
                f.Image = (byte[])dr[2];
                fac.Add(f);
            }
        }
        foreach(var l in fac)
        {
            string m = new ProjectManager().ReadImage(l.Image);
             shtml.AppendFormat("<div class='row' style='margin-bottom: 20px;'><img src='{0}' class='image'/>",m );
             shtml.AppendFormat("<p class='about aboutname'>{0}</p></div>", l.FirstName);
        }
            return shtml;
    }
}
