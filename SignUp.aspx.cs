using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;

public partial class SignIN : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Roles.RoleExists("Student"))
        {
            Roles.CreateRole("Student");
            Roles.CreateRole("Admin");
            Roles.CreateRole("Faculty");
        }
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        string imgPath = "images/user.png";
        string picPath = HttpContext.Current.Server.MapPath(imgPath);
        MembershipCreateStatus result;
        var sql = new SqlManager();
        var image = new ProjectManager();
        if (Page.IsValid)
        {
            try
            {
                MembershipUser newUser = Membership.CreateUser(txtUserName.Text, txtPwd.Text, txtEmail.Text, drquestion.SelectedValue, txtAnswer.Text, true, out result);
                if (result == MembershipCreateStatus.Success)
                {
                    SqlCommand cmd = sql.command();
                    cmd.CommandText = "Insert into Student values(@fname, @lname, @pic, @date, @address, @username)";
                    cmd.Parameters.AddWithValue("@fname", txtFName.Text);
                    cmd.Parameters.AddWithValue("@lname", txtLName.Text);
                    cmd.Parameters.AddWithValue("@pic",image.FileToArray(picPath));
                    cmd.Parameters.AddWithValue("@date", DateTime.Now);
                    cmd.Parameters.AddWithValue("@address", "Nigeria");
                    cmd.Parameters.AddWithValue("@username", txtUserName.Text);
                    int rows = cmd.ExecuteNonQuery();
                    Roles.AddUserToRole(txtUserName.Text, "Student");
                    if (rows > 0)
                    {
                        Session["message"] = "You have successfully registered on FastLearn. Please login with your username and password!";
                        Response.Redirect("Login.aspx");
                    }
                    else
                    {
                        sPanel.CssClass = "alert alert-danger";
                        sPanel.Visible = true;
                        lblSuccess.Text = "Sign Up Error ! Please try again in a few seconds.";
                        return;
                    }
                }
                else
                {
                    sPanel.CssClass = "alert alert-danger";
                    sPanel.Visible = true;
                    lblSuccess.Text = result.ToString();
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
}