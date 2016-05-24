using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_DeleteStudent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            System.Data.SqlClient.SqlDataReader dr = new SqlManager().reader("Select username from Student");
            List<string> usernames = new List<string>();
            while (dr.Read())
            {
                usernames.Add((string)dr[0]);
            }
            foreach (var u in usernames)
            {
                drpStudentName.Items.Add(u);
            }
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        string username = drpStudentName.SelectedValue;
        System.Web.Security.Membership.DeleteUser(username);
        System.Data.SqlClient.SqlCommand cmd = new SqlManager().command();
        cmd.CommandText = "Delete from Student where username = @name";
        cmd.Parameters.AddWithValue("@name", username);
        int i = cmd.ExecuteNonQuery();
        if (i > 0)
        {
            System.Data.SqlClient.SqlCommand cmd1 = new SqlManager().command();
            cmd1.CommandText = "Delete from Query where [to] = @name or [from] = @name";
            System.Data.SqlClient.SqlCommand cmd2 = new SqlManager().command();
            cmd1.Parameters.AddWithValue("@name", username);
            cmd2.CommandText = "Delete from Message where username = @name";
            cmd2.Parameters.AddWithValue("@name", username);
            int iq = cmd1.ExecuteNonQuery();
            int im = cmd2.ExecuteNonQuery();
            Session["m"] = "Well!, you have successfully deleted user " + username;
            Response.Redirect("Index.aspx");
        }
    }
}