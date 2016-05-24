<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Forgot Password | Fast Learn</title>

     <%--StyleSheet Section--%>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/open-sans.css" rel="stylesheet" />
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
        <%--beggining of header--%>
      <div class="small-banner">
        <div class="container">
           
                <img src="images/logo.png" class="navbar-brand logo top-nav"/>
            <div class="top-nav"> 
             <div class="navbar navbar-static-top">
            <ul class="nav navbar-nav  nav-pullright">
                <li><a href="Default.aspx">HOME</a></li>
                <li><a href="Student/Browse.aspx">COURSES</a></li>
                <li><a href="AboutUs.aspx">ABOUT US</a></li>
                <li><a href="ContactUs.aspx">CONTACT US</a></li>
                </ul>
                <div class="pull-right">
               <ul class="nav navbar-nav">
                    <li><a href="Login.aspx" class="active">LOG IN</a></li>
                    <li><a href="SignUp.aspx">SIGN UP</a></li>
                </ul>
                    </div>
            </div>
                </div>
        </div>
        </div>

        <div class="container">
            <h2 class="page-header">Forgot Password</h2>
        </div>
         <div class="registerpanel">Don't have an account? <a href="SignUp.aspx">Register</a></div>
    
             <div class="col-lg-offset-3 col-lg-5 forms">

                    <div class="row form-row">
                        <label class="form-label">User Name</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtUserName"  SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox runat="server" type="text" class="form-control textbox" placeholder="johndoe" aria-describedby="basic-addon1" ID="txtUserName"/>
                        </div>

                    <div class="row form-row">
                        <label class="form-label" runat="server" id="lblquestion">Security Answer</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtAnswer"  SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox runat="server" type="text" class="form-control textbox" placeholder="" aria-describedby="basic-addon1" ID="txtAnswer"/>
                        </div>
                    <div class="row form-row">
                        <label class="form-label">New Password</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtPwd"  SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage= "<br />Password length must be between 8 - 12 characters" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{8,12}$" ControlToValidate="txtPwd" ForeColor="Red" Font-Bold="true" Display="Dynamic"></asp:RegularExpressionValidator>
            <asp:TextBox runat="server" class="form-control textbox"  aria-describedby="basic-addon1" ID="txtPwd" TextMode="Password"/>
                        </div>
                    <div class="row form-row">
                        <asp:Button runat="server" CssClass="btn btn-danger col-lg-12 btn-login" ID="btnChangePwd" Text="Reset Password" OnClick="btnChangePwd_Click"/>
                    </div>
                    <asp:Panel CssClass="alert alert-success fade in" runat="server" Visible="False" ID="sPanel">
               <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
               <asp:Label runat="server" ID="lblSuccess" Text="" Font-Bold="true"></asp:Label>
          </asp:Panel>
            </div>
    </div>
             <footer class="navbar navbar-static-bottom navbar-inverse navbar-bottom footer footersd" role="navigation">
        <div class="container">
            <div class="row">
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
