using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Faculty_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var f = new FacultyManager();
        fullname.InnerText = f.Names(HttpContext.Current.User.Identity.Name);
        location.InnerText = f.Location(HttpContext.Current.User.Identity.Name);
        messageCount.InnerText = f.MessageCount(HttpContext.Current.User.Identity.Name);
        queryCount.InnerText = f.QueryCount(HttpContext.Current.User.Identity.Name);
        coursecount.InnerText = f.CourseCount(HttpContext.Current.User.Identity.Name);
        studentcount.InnerText = f.StudentCount(HttpContext.Current.User.Identity.Name);
        string bytes = f.profilepic(HttpContext.Current.User.Identity.Name);
        navbarimg.ImageUrl = bytes;
        sidebarimg.ImageUrl = bytes;
        navbarimg2.ImageUrl = bytes;
        this.readmessage();
        this.ReadMessages();
        fcoursebody.InnerHtml = f.fCourse(HttpContext.Current.User.Identity.Name).ToString();
    }


    public void readmessage()
    {
        if (Session["m"] != null)
        {
            sPanel.Visible = true;
            sPanel.CssClass = "alert alert-success alertdiv";
            lblSuccess.Text = (string)Session["m"];
            Session["m"] = null;
        }
        else
        {
            sPanel.Visible = false;
        }
    }

    public void ReadMessages()
    {
        List<FMessage> message = new List<FMessage>();
        StringBuilder sb = new StringBuilder();
        System.Data.SqlClient.SqlDataReader dr = new SqlManager().reader("Select message, date from Message where username like '" + HttpContext.Current.User.Identity.Name + "' and [read] like 'false' ORDER BY DATE DESC");
        while (dr.Read())
        {
            message.Add(new FMessage { message = (string)dr[0], date = (DateTime)dr[1], Name = "admin" });
        }
        badgeno.InnerText = message.Count.ToString();
        messageno.InnerText = message.Count.ToString();
        foreach (var n in message)
        {
            sb.Append("<li>");
            sb.Append("<a href='#' style='margin-left:-35px;'>");
            if (n.date.ToShortDateString() == DateTime.Now.ToShortDateString())
            {
                sb.AppendFormat("<h4> {0} <small><b> {1}</b>, {2} </small></h4>", n.Name, "Today", n.date.ToShortTimeString());
            }
            else
            {
                sb.AppendFormat("<h4> {0} <small><b> {1}</b>, {2} </small></h4>", n.Name, n.date.ToShortDateString(), n.date.ToShortTimeString());
            }

            sb.AppendFormat("<p class='longmessage'>{0}</p></a></li>", n.message);
        }
        messageBody.InnerHtml = sb.ToString();
    }

    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect("../Login.aspx");
    }
}
