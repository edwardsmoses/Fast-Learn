using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContactUs : System.Web.UI.Page
{
    SqlManager dc = new SqlManager();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnfeedback_Click(object sender, EventArgs e)
    {
        try
        {
            sPanel.Visible = false;
            int rows = dc.cmd("Insert into Feedback(Name, email, Date, Message) values('" + contactName.Text + "','" + contactEmail.Text + "','" + DateTime.Now + "','" + contactMessage.Text + "')");
            if (rows > 0)
            {
                sPanel.Visible = true;
                sPanel.CssClass = "alert alert-success";
                lblSuccess.Text = "Your feedback has been forwarded sucessfully. " + contactName.Text + ", a reply will be sent to your email soon.";
            }
            else
            {
                sPanel.CssClass = "alert alert-danger";
                sPanel.Visible = true;
                lblSuccess.Text = "Error! Please try again in 5 seconds.";
                return;
            }
        }
        catch (Exception ex)
        {
            sPanel.CssClass = "alert alert-danger";
            sPanel.Visible = true;
            lblSuccess.Text = ex.Message;
            return;
        }
    }
}
