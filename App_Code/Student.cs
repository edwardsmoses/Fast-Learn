using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Student
/// </summary>
public class Student
{
    public Student()
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
    public DateTime Date { get; set; }
}