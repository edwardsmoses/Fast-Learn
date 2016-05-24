using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnChangePwd_Click(object sender, EventArgs e)
    {
        MembershipUser u;
        string newPassword;

        u = Membership.GetUser(txtUserName.Text, false);

        if (u == null)
        {
            sPanel.CssClass = "alert alert-danger";
            sPanel.Visible = true;
            lblSuccess.Text = "Username " + Server.HtmlEncode(txtUserName.Text) + " not found. Please check the value and re-enter.";
            return;
        }

        try
        {
            newPassword = u.ResetPassword(txtAnswer.Text); ;
        }
        catch (MembershipPasswordException ex)
        {
            sPanel.CssClass = "alert alert-danger";
            sPanel.Visible = true;
            lblSuccess.Text = ex.Message;
            return;
        }
        catch (Exception ex)
        {
            sPanel.CssClass = "alert alert-danger";
            sPanel.Visible = true;
            lblSuccess.Text = ex.Message;
            return;
        }

        if (newPassword != null)
        {
            if (u.ChangePassword(newPassword, txtPwd.Text))
            {
                sPanel.CssClass = "alert alert-success";
                sPanel.Visible = true;
                Session["message"] = "You have successfully changed your password. Please login with your new password!!";
                Response.Redirect("Login.aspx");
            }

        }
        else
        {
            sPanel.CssClass = "alert alert-danger";
            sPanel.Visible = true;
            lblSuccess.Text = "Password reset failed. Please re-enter your values and try again.";
        }
    }
}
