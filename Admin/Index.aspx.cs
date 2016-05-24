using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            ReadNumbers();
            ReadChats();
            ReadFacultyName();
            ReadStudentName();
            ReadAlertMessage();
            newUsers.InnerHtml = new AdminManager().latestCourse().ToString();
        }
    }
    public void ReadNumbers()
    {
        System.Data.SqlClient.SqlDataReader dr = new SqlManager().reader("Select * from Student");
        int studentcount = 0;
        while (dr.Read())
        {
            studentcount++;
        }
        studentnumber.InnerText = studentcount.ToString();

        System.Data.SqlClient.SqlDataReader sdr = new SqlManager().reader("Select * from Feedback");
        int feedcount = 0;
        while (sdr.Read())
        {
            feedcount++;
        }
        feedbacknumber.InnerText = feedcount.ToString();

        System.Data.SqlClient.SqlDataReader fdr = new SqlManager().reader("Select * from Faculty");
        int facultycount = 0;
        while (fdr.Read())
        {
            facultycount++;
        }
        facultynumber.InnerText = facultycount.ToString();

        visitornumber.InnerText = new CountVisitors().ReadCounter();
    }
    protected void btnSendFaculty_Click(object sender, EventArgs e)
    {
        if (txtFacultyMessage.Text == String.Empty)
        {
            Session["m"] = "Message not sent succesfully, No message was typed";
            Response.Redirect("Index.aspx");
            return;
        }
        else
        {
            string username = drpFacultyName.SelectedValue;
            string sql = "INSERT INTO Message values(@message,@type, @date, @username, @read)";
            System.Data.SqlClient.SqlCommand cmd = new SqlManager().command();
            cmd.CommandText = sql;
            cmd.Parameters.AddWithValue("@message", txtFacultyMessage.Text);
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@read", "false");
            cmd.Parameters.AddWithValue("@type", "faculty");
            cmd.Parameters.AddWithValue("@date", DateTime.Now);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                Session["m"] = "Hooray!, you have sent a message to " + username;
                Response.Redirect("Index.aspx");
            }
        }
    }

    public void ReadChats()
    {
        StringBuilder sb = new StringBuilder();
        List<Message> message = new List<Message>();
        System.Data.SqlClient.SqlDataReader dr = new SqlManager().reader("Select message, username, date from Message where type = 'faculty' ORDER BY date DESC");
        while (dr.Read())
        {
            string username = (string)dr[1];
            System.Data.SqlClient.SqlDataReader sdr = new SqlManager().reader("Select Picture from Faculty where username like '" + username + "'");
            while (sdr.Read())
            {
                message.Add(new Message { MessageText = (string)dr[0], Name = (string)dr[1], Picture = (byte[])sdr[0], MessageDate = (DateTime)dr[2] });
            }
        }
        foreach (var m in message)
        {
            byte[] bytes = (byte[])m.Picture;
            string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            sb.Append("<div class='item'>");
            sb.AppendFormat("<img class='online' src=\" data:image/png;base64, " + base64String + "\" />");
            sb.AppendFormat("<p class='message'><a href='#' class='name'><small class='text-muted pull-right'><i class='fa fa-clock-o'></i> {0}</small>{1}</a>{2}</p></div>", m.MessageDate.ToShortTimeString(), m.Name, m.MessageText);
        }
        chatbox.InnerHtml = sb.ToString();
    }

    public void ReadFacultyName()
    {
        System.Data.SqlClient.SqlDataReader dr = new SqlManager().reader("Select username from Faculty");
        List<string> usernames = new List<string>();
        while (dr.Read())
        {
            usernames.Add((string)dr[0]);
        }
        foreach (var u in usernames)
        {
            drpFacultyName.Items.Add(u);
        }
    }

    public void ReadStudentName()
    {
        System.Data.SqlClient.SqlDataReader dr = new SqlManager().reader("Select username from Student");
        List<string> usernames = new List<string>();
        while (dr.Read())
        {
            usernames.Add((string)dr[0]);
        }
        foreach (var u in usernames)
        {
            drpStudentName.Items.Add(u);
        }
    }

    protected void btnSendMessage_Click(object sender, EventArgs e)
    {
        if (contactMessage.Text == string.Empty)
        {
            Session["m"] = "Message not sent! No Message was typed.";
            Response.Redirect("Index.aspx");
            return;
        }
        string username = drpStudentName.SelectedValue;
        string sql = "INSERT INTO Message values(@message, @type, @date, @username, @read)";
        System.Data.SqlClient.SqlCommand cmd = new SqlManager().command();
        cmd.CommandText = sql;
        cmd.Parameters.AddWithValue("@message", contactMessage.Text);
        cmd.Parameters.AddWithValue("@username", username);
        cmd.Parameters.AddWithValue("@read", "false");
        cmd.Parameters.AddWithValue("@type", "student");
        cmd.Parameters.AddWithValue("@date", DateTime.Now);
        int i = cmd.ExecuteNonQuery();
        if (i > 0)
        {
            Session["m"] = "Hooray!, you have sent a message to " + username;
            Response.Redirect("Index.aspx");
        }
    }
    public void ReadAlertMessage()
    {
        string message = (string)Session["m"];
        var p = new ProjectManager();
        if (Session["m"] != null)
        {
            p.ReadAdminMessage(sPanel, message, lblSuccess);
            Session["m"] = null;
        }
        else
        {
            sPanel.Visible = false;
        }
    }

}