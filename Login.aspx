<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign In | Fast Learn</title>

    <%--icon file--%>
    <link rel="icon" href="images/fl.jpg" />

    <%--css files--%>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />


</head>
<body>
    <form id="form1" runat="server">
    <div>
    <%--banner section--%>
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

        <%--login section--%>
                <div class="container">
            <h2 class="page-header">Sign In</h2>
        </div>
         <div class="registerpanel">Don't have an account? <a href="SignUp.aspx">Sign Up</a></div>
    <div class="col-lg-offset-3 col-lg-5 forms">
          <div class="row form-row">
              <asp:Panel CssClass="alert alert-success fade in" runat="server" Visible="False" ID="sPanel">
               <a href="#" class="close fa fa-times-circle-o fa-2x" data-dismiss="alert" aria-label="close"></a>
               <asp:Label runat="server" ID="lblSuccess" Text="" Font-Bold="true"></asp:Label>
          </asp:Panel>
                        <label class="form-label"><i class="fa fa-stack fa-user fa-lg"></i>User Name</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtUserName"  SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox runat="server" type="text" class="form-control textbox zeroradius" placeholder="johndoe" aria-describedby="basic-addon1" ID="txtUserName" AutoCompleteType="Disabled"/>
                        </div>
                    <div class="row form-row">
                        <label class="form-label"><i class="fa fa-stack fa-lg fa-key"></i>Password</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtPwd"  SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox runat="server" class="form-control textbox zeroradius"  aria-describedby="basic-addon1" ID="txtPwd" TextMode="Password"/>
                        </div>
                    <div class="row">
                        <a href="ForgotPassword.aspx" class="textbox pull-right forgotpwd">Forgot Password?</a>
                    </div>
                    <div class="row form-row">
            <asp:CheckBox runat="server" ID="lcheckbox" Text="Remember me" CssClass="checkbox-inline lcheckbox filled-in"/>
                        </div>
                    <div class="row form-row">
                        <asp:Button runat="server" CssClass="btn btn-danger btn-login col-lg-12 zeroradius" ID="btnLogin" Text="Sign In" UseSubmitBehavior="true" OnClick="btnLogin_Click"/>
                    </div>

    </div>

                            <div class="navbar navbar-default navbar-inverse small-footer" role="navigation">
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
