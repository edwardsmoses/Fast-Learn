﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyCourses.aspx.cs" Inherits="Student_MyCourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
          <title><%=HttpContext.Current.User.Identity.Name %> | My Courses</title>
<link rel="icon" href="../../images/fl.jpg" />
    
    <%--beginning of css styles--%> 
        <%--stylesheet region--%>
    
        <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
    <link href="../css/open-sans.css" rel="stylesheet" />
    <link href="../css/stylesheet.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/browse.css" rel="stylesheet" />
    <link href="css/header.css" rel="stylesheet" />
    <link href="css/courses.css" rel="stylesheet" />

    <%--script region--%>
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>

    <%--jquery ui autocomplete--%>
        <link href="../css/jquery-ui.min.css" rel="stylesheet" />
     <script src="../js/jquery-ui.min.js"></script>
    <script src="../js/Search.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
          <div class="coverphoto coverall">
        <div class="container container-comedown" >
            <div class="top-nav"> 
             <div class="navbar navbar-static-top">
              <a href="Default.aspx"><img src="~/images/logo.png"  runat="server" class="navbar-brand logo"/></a>
            <div class="navbar-form">
                    <div class="input-group margin-right">
      <span class="input-group-btn"><a class="btn btn-primary primary" type="button" href="Browse.aspx"><i class="fa fa-stack fa-institution"></i>Catalog</a></span>
      <input type="text" class="form-control formheight formwidth" placeholder="Search courses" id="txtCSearch" runat="server"/>
                         <span class="input-group-btn"><a class="btn btn-default default formheight" type="button" href="#" onclick='location.href="SearchResults.aspx?search=" + txtCSearch.value;'><i class="fa fa-search searchlink"></i></a></span>
    </div>
                    <div class="pull-right">
            <ul class="nav navbar-nav">
                   <li><a href="Default.aspx" class="bname username" title="Home" id="username" runat="server"><%=HttpContext.Current.User.Identity.Name %></a></li>
                </ul>
                    </div>
                </div>
            
            </div>
                </div>
        </div>
                            <div class="coverheader">
                    <div class="row">
                        <div class="maincontainer">
                            <div class="text-center">
                            <h1 class="coversummary" runat="server" id="cover">My Courses</h1>
                            </div>
                            </div>
                        </div>
                </div>
        </div>

            <div class="browseLayout">
                  <div class="col-lg-3 rootboxcontainer" style="margin-top:-25px; margin-bottom:20px;">
                <div class="subcontainer" data-spy="affix" data-offset-top="205">
            <div class="rootbox col-lg-push-7 col-lg-3">
                <a  class="childbox childboxselected" href="#">My Courses  <sup><b class="badge" id="countcourses" runat="server">2</b></sup></a>
                <a  class="childbox" href="Browse.aspx">Browse</a>
            </div>
                    </div>
                </div>
                      <div class="col-lg-7 col-lg-push-1">
            <div class="coursed" id="coursebox" runat="server">
                    </div>
                 </div>
            </div>
   
          <div class="navbar navbar-default footers" role="navigation">
        <div class="container">
            <div class="row">
                <img src="../images/logo.png" class="navbar-brand"/>
                </div>
            <div class="row">
                                   <ul class="nav navbar-nav navbar-left">
                <li><span class="gray-text font"><i class="icon-globe fa fa-globe"></i>&nbsp;English&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></li> 
                <li><span class="gray-text font">Copyright © 2016 Fast Learn, Inc. All rights reserved.</span></li>
            </ul>
                <div class="socials pull-right rowfooter margin-little" style="margin-right:50px;">
          <a href="#" class="fa fa-twitter" title="Follow Us"></a>
          <a href="#" class="fa fa-facebook" title="Like Us"></a>
          <a href="#" class="fa fa-google-plus" title="Google Plus"></a>
          <a href="#" class="fa fa-youtube" title="Watch Us"></a>
        </div>
        </div>
            </div>
    </div>
    </div>
    </form>
</body>
</html>
