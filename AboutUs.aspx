<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="AboutUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>About Us | Fast Learn</title>

     <%--StyleSheet Section--%>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/stylesheet.css" rel="stylesheet" />
     <link href="css/animate.css" rel="stylesheet" />
    
<%--scripts section--%>
        <script src="js/jquery.js"></script>
      <script src="js/bootstrap.min.js"></script>
    <script src="js/wow.min.js"></script>

    <%--icon section--%>
    <link rel="icon" href="images/fl.jpg" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <div class="small-banner">
        <div class="container">
           
                <img src="images/logo.png" class="navbar-brand logo top-nav"/>
            <div class="top-nav"> 
             <div class="navbar navbar-static-top">
            <ul class="nav navbar-nav  nav-pullright">
                <li><a href="Default.aspx">HOME</a></li>
                <li><a href="Student/Browse.aspx">COURSES</a></li>
                <li><a href="AboutUs.aspx" class="active">ABOUT US</a></li>
                <li><a href="ContactUs.aspx">CONTACT US</a></li>
                </ul>
                <div class="pull-right">
               <ul class="nav navbar-nav">
                    <li><a href="Login.aspx">LOG IN</a></li>
                    <li><a href="SignUp.aspx">SIGN UP</a></li>
                </ul>
                    </div>
            </div>
                </div>
        </div>
        </div>
        
        <div class="container">
            <h2><strong class="bold-text">About</strong><span class="light-text"> US</span></h2>
        <div class="line"></div>
        <div class="row aboutUs">
             <div class="col-lg-5">
                <img src="images/02.png"/>
            </div>
            <div class="col-lg-5 col-lg-offset-1">
             <p class="animated fadeInLeft learn wow">Fast Learn Inc. is a distance-learning institute that was founded by Samuel Rogers 10 years ago.Fast Learn is known for its excellence in education, attracting thousands of students from various countries.</p>
                </div>
                </div>

            <h2><strong class="bold-text">Why Choose</strong><span class="light-text"> US</span></h2>
        <div class="line"></div>
            <div class="row aboutUs">
    <div class="col-lg-offset-3 col-lg-8">
        <img src="images/icon-about-1.png" class="pull-left margin-little"/>
        <p class="learn animated fadeInUp no-margin"><b>All courses in one place</b> We find and organize free college courses from over 17 platforms and 200+ universities, enabling you to search for them in one spot. No more sorting through random videos and incomplete courses. Make your learning buffet today with awesome courses from top universities.</p>
    </div>
          </div>

             <div class="row aboutUs">
    <div class="col-lg-offset-1 col-lg-8">
        <img src="images/icon-about-2.png" class="pull-right"/>
        <p class="learn animated fadeInUp no-margin wow"><b>Individually examined and classified</b>  We examine every single course and classify it using the FastLearn classification system. We show you the approximate level a course would be at a traditional university and which courses are roughly equivalent. This allows you to easily compare courses and know which order to take them.</p>
    </div>
          </div>

            <div class="row aboutUs">
    <div class="col-lg-offset-3 col-lg-8">
        <img src="images/icon-about-3.png" class="pull-left margin-bottom"/>
        <p class="learn animated fadeInUp no-margin"><b>Better search results</b>  We combine FastLearn classification with tagging so you can find the courses that work for you immediately. Spend your time learning not searching.</p>
    </div>
        </div>    
    </div>

              <footer class="navbar navbar-static-bottom navbar-inverse navbar-bottom footer footerss" role="navigation">
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
                <li><span class="gray-text"><i class="icon-globe fa fa-globe"></i>&nbsp;English&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></li> 
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
    </form>
</body>
</html>
