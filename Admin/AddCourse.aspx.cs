using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Admin_AddCourse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlDataReader dr = new SqlManager().reader("Select username from Faculty");
        List<string> usernames = new List<string>();
        while (dr.Read())
        {
            usernames.Add((string)dr[0]);
        }
        foreach (var u in usernames)
        {
            drpFaculty.Items.Add(u);
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            HttpPostedFile post = FileUpload1.PostedFile;
            string fileName = Path.GetFileName(post.FileName);
            string fileExt = Path.GetExtension(fileName);
            int fileSize = post.ContentLength;
            if (fileSize > 665600)
            {
                sPanel.CssClass = "alert alert-danger";
                sPanel.Visible = true;
                lblSuccess.Text = "Sorry! Please upload files less than 600kb";
                return;
            }
            else
            {
                if (fileExt.ToLower() == ".jpg" || fileExt.ToLower() == ".png" || fileExt.ToLower() == ".bmp" || fileExt.ToLower() == "gif")
                {
                    Stream st = post.InputStream;
                    BinaryReader br = new BinaryReader(st);
                    byte[] bytes = br.ReadBytes((int)st.Length);
                    string sql = "INSERT INTO Courses values(@name, @duration, @fee, @information,'', @date,@sdate, @picture, @category)";
                    System.Data.SqlClient.SqlCommand cmd = new SqlManager().command();
                    cmd.CommandText = sql;
                    cmd.Parameters.AddWithValue("@name", txtName.Text);
                    cmd.Parameters.AddWithValue("@duration", drpDuration.SelectedValue);
                    cmd.Parameters.AddWithValue("@fee", txtPrice.Text);
                    cmd.Parameters.AddWithValue("@information", txtDesc.Text);
                    cmd.Parameters.AddWithValue("@date", Calendar1.SelectedDate);
                    cmd.Parameters.AddWithValue("@sdate", DateTime.Now);
                    cmd.Parameters.AddWithValue("@picture", bytes);
                    cmd.Parameters.AddWithValue("@category", drpCategoryList.SelectedValue);
                    int id = cmd.ExecuteNonQuery();
                    if (id > 0)
                    {
                        int cid = 0;
                        int fid = 0;
                        System.Data.SqlClient.SqlDataReader dr = new SqlManager().reader("Select CourseID from Courses where Name like '" + txtName.Text + "' and ShortDescription like'" + txtDesc.Text + "'");
                        while (dr.Read())
                        {
                            cid = (int)dr[0];
                        }
                        System.Data.SqlClient.SqlDataReader sdr = new SqlManager().reader("Select FacultyID from Faculty where username like '" + drpFaculty.SelectedValue + "'");
                        while (sdr.Read())
                        {
                            fid = (int)sdr[0];
                        }
                        System.Data.SqlClient.SqlCommand cmd1 = new SqlManager().command();
                        cmd1.CommandText = "INSERT INTO FacultyCourse values(@cid, @fid, @date)";
                        cmd1.Parameters.AddWithValue("@cid", cid);
                        cmd1.Parameters.AddWithValue("@fid", fid);
                        cmd1.Parameters.AddWithValue("@date", DateTime.Now);
                        int check = cmd1.ExecuteNonQuery();
                        if (check > 0)
                        {
                            Session["m"] = "Hooray!, you have successfully added a new course.";
                            Response.Redirect("Default.aspx");
                        }
                    }
                    else
                    {
                        sPanel.CssClass = "alert alert-danger";
                        sPanel.Visible = true;
                        lblSuccess.Text = "failed! Please try again later.";
                        return;
                    }
                }
                else
                {
                    sPanel.CssClass = "alert alert-danger";
                    sPanel.Visible = true;
                    lblSuccess.Text = "Sorry!, Only images(.jpg, .png, .gif, .bmp) can be uploaded";
                    return;
                }
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
