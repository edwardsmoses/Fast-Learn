using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Student_Settings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnPwd_Click(object sender, EventArgs e)
    {
        string username = HttpContext.Current.User.Identity.Name;
        MembershipUser m = Membership.GetUser(username);
        if (m.ChangePassword(txtPwd.Text, txtRPwd.Text))
        {
            Session["m"] = "You have changed your password successfully";
            Response.Redirect("Default.aspx");
        }
        else
        {
            sPanel.CssClass = "alert alert-danger";
            sPanel.Visible = true;
            lblSuccess.Text = "Error! Please try again later.";
            return;
        }
    }
}