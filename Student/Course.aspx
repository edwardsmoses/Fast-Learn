<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Course.aspx.cs" Inherits="Student_Course" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title><%=Request.QueryString["course"] %> | Fast Learn</title>
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
<body style="margin-bottom:120px;">
    <form id="form1" runat="server">
    <div>
    <%--begginning of header--%>
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
                                <b><p class="coversummary" style="margin-top:-60px;">ONLINE COURSE</p></b>
                            <h1 class="coversummary" runat="server" id="cover"><%=Request.QueryString["course"] %></h1>
                            <p class="coversummary" runat="server" id="shortdescription"></p></div>
                            </div>
                        </div>
                </div>
        </div>

        <div class="container">
            <div class="col-lg-8">
                <div class="coursecard">
                    <p class="about">About this Course</p>
                    <p>Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC.  </p>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="startdate">
                    <p class="heading">Course start date:</p>
                    <p class="date" id="startingdate" runat="server"></p>
                    <p class="heading">Course fee:</p>
                    <p class="date" id="coursefee" runat="server">NGN599</p>
                    <asp:Button runat="server" ID="btnenroll" CssClass="btn btn-primary pull-right enroll" Text="Enroll" OnClick="btnenroll_Click"/>
                </div>
            </div>

             <div class="col-lg-8">
                <div class="coursecard">
                    <p class="about">Course Description</p>
                    <p>Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
                        Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
                    </p>
                </div>
            </div>

                <div class="col-lg-8">
                <div class="coursecard instruct">
                    <p class="about">Instructors</p>
                    <div class="row" id="IContainer" runat="server">
                        <img src="../images/user.png" class="image"/>
                        <p class="about aboutname">Moses Edwards</p>
                    </div>
                </div>
            </div>
        </div>
        <%--end of header--%>
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
