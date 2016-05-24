<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Browse.aspx.cs" Inherits="Student_Browse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Browse | Fast Learn</title>

    <%--icon stylesheet--%>
    <link rel="icon" href="../images/fl.jpg" />
    
    <%--beginning of css styles--%> 
        <%--stylesheet region--%>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
    <link href="../css/open-sans.css" rel="stylesheet" />
    <link href="../css/stylesheet.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/browse.css" rel="stylesheet" />

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
    <%--begginning of header--%>
            <div style="max-height:63px;">
        <div class="container">
            <div class="top-nav"> 
             <div class="navbar navbar-static-top">
                 <img src="../images/logo.png"  runat="server" class="navbar-brand logo"/>
            <div class="navbar-form">
                    <div class="input-group margin-right">
      <span class="input-group-btn"><a class="btn btn-primary primary" type="button" href="#"><i class="fa fa-stack fa-institution"></i>Catalog</a></span>
      <input type="text" class="form-control formheight formwidth" placeholder="Search courses" id="txtCSearch"/>
                         <span class="input-group-btn"><a class="btn btn-default default formheight" type="button" onclick='location.href="SearchResults.aspx?search=" + txtCSearch.value;'><i class="fa fa-search searchlink" ></i></a></span>
    </div>
                    <div class="pull-right">
            <ul class="nav navbar-nav">
                    <li><a href="Default.aspx" class="bname" title="Home" id="username" runat="server"></a></li>
                </ul>
                    </div>
                </div>
            
            </div>
                </div>
        </div>
        </div>
        <%--end of header--%>

      <%--beginning of content--%>
        <div class="contentpage">
            <div class="rootbox col-lg-push-1 col-lg-3">
                    <a href="Courses.aspx?c=Arts and Humanities" class="childbox">Arts and Humanities</a>
                    <a href="Courses.aspx?c=Business Management" class="childbox">Business Management</a>
                 <a href="Courses.aspx?c=Computer Science" class="childbox">Computer Science</a>
                 <a href="Courses.aspx?c=Math and Logic" class="childbox">Math and Logic</a>
                <a href="Courses.aspx?c=Data Science" class="childbox">Data Science</a>
                <a href="Courses.aspx?c=Physical Science" class="childbox">Physical Science and Engineering</a>
                <a href="Courses.aspx?c=History" class="childbox">History</a>
                <a href="Courses.aspx?c=Social Science" class="childbox">Social Science</a>
            </div>
            <div class="col-lg-push-1 statement col-lg-4">
                Hundreds of Specializations and courses in <a href="Courses.aspx?c=Business Management">Business Management</a>, <a href="Courses.aspx?c=Computer Science">computer science</a>, <a href="Courses.aspx?c=History">History</a>, and more.
            </div>
        </div>

        <%--footer page--%>
              <footer class="navbar navbar-static-bottom navbar-bottom footer" role="navigation">
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
    </footer>
    </div>
    </form>
</body>
</html>
