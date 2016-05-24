<%@ Page Language="C#" AutoEventWireup="true" CodeFile="404.aspx.cs" Inherits="_404" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fast Learn</title>

         <%--StyleSheet Section--%>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/stylesheet.css" rel="stylesheet" />
     <link href="css/animate.css" rel="stylesheet" />
    
<%--scripts section--%>
        <script src="js/jquery.js"></script>
      <script src="js/bootstrap.min.js"></script>

    <%--icon section--%>
    <link rel="icon" href="images/fl.jpg" />


</head>
<body>
    <form id="form1" runat="server">
    <div>
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
                </div>
               
            </div>
       
        </div>

        <div class="container">
          <div class="aboutUs height">
             <div class="col-lg-2 col-lg-push-1">
                <i class="fa fa-5x love fa-question"></i>
            </div>
            <div class="col-lg-8 col-lg-offset-1">
                <h1 class="animated fadeInDown learns">Unknown Error!</h1>
             <p class="animated fadeInLeft learn">Sorry, an unknown error occured. The link was either broken, 
expired or the file was not found.   We could not find the page you were looking for.
                Meanwhile, you may <a href="Default.aspx">return to home.</a></p>
                </div>
                  </div>

        </div>
               <footer class="navbar navbar-inverse navbar-bottom footersd" role="navigation">
        <div class="container">
            <div class="row">
                <img src="images/logo.png" class="navbar-brand"/>
            <ul class="nav navbar-nav navbar-left">
                        <li><a href="AboutUs.aspx" class="white-text">About Us</a></li>
                        <li><a href="#" class="white-text">Courses</a></li>
                        <li><a href="#" class="white-text">Become an Instructor</a></li>
                        <li><a href="ContactUs.aspx" class="white-text">Feedback</a></li>
                        <li><a href="SignUp.aspx" class="white-text">Register</a></li>
            </ul>
                </div>
            <div class="row">
            <ul class="nav navbar-nav navbar-left">
                <li><span class="gray-text"><i class="icon-globe fa fa-
globe"></i>&nbsp;English&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></li> 
                <li><span class="gray-text">Copyright © 2016 Fast Learn, Inc. All rights reserved.</span></li>
            </ul>
                <div class="socials pull-right rowfooter">
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
