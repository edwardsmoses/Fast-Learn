using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Feedback
/// </summary>
public class Feedback
{
    public Feedback()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public string Name { get; set; }
    public string message { get; set; }
    public DateTime date { get; set; }
    public string email { get; set; }
    public int ID { get; set; }
}