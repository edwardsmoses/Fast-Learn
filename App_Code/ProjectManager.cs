using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for ImageManager
/// </summary>
public class ProjectManager
{
    public ProjectManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }
        public byte[] FileToArray(string filePath)
      {
        FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.Read);
        BinaryReader br = new BinaryReader(fs);
        Byte[] bytes = br.ReadBytes((Int32)fs.Length);
        br.Close();
        fs.Close();
        return bytes;
      }

    public void ReadAlertMessage(Panel p, string m, Label l)
    {
            p.Visible = true;
            p.CssClass = "alert alert-success";
            l.Text = (string)m;
    }

    public void ReadSucessMessage(Panel p, string m, Label l)
    {
        p.Visible = true;
        p.CssClass = "alert alert-success alertdiv";
        l.Text = (string)m;
    }
    public void ReadAdminMessage(Panel p, string m, Label l)
    {
        p.Visible = true;
        p.CssClass = "alert alertdiv";
        l.Text = (string)m;
    }

    public string ReadImage(byte[] bytes)
    {
        string url = "";
        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
        url = "data:image/png;base64, " + base64String;
        return url;
    }
}

