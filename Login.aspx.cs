using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.User.Identity.IsAuthenticated)
        {
            string User = HttpContext.Current.User.Identity.Name;
            if (Roles.IsUserInRole(User, "Student"))
            {
                Response.Redirect("Student/Default.aspx");
            }
            if (Roles.IsUserInRole(User, "Faculty"))
            {
                Response.Redirect("Faculty/Default.aspx");
            }
            if (Roles.IsUserInRole(User, "Admin"))
            {
                Response.Redirect("Admin/Index.aspx");
            }
        }
        string message = (string)Session["message"];
        var p = new ProjectManager();
        if(Session["message"] != null)
        {
            p.ReadAlertMessage(sPanel, message, lblSuccess);
            Session["message"] = null;
        }
        else
        {
            sPanel.Visible = false;
        }

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (Membership.ValidateUser(txtUserName.Text, txtPwd.Text))
        {
            FormsAuthentication.SetAuthCookie(txtUserName.Text, lcheckbox.Checked);
            if (Roles.IsUserInRole(txtUserName.Text, "Student"))
            {
                Response.Redirect("Student/Default.aspx");
            }
            if (Roles.IsUserInRole(txtUserName.Text, "Faculty"))
            {
                Response.Redirect("Faculty/Default.aspx");
            }
            if (Roles.IsUserInRole(txtUserName.Text, "Admin"))
            {
                Response.Redirect("Admin/Index.aspx");
            }

        }
        else
        {
            sPanel.CssClass = "alert alert-danger";
            sPanel.Visible = true;
            lblSuccess.Text = "We couldn’t sign you in. Check your username and password, then try again.";
            return;
        }
    }
}