<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Settings.aspx.cs" Inherits="Student_Settings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><%=HttpContext.Current.User.Identity.Name + " | Settings" %></title>

     <%--begginning of stylesheet files--%>
        <link href="../css/bootstrap.min.css" rel="stylesheet" />
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
<body>
    <form id="form1" runat="server">
    <div>
       <div class="small-banners">
        <div class="container">
            <div class="top-nav"> 
             <div class="navbar navbar-static-top">
                 <img src="../images/logo.png"  runat="server" class="navbar-brand logo"/>
            <div class="navbar-form">
                    <div class="pull-right">
               <ul class="navbar-nav navbar-right nav">
                            <li><a href="Default.aspx">HOME</a></li>
                <li><a href="Browse.aspx">COURSES</a></li>
                <li><a href="ContactUs.aspx" class="active">SETTINGS</a></li>
                        </ul>
                    </div>
                </div>
            
            </div>
                </div>
        </div>
        </div>

        <div class="container">
            <div class="container">
            <h1 class="page-header arial">Change Password</h1>
        </div>
             <div class="col-lg-offset-3 col-lg-5 forms">
          <div class="row form-row">
              <asp:Panel CssClass="alert alert-success fade in" runat="server" Visible="False" ID="sPanel">
               <a href="#" class="close fa fa-times-circle-o fa-2x nounderline" data-dismiss="alert" aria-label="close"></a>
               <asp:Label runat="server" ID="lblSuccess" Text="" Font-Bold="true"></asp:Label>
          </asp:Panel>
                        <label class="form-label"><i class="fa fa-stack fa-lock fa-lg"></i>Current Password</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtPwd"  SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox runat="server" type="text" class="form-control textbox zeroradius"  aria-describedby="basic-addon1" ID="txtPwd" AutoCompleteType="Disabled" TextMode="Password"/>
                        </div>
                    <div class="row form-row">
                        <label class="form-label"><i class="fa fa-stack fa-lg fa-key"></i>New Password</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtRPwd"  SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:TextBox runat="server" class="form-control textbox zeroradius"  aria-describedby="basic-addon1" ID="txtRPwd" TextMode="Password"/>
                        </div>

                 <div class="row form-row">
                        <label class="form-label"><i class="fa fa-stack fa-lg fa-keyboard-o"></i>Retype Password</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtPwd2"  SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                     <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="<b>Passwords do not match</b>" ControlToCompare="txtRPwd" ControlToValidate="txtPwd2" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
            <asp:TextBox runat="server" class="form-control textbox zeroradius"  aria-describedby="basic-addon1" ID="txtPwd2" TextMode="Password"/>
                        </div>
                 <div class="clearfix"></div>
                 <div class="clearfix"></div>
                    <div class="row form-row">
                        <asp:Button runat="server" CssClass="btn btn-danger btn-login col-lg-12 zeroradius" ID="btnPwd" Text="Change Password" UseSubmitBehavior="true" OnClick="btnPwd_Click"/>
                    </div>

    </div>
            </div>
                            <div class="navbar navbar-default navbar-inverse small-footer nonedefault" role="navigation">
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
    </div>
    </form>
</body>
</html>
