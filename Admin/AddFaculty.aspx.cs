using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AddFaculty : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            System.Data.SqlClient.SqlDataReader dr = new SqlManager().reader("Select Name from Courses");
            List<string> coursenames = new List<string>();
            while (dr.Read())
            {
                coursenames.Add((string)dr[0]);
            }
            foreach (var c in coursenames)
            {
                drpCourseName.Items.Add(c);
            }
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string imgPath = "../images/user.png";
        string picPath = HttpContext.Current.Server.MapPath(imgPath);
        MembershipCreateStatus result;
        if (Page.IsValid)
        {
            try
            {
                MembershipUser newUser = Membership.CreateUser(txtUName.Text, txtPwd.Text, txtEmail.Text, drquestion.SelectedValue, txtAnswer.Text, true, out result);
                if (result == MembershipCreateStatus.Success)
                {
                    System.Data.SqlClient.SqlCommand cmd = new SqlManager().command();
                    cmd.CommandText = "Insert into Faculty values(@fname, @lname, @pic, @date, @address, @username)";
                    cmd.Parameters.AddWithValue("@fname", txtFName.Text);
                    cmd.Parameters.AddWithValue("@lname", txtLName.Text);
                    cmd.Parameters.AddWithValue("@pic", new ProjectManager().FileToArray(picPath));
                    cmd.Parameters.AddWithValue("@date", DateTime.Now);
                    cmd.Parameters.AddWithValue("@username", txtUName.Text);
                    cmd.Parameters.AddWithValue("@address", "Nigeria");
                    int i = cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        System.Data.SqlClient.SqlCommand cmd1 = new SqlManager().command();
                        cmd1.CommandText = "Insert into FacultyCourse values(@cid, @fid, @date)";
                        cmd1.Parameters.AddWithValue("@cid", CourseID());
                        cmd1.Parameters.AddWithValue("@fid", FID(txtUName.Text));
                        cmd1.Parameters.AddWithValue("@date", DateTime.Now);
                        int f = cmd1.ExecuteNonQuery();
                        if (f > 0)
                        {
                            Roles.AddUserToRole(txtUName.Text, "Faculty");
                            Session["m"] = "Hooray!, you have successfully added a new faculty member.";
                            Response.Redirect("Index.aspx");
                        }
                    }

                }
            }
            catch (Exception ex)
            {
                sPanel.CssClass = "alert alert-danger";
                sPanel.Visible = true;
                //lblSuccess.Text = "failed! Please try again later.";
                lblSuccess.Text = ex.Message;
                return;
            }
        }
    }

    public int CourseID()
    {
        int cid = 0;
        System.Data.SqlClient.SqlDataReader sdr = new SqlManager().reader("Select CourseID from Courses where Name like '" + drpCourseName.SelectedValue + "'");
        while (sdr.Read())
        {
            cid = (int)sdr[0];
        }
        return cid;
    }

    public int FID(string username)
    {
        int fid = 0;
        System.Data.SqlClient.SqlDataReader sdr = new SqlManager().reader("Select FacultyID from Faculty where username like '" + username + "'");
        while (sdr.Read())
        {
            fid = (int)sdr[0];
        }
        return fid;
    }
}

