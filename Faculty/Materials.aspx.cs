using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Faculty_Materials : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request.QueryString["course"] == null || Request.QueryString["course"] == String.Empty)
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string fileName = "";
        if(FileUpload1.HasFile)
        {
            string fileExt = Path.GetExtension(FileUpload1.FileName);
            if (fileExt.ToLower() == ".pdf" || fileExt.ToLower() == ".txt" ||  fileExt.ToLower() == ".docx" || fileExt.ToLower() == ".doc" || fileExt.ToLower() == ".mp4" || fileExt.ToLower() == ".avi" || fileExt.ToLower() == ".mkv")
            {
                int fileSize = FileUpload1.PostedFile.ContentLength;
                int Size = fileSize / 1048576;
                if (Size < 30)
                {
                    FileUpload1.SaveAs(Server.MapPath("~/Materials/" + FileUpload1.FileName));
                    fileName = FileUpload1.FileName;
                }
                else {
                    sPanel.CssClass = "alert alert-danger";
                    sPanel.Visible = true;
                    lblSuccess.Text = "Please Upload a file less than 30mb.";
                    return;
                }
            }
            else
            {
                sPanel.CssClass = "alert alert-danger";
                sPanel.Visible = true;
                lblSuccess.Text = "Please Upload either a pdf, word file or a video.";
                return;
            }
        }
        else
        {
            sPanel.CssClass = "alert alert-danger";
            sPanel.Visible = true;
            lblSuccess.Text = "Please Upload a file.";
            return;
        }
        string name = Request.QueryString["course"];
        int cid = 0;
        SqlDataReader sdr = new SqlManager().reader("Select CourseID from Courses where Name like '" + name + "'");
        while (sdr.Read())
        {
            cid = (int)sdr[0];
        }
        string sql = "Insert into Materials values(@name, @desc,@date, @id,@fileName)";
        System.Data.SqlClient.SqlCommand cmd = new SqlManager().command();
        cmd.CommandText = sql;
        cmd.Parameters.AddWithValue("@name", txtTitle.Text);
        cmd.Parameters.AddWithValue("@desc", txtDesc.Text);
        cmd.Parameters.AddWithValue("@date", DateTime.Now);
        cmd.Parameters.AddWithValue("@id", cid);
        cmd.Parameters.AddWithValue("@fileName", fileName);
        int id = cmd.ExecuteNonQuery();
        if (id > 0)
        {
            Session["m"] = "You have successfully uploaded Course Materials";
            Response.Redirect("Default.aspx");
        }
        else
        {
            sPanel.CssClass = "alert alert-danger";
            sPanel.Visible = true;
            lblSuccess.Text = "failed! Please try again later.";
            return;
        }
    }
}