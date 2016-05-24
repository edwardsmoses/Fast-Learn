using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_Payment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.validcourse();
        List<Course> course = new List<Course>();
        course = new CourseManager().courseinfo((string)Request.QueryString["course"]);
        foreach (var c in course)
        {
            byte[] bytes = c.Picture;
            string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            cartimage.Src = " data:image/png;base64, " + base64String;
            cartprice.InnerText = "₦" + string.Format("{0:n0}", c.Fee);
        }
        if (!IsPostBack)
        { this.getProfileInformation(); }

    }

    public void validcourse()
    {
        string desc = "";
        List<Course> course = new List<Course>();
        course = new CourseManager().courseinfo((string)Request.QueryString["course"]);
        foreach (var c in course)
        {
            desc = c.Information;
        }
        if (desc == String.Empty)
        {
            Response.Redirect("Browse.aspx");
        }
    }
    public void enroll()
    {
        int CourseID = 0;
        int StudentID = 0;
        List<Course> course = new List<Course>();
        List<Student> student = new List<Student>();
        student = new StudentManager().studentInfo(HttpContext.Current.User.Identity.Name);
        course = new CourseManager().courseinfo((string)Request.QueryString["course"]);
        foreach (var c in course)
        {
            CourseID = c.ID;
        }
        foreach (var s in student)
        {
            StudentID = s.ID;
        }
        System.Data.SqlClient.SqlCommand cmd = new SqlManager().command();
        cmd.CommandText = "Insert into StudentCourse values(@cid, @sid, @date)";
        cmd.Parameters.AddWithValue("@sid", StudentID);
        cmd.Parameters.AddWithValue("@cid", CourseID);
        cmd.Parameters.AddWithValue("@date", DateTime.Now);
        int rows = cmd.ExecuteNonQuery();
        if (rows > 0)
        {
            Session["m"] = "Hooray!, you have successfully enrolled in " + Request.QueryString["course"] + ".";
            Response.Redirect("Default.aspx");
        }
    }

    protected void btnPay_Click(object sender, EventArgs e)
    {
        if (lcheckbox.Checked)
        {
            Profile.SetPropertyValue("Name", txtCreditCardName.Text);
            Profile.SetPropertyValue("CardNo", txtCreditCardNumber.Text);
            Profile.SetPropertyValue("CCV", txtCVV.Text);
            Profile.Save();
        }
        else { }
        this.enroll();
    }
    void getProfileInformation()
    {
        txtCreditCardName.Text = (string)Profile.GetPropertyValue("Name");
        txtCreditCardNumber.Text = (string)Profile.GetPropertyValue("CardNo");
        txtCVV.Text = (string)Profile.GetPropertyValue("CCV");
    }
}
