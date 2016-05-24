using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Course
/// </summary>
public class Course
{
    public Course()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public int ID { get; set; }
    public string Name { get; set; }
    public string Duration { get; set; }
    public int Fee { get; set; }
    public string Information { get; set; }

    public DateTime StartDate { get; set; }
    public DateTime CreatedDate { get; set; }
    public byte[] Picture { get; set; }
    public string Category { get; set; }
}