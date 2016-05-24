<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignIN" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Sign Up | Fast Learn</title>

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
                            <li><a href="Login.aspx" class="btn btnblue">SIGN IN</a></li>
                        </ul>
                    </div>
                </div>
               
            </div>
       
        </div>

        <%--login section--%>
                <div class="container">
            <h2 class="page-header">Create a Free Account</h2>
        </div>
         <div class="registerpanel">Already have an account? <a href="login.aspx">Sign In</a></div>
     <div class="col-lg-offset-3 col-lg-5 forms">
          <asp:Panel CssClass="alert alert-success fade in" runat="server" Visible="False" ID="sPanel">
               <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
               <asp:Label runat="server" ID="lblSuccess" Text="" Font-Bold="true"></asp:Label>
          </asp:Panel>
                    <div class="row form-row">
                        <label class="form-label">First Name</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtFName"  SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox runat="server" type="text" class="form-control textbox zeroradius" placeholder="John" aria-describedby="basic-addon1" ID="txtFName"/>
                        </div>
                    <div class="row form-row">
                        <label class="form-label">Last Name</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtLName"  SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox runat="server" type="text" class="form-control textbox zeroradius" placeholder="Doe" aria-describedby="basic-addon1" ID="txtLName"/>
                        </div>
                     <div class="row form-row">
                        <label class="form-label">User Name</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txtUserName"  SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox runat="server" type="text" class="form-control textbox zeroradius" placeholder="johndoe" aria-describedby="basic-addon1" ID="txtUserName"/>
                        </div>

                    <div class="row form-row">
                        <label class="form-label">Email Address</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtEmail"  SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox runat="server" type="email" class="form-control textbox zeroradius" placeholder="johndoe@fastlearn.com" aria-describedby="basic-addon1" ID="txtEmail"/>
                        </div>


                    <div class="row form-row">
                        <label class="form-label">Choose a password (min. 8 characters)</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtPwd"  SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage= "<br />Password length must be between 8 - 12 characters" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{8,12}$" ControlToValidate="txtPwd" ForeColor="Red" Font-Bold="true" Display="Dynamic"></asp:RegularExpressionValidator>
            <asp:TextBox runat="server" class="form-control textbox zeroradius"  aria-describedby="basic-addon1" ID="txtPwd" TextMode="Password"/>
                        </div>

                    <div class="row form-row">
                        <asp:DropDownList runat="server" ID="drquestion" CssClass="form-label dropdown-register" >
                            <asp:ListItem>What is your mother maiden name?</asp:ListItem>
                            <asp:ListItem>What is your pet name?</asp:ListItem>
                            <asp:ListItem>What is your uncle name?</asp:ListItem>
                            <asp:ListItem>What is your best friend name?</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtAnswer"  SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox runat="server" class="form-control textbox"  aria-describedby="basic-addon1" ID="txtAnswer"/>
                        </div>

                  

                    <div class="row">
                        <label class="form-label" style="font-weight:normal;">Please make sure your email address is correct so we can get in touch with you.</label>
                        </div>
                    <div class="row form-row">
                        <asp:Button runat="server" CssClass="btn btn-danger col-lg-12 btn-login zeroradius" ID="btnRegister" Text="Register"  UseSubmitBehavior="true" OnClick="btnRegister_Click"/>
                    </div>

                    <div class="row">
                    <label class="form-label information">By clicking Register I agree to Fast Learn's Terms & Conditions and Privacy Policy, and I agree to abide by the Code of Conduct.</label>
                        </div>
            </div>
    </div>


           <div class="navbar navbar-default navbar-inverse plenty-footer" role="navigation">
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
    </div>
    </form>
</body>
</html>
