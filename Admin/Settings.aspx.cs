using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Setting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnChange_Click(object sender, EventArgs e)
    {
        try
        {
            MembershipUser m = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            if (m.ChangePassword(txtCPwd.Text, txtRPwd.Text))
            {
                Session["m"] = "Hooray!, you have successfully changed your password.";
                Response.Redirect("Index.aspx");
            }
            else
            {
                sPanel.CssClass = "alert alert-danger";
                sPanel.Visible = true;
                lblSuccess.Text = "failed! Please try again later.";
                return;
            }
        }
        catch (MembershipPasswordException ex)
        {
            sPanel.CssClass = "alert alert-danger";
            sPanel.Visible = true;
            lblSuccess.Text = ex.Message;
            return;
        }

    }
}