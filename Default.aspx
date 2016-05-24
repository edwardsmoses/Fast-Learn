<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fast Learn | An E-Learn Solution</title>

    <%--icon file--%>
    <link rel="icon" href="images/fl.jpg" />

    <%--css files--%>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/animate.css" rel="stylesheet" />
    <link href="css/morphext.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/services.css" rel="stylesheet" />
    <link href="css/hvr.css" rel="stylesheet" />

    <%--js files--%>
    <script src="js/jquery.js"></script>
    <script src="js/smoothscroll.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/morphext.min.js"></script>
    <script src="js/slider.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <%--banner section--%>
        <div class="banner">
            <div class="container">
                <%--navbar section--%>
                <div class="top-nav">
                <img src="images/logo.png" class="logo"/>
                    <div class="navbar navbar-static-top">
                        <ul class="navbar-nav navbar-right nav">
                            <li class="active"><a href="#" class="active">HOME</a></li>
                <li><a href="Student/Browse.aspx">COURSES</a></li>
                <li><a href="AboutUs.aspx">ABOUT US</a></li>
                <li><a href="ContactUs.aspx">CONTACT US</a></li>
                            <li><a href="Login.aspx" class="btn btnblue hvr hvr-grow">SIGN IN</a></li>
                        </ul>
                    </div>
                </div>
                
                <%--text section--%>
                <div class="caption">
                    <h1 id="slide" class="animated">WHO DO YOU WANT TO BE?, THE MOST ORGANIZED ONLINE CATALOG, LEARN FROM THE BEST. ANYTIME. ANYWHERE, TAKE THE WORLD'S BEST COURSES ONLINE.</h1>
                    <p id="slide1" class="animated fadeIn">Own your future by taking new courses online, A full world class education from top schools is now at your fingertips.</p>
                    <div class="input-group col-lg-push-4 col-lg-4 col-md-4 col-md-push-4 col-sm-4 col-sm-push-4">
                        <asp:TextBox runat="server" ID="txtSearch" CssClass="form-control" placeholder="I want to learn about..." AutoPostBack="true" AutoCompleteType="Disabled"></asp:TextBox>
                        <div class="input-group-btn">
                        <a onclick='location.href="search.aspx?s="+ txtSearch.value;' class="btn btn-primary"><i class="fa fa-search"></i></a></div>
                    </div>
                     <a href="#services" class="scrollbtn smoothScroll fa fa-3x fa-angle-down"></a>
                </div>

                <%--category section--%>
               
            </div>
       
        </div>
            <section id="services" class="section section-padded">
		<div class="container">
			<div class="row text-center title">
				<h1>LATEST COURSES</h1>
			</div>
			<div class="row services" id="latestCourses" runat="server">
			</div>
		</div>
		<div class="cut cut-bottom"></div>
	</section>

        <%--footer section--%>
        <footer class="navbar navbar-static-bottom navbar-inverse navbar-bottom home-footer" role="navigation">
             <div class="">
                <img src="images/logo.png" class="navbar-brand"/>
            <ul class="nav navbar-nav navbar-left">
                        <li><a href="AboutUs.aspx" class="white-text">About Us</a></li>
                        <li><a href="#" class="white-text">Courses</a></li>
                        <li><a href="ContactUs.aspx" class="white-text">Feedback</a></li>
                        <li><a href="SignUp.aspx" class="white-text">Register</a></li>
            </ul>
                </div>
            <br />
            <div class="">
            <ul class="nav navbar-nav pull-left lefts">
                <li><span class="gray-text"><i class="icon-globe fa fa-globe"></i>&nbsp;English&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></li> 
                <li><span class="gray-text">Copyright © 2016 Fast Learn, Inc. All rights reserved.</span></li>
            </ul>
                <div class="socials pull-right">
          <a href="#" class="fa fa-twitter" title="Follow Us"></a>
          <a href="#" class="fa fa-facebook" title="Like Us"></a>
          <a href="#" class="fa fa-google-plus" title="Google Plus"></a>
          <a href="#" class="fa fa-youtube" title="Watch Us"></a>
        </div>
        </div>
            </footer>
    </form>
</body>
</html>
