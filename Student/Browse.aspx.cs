using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_Browse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        username.InnerText = HttpContext.Current.User.Identity.Name;
    }
}