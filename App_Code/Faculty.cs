using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Faculty
/// </summary>
public class Faculty
{
    public Faculty()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int ID { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Address { get; set; }
    public byte[] Image { get; set; }

}