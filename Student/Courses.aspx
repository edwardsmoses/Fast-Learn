<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Courses.aspx.cs" Inherits="Student_Courses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title><%=Request.QueryString["c"] + " | Fast Learn" %></title>

    <%--icon stylesheet--%>
    <link rel="icon" href="../../images/fl.jpg" />
    
    <%--beginning of css styles--%> 
        <%--stylesheet region--%>
    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../css/font-awesome.min.css" rel="stylesheet" />
    <link href="../../css/open-sans.css" rel="stylesheet" />
    <link href="../../css/stylesheet.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
    <link href="../css/browse.css" rel="stylesheet" />
    <link href="../css/header.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />

    <%--script region--%>
    <script src="../../js/jquery.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <script src="js/courses.js"></script>

    <%--jquery ui autocomplete--%>
        <link href="../../css/jquery-ui.min.css" rel="stylesheet" />
     <script src="../../js/jquery-ui.min.js"></script>
    <script src="../../js/Search.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    <%--begginning of header--%>
              <div class="coverphoto coverall">
        <div class="container container-comedown" >
            <div class="top-nav"> 
             <div class="navbar navbar-static-top">
                 <img src="../../images/logo.png"  runat="server" class="navbar-brand logo"/>
            <div class="navbar-form">
                    <div class="input-group margin-right">
      <span class="input-group-btn"><a class="btn btn-primary primary" type="button" href="Browse.aspx"><i class="fa fa-stack fa-institution"></i>Catalog</a></span>
      <input type="text" class="form-control formheight formwidth" placeholder="Search courses" id="txtCSearch"/>
                         <span class="input-group-btn"><a class="btn btn-default default formheight" type="button" href="#"><i class="fa fa-search searchlink" onclick='location.href="SearchResults.aspx?search=" + txtCSearch.value;'></i></a></span>
    </div>
                    <div class="pull-right">
            <ul class="nav navbar-nav">
                    <li><a href="Default.aspx" class="bname username" title="Home" id="username" runat="server"></a></li>
                </ul>
                    </div>
                </div>
            
            </div>
                </div>
        </div>

                    <div class="coverheader">
                    <div class="row">
                        <div class="col-lg-push-3 col-lg-9 maincontainer">
                            <div class="breadcrumb breadcrumbs">
                                <a href="Browse.aspx">Catalog</a>
                                <i class="fa fa-chevron-right"></i>
                                <a href="#" id="smalltitle" runat="server">Business Management</a>
                            </div>
                            <h1 class="coversummary" id="bigtitle" runat="server">Business Management</h1>
                        </div>
                    </div>
                </div>
        </div>
        <%--end of header--%>

      <%--beginning of content--%>
        <div class="browseLayout">
              
            <div class="col-lg-3 rootboxcontainer">
                <div class="subcontainer" data-spy="affix" data-offset-top="205">
            <div class="rootbox col-lg-push-7 col-lg-3" style="margin-top:-120px;">
                <a  class="childbox" href="Courses.aspx?c=Business Management">Business Management</a>
                <a  class="childbox" href="Courses.aspx?c=Arts and Humanities">Arts and Humanities</a>
                <a class="childbox" href="Courses.aspx?c=Computer Science">Computer Science</a>
                <a  class="childbox" href="Courses.aspx?c=Math and Logic">Math and Logic</a>
                <a  class="childbox" href="Courses.aspx?c=Data Science">Data Science</a>
                <a class="childbox" href="Courses.aspx?c=Physical Science">Physical Science and Engineering</a>
                <a class="childbox" href="Courses.aspx?c=History">History</a>
                <a class="childbox" href="Courses.aspx?c=Social Science">Social Science</a>
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
                <img src="../../images/logo.png" class="navbar-brand"/>
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
