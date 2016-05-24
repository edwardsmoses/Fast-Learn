using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Services;

public partial class Admin_Feedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        messagelist();
    }

    public void messagelist()
    {
        StringBuilder strHtml = new StringBuilder();
        List<Feedback> feed = new List<Feedback>();
        System.Data.SqlClient.SqlDataReader dr = new SqlManager().reader("Select email, Message, Date, Name, FeedbackID from FeedBack ORDER BY DATE DESC");
        while (dr.Read())
        {
            feed.Add(new Feedback { email = (string)dr[0], date = (DateTime)dr[2], message = (string)dr[1], Name = (string)dr[3], ID = (int)dr[4] });
        }
        foreach (var f in feed)
        {
            strHtml.AppendFormat("<tr><td><input type='checkbox' value={3} class='checkbox'></td><td class='mailbox-name'><a>{0}</a></td><td class='mailbox-subject'><b>{2}</b>  {1}</td>", f.Name, f.message, f.email, f.ID);
            strHtml.AppendFormat("<td class=mialbox-date>{0}</td></tr>", new FacultyManager().checkDate(f.date));
        }
        messageList.InnerHtml = strHtml.ToString();
    }

    [WebMethod]
    public static void Deleted(string[] IDs)
    {
        int lm = 0;
        foreach (var c in IDs)
        {
            lm = new SqlManager().cmd("Delete from Feedback where FeedbackID like '" + c + "'");
        }
    }
}