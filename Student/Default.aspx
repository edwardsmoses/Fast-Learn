<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Student_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

     <%--begginning of stylesheet files--%>
        <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/AdminLTE.min.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
    <link href="css/sidebar-left.css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="../css/open-sans.css" rel="stylesheet" />
    <link href="../css/stylesheet.css" rel="stylesheet" />


    <%--script files--%>
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="js/sidebar.js"></script>

        <%--jquery ui autocomplete--%>
        <link href="../css/jquery-ui.min.css" rel="stylesheet" />
     <script src="../js/jquery-ui.min.js"></script>
    <script src="../js/Search.js"></script>

    <%--icon part--%>
    <link rel="icon" href="../images/fl.jpg" />
    
</head>
<body style="background-color: #f5f5f5;">
    <form id="form1" runat="server">
    <div>
       <asp:Panel CssClass="alert alert-danger" runat="server" Visible="false" ID="sPanel">
               <a href="#" class="fa fa-times-circle-o close fa-2x" data-dismiss="alert" aria-label="close" title="please close"></a>
               <asp:Label runat="server" ID="lblSuccess" Text="Driest Boy" Font-Bold="true" CssClass="message"></asp:Label>
          </asp:Panel>
 
         <aside class="sidebar-left" id="lsidebar">
             <a href="ProfilePicture.aspx"><asp:Image ImageUrl="../css/img/user.png" CssClass="company-logo" id="sidebarimg" runat="server"/></a>
             <div class="text-center">
             <small class="name" runat="server" id="suserName"></small></div>
		<div class="sidebar-links">
			<a class="link-blue" href="MyCourses.aspx"><i class="fa fa-television"></i>My Courses</a>
			<a class="link-yellow" href="Browse.aspx"><i class="fa fa-institution"></i>Browse Courses</a>
            <a class="link-red" href="Discuss.aspx" title="Chat with your faculty"><i class="fa fa-question-circle"></i>Discuss</a>
            <a class="link-blue" href="Settings.aspx"><i class="fa fa-cogs"></i>Settings</a>
			<a class="link-green" href="#" data-toggle="modal" data-target="#myModal"><i class="fa fa-commenting-o"></i>Feedback</a></div>
	</aside>
                  <div class="main-content" id="maincontent">
         <div class="small-banners">
        <div class="container">
            <div class="top-nav"> 
             <div class="navbar navbar-static-top">
                 <i class="icobar-container pull-left" id="menu-toogle"><span class="icobar"></span><span class="icobar"></span><span class="icobar"></span></i>
                 <img src="../images/logo.png"  runat="server" class="navbar-brand logo"/>
            <div class="navbar-form">
                    <div class="input-group margin-right">
      <span class="input-group-btn"><a class="btn btn-primary" type="button" href="Browse.aspx"><i class="fa fa-stack fa-institution"></i>Catalog</a></span>
      <input type="text" class="form-control formheight formwidth" placeholder="Search courses" id="txtCSearch"/>
                         <span class="input-group-btn"><a class="btn btn-default default formheight" type="button" onclick='location.href="SearchResults.aspx?search=" + txtCSearch.value;'><i class="fa fa-search searchlink"></i></a></span>
    </div>
                    <div class="pull-right">
               <ul class="nav navbar-nav">

                   <li class="dropdown messages-menu">
                       <asp:LinkButton runat="server" ID="btnRead" CssClass="dropdown-toggle transparent" data-toggle="dropdown">
                            <i class="fa fa-envelope-o fa-2x"> <sup><span class="badge source" id="badgeno" runat="server"> 0</span></sup></i>
                       </asp:LinkButton>
                <ul class="dropdown-menu dropdown-menu-right">
                  <li class="header">You have <span id="messageno" runat="server">0</span> messages</li>
                  <li>
                    <!-- inner menu: contains the actual data -->
                    <ul class="menu" runat="server" id="messageBody" style="min-height:20px;">
                    </ul>
                  </li>
                </ul>
              </li>

                     <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle userm" data-toggle="dropdown">
                  <asp:Image ImageUrl="../css/img/user.png" CssClass="user-img" id="navbarimg" runat="server"/>
                  <span class="hidden-xs userlabel" id="userName" runat="server"></span>
                </a>
                <ul class="dropdown-menu dropdown-menu-right">
                  <!-- User image -->
                  <li class="user-header">
                    <asp:Image ImageUrl="../css/img/user.png" CssClass="img-circle header-img" id="navbarimg2" runat="server"/>
                      <p id="fullname" runat="server"></p>
                      <small id="location" runat="server" class="location"></small>
                  </li>
                  <!-- Menu Body -->
                  <li class="user-body">
                    <div class="col-xs-4 text-center">
                      <a href="MyCourses.aspx" class="fonts" title="View your courses"><i class="fa fa-laptop fa-stack"></i>Courses</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="Browse.aspx" class="fonts"><i class="fa fa-stack fa-bank"></i>Browse</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="Settings.aspx" class="fonts"><i class="fa fa-stack fa-cogs"></i>Settings</a>
                    </div>
                  </li>
                  <!-- Menu Footer-->
                  <li class="user-footer" style="">
                        <div class="pull-left">
                      <asp:HyperLink CssClass="btn btn-primary primary flink" runat="server" NavigateUrl="~/Student/ProfilePicture.aspx"><i class="fa fa-stack fa-pencil-square-o"></i>Edit Profile</asp:HyperLink></div>
                        <div class="pull-right">
                            <asp:LinkButton CssClass="btn btn-danger flink" runat="server" ID="btnLogOut" OnClick="btnLogOut_Click" Text="Sign Out"><i class="fa fa-sign-out fa-stack"></i>Sign Out</asp:LinkButton>
                           <%-- <asp:LinkButton CssClass="btn btn-danger flink" runat="server" ID="btnSignOut" OnClick="btnSignOut_Click"><i class="fa fa-sign-out fa-stack"></i>Sign Out</asp:LinkButton></div>--%>
                  </li>
                </ul>
                </ul>
                    </div>
                </div>
            
            </div>
                </div>
        </div>
        </div>

                      <div class="container-fluid">
                          <div class="text-center">
                          <h3><b>Welcome to Fast Learn, <%=HttpContext.Current.User.Identity.Name %></b></h3>
                          <p> Choose topics you are interested in, so you can start learning new courses online.</p></div>
                          <div class="row margin-top">
                              <div class="col-lg-5 col-lg-offset-1">
                                  <div class="row selectcategory selectbrown" onclick='location.href="Courses.aspx?c=Arts and Humanities"'> Arts and Humanities</div>
                                  <div class="row selectcategory selectbrownish" onclick='location.href="Courses.aspx?c=Computer Science"'> Computer Science</div>
                                  <div class="row selectcategory selectyellow" onclick='location.href="Courses.aspx?c=Data Science"'> Data Science</div>
                                  <div class="row selectcategory selectblue" onclick='location.href="Courses.aspx?c=History"'> History</div>
                              </div>
                              <div class="col-lg-5">
                                  <div class="row selectcategory selectyellow" onclick='location.href="Courses.aspx?c=Business Management"'>Business Management</div>
                                  <div class="row selectcategory selectblue" onclick='location.href="Courses.aspx?c=Math and Logic"'>Math and Logic</div>
                                  <div class="row selectcategory selectbrown" onclick='location.href="Courses.aspx?c=Physical Science"'>Physical Science and Engineering</div>
                                   <div class="row selectcategory selectbrownish" onclick='location.href="Courses.aspx?c=Social Science"'>Social Sciences</div>
                              </div>
                          </div>

                          <div class="text-center">
                              <h4>Invite friends to explore Fast Learn</h4>
                              <p class="col-lg-offset-3 col-lg-6">Have a friend who also loves learning? <a href="../SignUp.aspx" class="learning" title="Sign Up on Fast Learn">enter their information on the next screen </a>and get them registered on Fast Learn.</p>
                          </div>

                                 
                          <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" runat="server">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Feedback</h4>
      </div>
      <div class="modal-body" id="msgbody" runat="server">
         <div class="form-group">
                            <label class="contactlabel">What are you thinking, <%=HttpContext.Current.User.Identity.Name %></label>
                          <asp:TextBox class="form-control feedback-input" runat="server" placeholder="write down your message..." ID="contactMessage" TextMode="MultiLine" Rows="4" required="true"/>
                        </div> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <asp:Button CssClass="btn btn-primary" runat="server" ID="btnFeedback"  Text="Send feedback"  OnClick="btnFeedback_Click"></asp:Button>
      </div>
    </div>
  </div>
</div>
                      </div>
                            <footer class="navbar navbar-static-bottom navbar-inverse navbar-bottom footer picture-footer" role="navigation">
        <div class="container">
            <div class="margin-left-little">
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
    </footer>
                  </div>
            </div>

    </form>
</body>
</html>
