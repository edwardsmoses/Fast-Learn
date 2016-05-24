using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Text;

public partial class Student_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string user = HttpContext.Current.User.Identity.Name;
        var student = new StudentManager();
        if (!IsPostBack)
        {
            string bytes = student.studentPicture(user);
            navbarimg.ImageUrl = bytes;
            sidebarimg.ImageUrl = bytes;
            navbarimg2.ImageUrl = bytes;
            ReadAlertMessage();
            ReadMessages();
        }
        Page.Title = user + " | Fast Learn";
        userName.InnerText = user;
        foreach (var stu in student.studentInfo(user))
        {
            fullname.InnerText = stu.FirstName + " " + stu.LastName;
            suserName.InnerText = stu.FirstName + " " + stu.LastName;
            location.InnerText = "lives at " + stu.Address;
        }
    }


    public void ReadAlertMessage()
    {
        string message = (string)Session["m"];
        var p = new ProjectManager();
        if (Session["m"] != null)
        {
            p.ReadSucessMessage(sPanel, message, lblSuccess);
            Session["m"] = null;
        }
        else
        {
            sPanel.Visible = false;
        }
    }


    protected void btnFeedback_Click(object sender, EventArgs e)
    {
        try
        {
            int rows = new SqlManager().cmd("Insert into Feedback(Name, email, Date, Message) values('" + HttpContext.Current.User.Identity.Name + "','" + Membership.GetUser().Email + "','" + DateTime.Now + "','" + contactMessage.Text + "')");
            if (rows > 0)
            {
                Session["m"] = "Your feedback has been forwarded sucessfully. " + HttpContext.Current.User.Identity.Name + ", a reply will be sent to your email soon.";
                Response.Redirect("Default.aspx");
            }
            else
            {
                return;
            }
        }
        catch (Exception ex)
        {
            return;
        }
    }

    protected void btnSignOut_Click1(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect("../Login.aspx");
    }

    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect("../Login.aspx");
    }

    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        Response.Redirect("../Login.aspx");
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
}