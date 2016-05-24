<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Search Results | Fast Learn</title>

    <%--icon file--%>
    <link rel="icon" href="images/fl.jpg" />

    <%--css files--%>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
        <link href="Student/css/style.css" rel="stylesheet" />
    <link href="Student/css/browse.css" rel="stylesheet" />
    <link href="Student/css/header.css" rel="stylesheet" />


</head>
<body>
    <form id="form1" runat="server">
    <div>
    <%--banner section--%>
        <div class="small-banner">
            <div class="container">
                <%--navbar section--%>
                <div class="top-nav">
                <img src="images/logo.png" class="logo"/>
                    <div class="navbar navbar-static-top">
                        <ul class="navbar-nav navbar-right nav">
                            <li><a href="Default.aspx">HOME</a></li>
                            <li><a href="Student/Browse.aspx">COURSES</a></li>
                <li><a href="AboutUs.aspx">ABOUT US</a></li>
                <li><a href="ContactUs.aspx">CONTACT US</a></li>
                            <li><a href="SignUp.aspx" class="btn btnblue" title="Create a free account">SIGN UP</a></li>
                        </ul>
                    </div>
                    <div class="coverheader">
                    <div class="row">
                            <h1 class="coversummary" runat="server" id="cover"></h1>
                        </div>
                </div>
                </div>
               
            </div>
      <div class="browseLayout">
                      <div class="col-lg-7 col-lg-push-1">
            <div class="coursed" id="coursebox" runat="server">
                    </div>
                 </div>
            </div>   
        </div>
    
    </div>
    </form>
</body>
</html>
