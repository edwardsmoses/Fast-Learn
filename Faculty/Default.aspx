<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Faculty_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><%=HttpContext.Current.User.Identity.Name + " | Fast Learn" %></title>

        <%--begginning of stylesheet files--%>
        <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/AdminLTE.min.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
    <link href="css/sidebar-left.css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="../css/open-sans.css" rel="stylesheet" />
    <link href="../css/stylesheet.css" rel="stylesheet" />
    <link href="css/curicculum.css" rel="stylesheet" />

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
       <asp:Panel CssClass="alert alert-danger alertdiv" runat="server" Visible="false" ID="sPanel">
               <a href="#" class="fa fa-times-circle-o close fa-2x" data-dismiss="alert" aria-label="close" title="please close"></a>
               <asp:Label runat="server" ID="lblSuccess" Text="Driest Boy" Font-Bold="true" CssClass="message"></asp:Label>
          </asp:Panel>
 
         <aside class="sidebar-left" id="lsidebar">
             <a href="Profile.aspx"><asp:Image ImageUrl="../images/user.png" CssClass="company-logo" id="sidebarimg" runat="server"/></a>
             <div class="text-center">
             <small class="name" runat="server" id="suserName"><%=HttpContext.Current.User.Identity.Name %></small></div>
		<div class="sidebar-links">
			<a class="link-yellow" href="Discuss.aspx"><i class="fa fa-comments-o"></i>Discuss</a>
            <a class="link-blue" href="Settings.aspx"><i class="fa fa-cogs"></i>Settings</a>
             <asp:LinkButton runat="server" CssClass="link-red" ID="btnSignOut" OnClick="btnSignOut_Click"><i class="fa fa-sign-out"></i>Sign Out</asp:LinkButton>
		</div>
            
	</aside>

         <div class="main-content" id="maincontent">
         <div class="small-banners">
        <div class="container">
            <div class="top-nav"> 
             <div class="navbar navbar-static-top">
                
                 <img src="../images/logo.png"  runat="server" class="navbar-brand logo"/>
            <div class="navbar-form">
                <i class="fa fa-navicon fa-2x" id="menu-toogle"></i>
                    <div class="pull-right col-lg-pull-1 col-lg-4">
               <ul class="nav navbar-nav">

                   <li class="dropdown messages-menu">
                       <asp:LinkButton runat="server" ID="btnRead" CssClass="dropdown-toggle transparent" data-toggle="dropdown">
                            <i class="fa  fa-envelope-o fa-2x"> <sup><span class="badge source" id="badgeno" runat="server"> 4</span></sup></i>
                       </asp:LinkButton>
                <ul class="dropdown-menu dropdown-menu-right">
                  <li class="header">You have <span id="messageno" runat="server">4</span> messages</li>
                  <li>
                    <!-- inner menu: contains the actual data -->
                    <ul class="menu" runat="server" id="messageBody" style="min-height:20px;">
                    </ul>
                  </li>
                </ul>
              </li>


                     <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle userm" data-toggle="dropdown">
                  <asp:Image ImageUrl="../images/user.png" CssClass="user-img" id="navbarimg" runat="server"/>
                  <span class="hidden-xs userlabel" id="userName" runat="server"><%=HttpContext.Current.User.Identity.Name %></span>
                </a>
                <ul class="dropdown-menu" style="width:300px;">
                  <!-- User image -->
                  <li class="user-header">
                    <asp:Image ImageUrl="../images/user.png" CssClass="img-circle header-img" id="navbarimg2" runat="server"/>
                      <p id="fullname" runat="server"></p>
                      <small id="location" runat="server" class="location"></small>
                  </li>
                  
                  <!-- Menu Footer-->
                  <li class="user-footer">
                      <div class="pull-left"><asp:HyperLink CssClass="btn  btnblue flink" runat="server" NavigateUrl="Profile.aspx"><i class="fa fa-stack fa-pencil"></i>Edit Profile</asp:HyperLink></div>
                        <div class="pull-right"><asp:LinkButton CssClass="btn btn-success flink" runat="server" ID="btnSign" OnClick="btnSignOut_Click"><i class="fa fa-sign-out fa-stack"></i>Sign Out</asp:LinkButton></div>
                  </li>
                </ul> 
                    </li>
                         
                </ul>
                    </div>
                </div>
            
            </div>
                </div>
        </div>
        </div>

                      <div class="containers container-fluid">
                          <div class="row">
                <div class="col-lg-3 col-md-6">
                    
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-5x fa-users"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge" id="studentcount" runat="server">26</div>
                                    <div>Students</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-5x fa-bank"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge" id="coursecount" runat="server">12</div>
                                    <div>Courses</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-5x fa-question-circle"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge" id="queryCount" runat="server">23</div>
                                    <div>Queries</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-5x fa-envelope-o"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge" id="messageCount" runat="server">13</div>
                                    <div>Messages</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


                       <div class="col-lg-10 col-lg-offset-0 fcoursecontainer">
                           <h2>My Courses</h2>
                           <div id="fcoursebody" runat="server">
                          </div>
                       </div>



                          </div>
    </div>
                    <div class="navbar navbar-default navbar-inverse footers" role="navigation">
        <div class="container">
            <div class="row">
                <img src="../images/logo.png" class="navbar-brand"/>
                </div>
            <div class="row">
                                   <ul class="nav navbar-nav navbar-left">
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
            </div>
    </div>
    </form>
</body>
</html>
