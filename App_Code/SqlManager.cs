using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for SqlManager
/// </summary>
public class SqlManager
{
    public SqlManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public SqlConnection getCon()
    {
        string constr = ConfigurationManager.ConnectionStrings["FastLearnCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        con.Open();
        return con;
    }

    public SqlDataReader reader(string query)
    {
        SqlCommand cmd = new SqlCommand(query, getCon());
        SqlDataReader sdr = cmd.ExecuteReader();
        return sdr;
    }

    public SqlDataReader readercmd(SqlCommand cmd)
    {
        cmd.Connection = getCon();
        SqlDataReader sdr = cmd.ExecuteReader();
        return sdr;
    }


    public SqlCommand command()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = getCon();
        return cmd;
    }

    public int cmd(string query)
    {
        int rows = 0;
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = getCon();
        cmd.CommandText = query;
        rows = cmd.ExecuteNonQuery();
        return rows;
    }

}