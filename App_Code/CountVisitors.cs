using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Linq;

/// <summary>
/// Summary description for CountVisitors
/// </summary>
public class CountVisitors
{
    public CountVisitors()
    {
        //
        // TODO: Add constructor logic here
        //
    }
       public void Counter()
        {
            string fullPath = HttpContext.Current.Server.MapPath("~/counter.xml");
            XDocument doc = XDocument.Load(fullPath);
            int hits = int.Parse(doc.Descendants("counter").First().Value.Trim()) + 1;
            doc.Descendants("counter").First().SetValue(hits);
            doc.Save(fullPath);
        }

        public string ReadCounter()
        {
            string fullPath = HttpContext.Current.Server.MapPath("~/counter.xml");
            XDocument doc = XDocument.Load(fullPath);
            int hits = int.Parse(doc.Descendants("counter").First().Value.Trim());
            return hits.ToString();
        }
    }