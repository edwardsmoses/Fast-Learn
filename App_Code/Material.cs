using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Material
/// </summary>
public class Material
{
    public Material()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public string Title { get; set; }
    public string Description { get; set; }
        public DateTime Date { get; set; }
    public string CourseID { get; set; }
    public string Attachment { get; set; }
}