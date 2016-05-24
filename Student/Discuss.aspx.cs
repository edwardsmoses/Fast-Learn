using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_Discuss : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string muser = Request.QueryString["u"];
        var faculty = new StudentManager();
        string username = HttpContext.Current.User.Identity.Name;
        string src = "";
        src = faculty.studentPicture(username);
        myimage.Src = src;
        nameList.InnerHtml = faculty.nameList(username).ToString();
        if (muser == null || muser == String.Empty || new FacultyManager().profilepic(muser) == null || new FacultyManager().profilepic(muser) == "")
        {
            usernames.Visible = false;
            usernamepic.Visible = false;
            lastseen.Visible = false;
            msgList.InnerHtml = "";
        }
        else
        {
            usernames.Visible = true;
            usernamepic.Visible = true;
            lastseen.Visible = true;
            usernames.InnerText = muser;
            usernamepic.Src = new FacultyManager().profilepic(muser);
            MembershipUser m = Membership.GetUser(muser);
            if (m.IsOnline)
            {
                lastseen.InnerText = "online";
            }
            else
            {
                DateTime ds = m.LastLoginDate;
                lastseen.InnerText = "last seen at " + faculty.checkDate(ds);
            }
            msgList.InnerHtml = faculty.ChatBody(username, muser).ToString();
        }
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        if (txtMessage.Text == string.Empty || Request.QueryString["u"] == null)
        {
            Response.Redirect("Discuss.aspx");
            return;
        }
        System.Data.SqlClient.SqlCommand cmd = new SqlManager().command();
        cmd.CommandText = "INSERT INTO QUERY values(@message, @suser, @fuser, @type, @date)";
        cmd.Parameters.AddWithValue("@suser", Request.QueryString["u"]);
        cmd.Parameters.AddWithValue("@fuser", HttpContext.Current.User.Identity.Name);
        cmd.Parameters.AddWithValue("@message", txtMessage.Text);
        cmd.Parameters.AddWithValue("@date", DateTime.Now);
        cmd.Parameters.AddWithValue("@type", "reply");
        int id = cmd.ExecuteNonQuery();
        if (id > 0)
        {
            string muser = Request.QueryString["u"];
            Response.Redirect("Discuss.aspx?u=" + muser);
        }
    }
}
