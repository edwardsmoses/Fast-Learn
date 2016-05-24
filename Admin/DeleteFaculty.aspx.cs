using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_DeleteFaculty : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            System.Data.SqlClient.SqlDataReader sdr = new SqlManager().reader("Select username from Faculty");
            List<string> facultynames = new List<string>();
            while (sdr.Read())
            {
                facultynames.Add((string)sdr[0]);
            }
            foreach (var f in facultynames)
            {
                drpFaculty.Items.Add(f);
            }
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        string username = drpFaculty.SelectedValue;
        Membership.DeleteUser(username);
        System.Data.SqlClient.SqlCommand cmd = new SqlManager().command();
        cmd.CommandText = "Delete from Faculty where username = @name";
        cmd.Parameters.AddWithValue("@name", username);
        int i = cmd.ExecuteNonQuery();
        if (i > 0)
        {
            Session["m"] = "Well!, you have successfully deleted Faculty " + username;
            Response.Redirect("Index.aspx");
        }
    }
}