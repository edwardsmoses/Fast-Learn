<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="Faculty_Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><%=HttpContext.Current.User.Identity.Name + " | Profile Information" %></title>

    <%--icon on the title bar--%>
    <link rel="icon" href="../images/fl.jpg"/>

    <%--stylesheet region--%>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
    <link href="../css/open-sans.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
    <link href="../css/stylesheet.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />

    <%--script region--%>
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
       <div class="small-banner">
        <div class="container">
           
                <img src="../images/logo.png" class="navbar-brand logo top-nav"/>
            <div class="top-nav"> 
             <div class="navbar navbar-static-top">
            <ul class="nav navbar-nav  nav-pullright margin-left">
                <li><a href="Default.aspx">HOME</a></li>
                </ul>
                <div class="pull-right">
               <ul class="nav navbar-nav">
                    <li><a href="Default.aspx" class="name active" id="fullname" runat="server"> <%=HttpContext.Current.User.Identity.Name %></a></li>
                </ul>
                    </div>
            </div>
                </div>
        </div>
        </div>
            <%--end of header container--%>

           <div class="container">
            <h1 class="page-header">Profile Picture</h1>

                <div class="col-lg-offset-3 col-lg-5 forms">
                    <div class="row form-row">
                        <label class="form-label"><i class="fa fa-stack fa-image fa-lg"></i>Profile Pic</label>
                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="margin-bottom"/>
                    
                    <div class="row form-row">
                        <asp:Button runat="server" CssClass="btn btn-danger col-lg-12 btn-login" ID="btnProfile" Text="Change Profile Picture" OnClick="btnProfile_Click"/>
                    </div>
                    <asp:Panel CssClass="alert alert-success fade in" runat="server" Visible="False" ID="sPanel">
               <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
               <asp:Label runat="server" ID="lblSuccess" Text="" Font-Bold="true"></asp:Label>
          </asp:Panel>
            </div>
                
                </div>
            </div>

        <%--beginning of footer--%>
             <footer class="navbar navbar-static-bottom navbar-inverse navbar-bottom footered picture-footer" role="navigation">
        <div class="container">
            <div class="row">
                <img src="../images/logo.png" class="navbar-brand"/>
            
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
    
    </div>
    </form>
</body>
</html>
