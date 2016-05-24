﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Student_ProfilePicture : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
            { 
        string username = HttpContext.Current.User.Identity.Name;
        var student = new StudentManager().studentInfo(username);
        foreach(var c in student)
        {
            txtFName.Text = c.FirstName;
            txtLName.Text = c.LastName;
            txtAddress.Text = c.Address;
        }
        }
    }

    protected void btnProfile_Click(object sender, EventArgs e)
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
                    string sql = "UPDATE Student set Picture = @eimg , FirstName = @fname, LastName = @lname, Address= @address where username = @uname";
                    System.Data.SqlClient.SqlCommand cmd = new SqlManager().command();
                    cmd.CommandText = sql;
                    cmd.Parameters.AddWithValue("@eimg", bytes);
                    cmd.Parameters.AddWithValue("@fname", txtFName.Text);
                    cmd.Parameters.AddWithValue("@lname", txtLName.Text);
                    cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@uname", HttpContext.Current.User.Identity.Name);
                    int id = cmd.ExecuteNonQuery();
                    if (id > 0)
                    {
                        Session["m"] = "You have successfully updated your profile information";
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