<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Contact Us | Fast Learn</title>

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
      <div class="small-banner">
        <div class="container">
           
                <img src="images/logo.png" class="navbar-brand logo top-nav"/>
            <div class="top-nav"> 
             <div class="navbar navbar-static-top">
            <ul class="nav navbar-nav  nav-pullright">
                <li><a href="Default.aspx">HOME</a></li>
                <li><a href="Student/Browse.aspx">COURSES</a></li>
                <li><a href="AboutUs.aspx">ABOUT US</a></li>
                <li><a href="#" class="active">CONTACT US</a></li>
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
            <div class="row">
                  <div class="col-md-8 col-md-offset-2">
                    <div class="center">
                        <h2><span class="light-text">FEEL FREE TO </span><strong class="bold-text">CONTACT US</strong></h2>
                        <div class="line"> </div>
                        <div class="clearfix"></div>
                        <br />
                        <small><em>Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</em></small>            
           <asp:Panel CssClass="alert alert-success fade in" runat="server" Visible="False" ID="sPanel">
               <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
               <asp:Label runat="server" ID="lblSuccess" Text="" Font-Bold="true"></asp:Label>
          </asp:Panel>
                         <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="contactlabel">Email address</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="contactEmail"  SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:TextBox type="email" class="form-control feedback-input" id="contactEmail" placeholder="Enter email" runat="server"/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="contactlabel">Name</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="contactName" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:TextBox type="text" class="form-control feedback-input" id="contactName" placeholder="Enter name" runat="server"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="contactlabel">Message</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="contactMessage" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                          <asp:TextBox class="form-control feedback-input" runat="server" placeholder="Enter message" ID="contactMessage" TextMode="MultiLine" />
                        </div> 
                        
                        <asp:Button runat="server" ID="btnfeedback" class="btn btn-default" Text="Send Message" OnClick="btnfeedback_Click"></asp:Button>
                        <br />
                        <br />
                        <br />
                        
                    </div>

                    </div>
            </div>
            </div>
                <%--beggining of footer section--%>
    
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

    </div>
    </form>
</body>
</html>
