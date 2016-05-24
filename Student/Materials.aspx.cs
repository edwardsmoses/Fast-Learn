using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_Materials : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        coursebox.InnerHtml = new CourseManager().mymaterials(Request.QueryString["course"]).ToString();
        countcourses.InnerText = new CourseManager().coursesID(HttpContext.Current.User.Identity.Name).Count.ToString();
    }

    [WebMethod]
    public static void Download(string FileName)
    {
        HttpContext.Current.Response.Clear();
        HttpContext.Current.Response.ContentType = "application/octect-stream";
        HttpContext.Current.Response.AppendHeader("content-disposition", "filename=" + FileName);
        HttpContext.Current.Response.TransmitFile(HttpContext.Current.Server.MapPath("~/Materials/") + FileName);
        //HttpContext.Current.Response.End();
    }
    //public void Downloaded(string FileName)
    //{
    //    Response.Clear();
    //    Response.ContentType = "application/octect-stream";
    //    Response.AppendHeader("content-disposition", "filename=" + FileName);
    //    Response.TransmitFile(Server.MapPath("~/Materials/") + FileName);
    //    Response.End();
    //}


}