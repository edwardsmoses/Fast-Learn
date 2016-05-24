<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Materials.aspx.cs" Inherits="Faculty_Materials" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title><%=HttpContext.Current.User.Identity.Name + " | Course Materials" %></title>

        <%--icon section--%>
    <link rel="icon" href="../images/fl.jpg"/>

    <%--stylesheet section--%>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
    <link href="../css/open-sans.css" rel="stylesheet" />
    <link href="../css/stylesheet.css" rel="stylesheet" />
    <link href="css/m.css" rel="stylesheet" />

    <%--javascript section--%>
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
       <div class="banner">
          <div class="container">
            <div class="top-nav"> 
             <div class="navbar navbar-static-top">
        
                 <img src="../images/logo.png"  runat="server" class="navbar-brand logo"/>
           <div class="navbar-form">
                </div>
                 <ul class="pull-right nav">
             <li class="name"><a  href="Default.aspx" class="name"><%=HttpContext.Current.User.Identity.Name %> </a></li>
                     </ul>
            </div>
                </div>
        </div>
        </div>
        <div class="container containers">
            <div class="text-center">
            <div class="addcourse"><h1>Course Materials - <%=Request.QueryString["course"] %></h1></div></div>

             <div class="col-lg-5 col-lg-offset-4 col-lg-push-0">
                 <asp:Panel CssClass="alert alert-success fade in" runat="server" Visible="False" ID="sPanel">
               <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
               <asp:Label runat="server" ID="lblSuccess" Text="" Font-Bold="true"></asp:Label>
          </asp:Panel>
            <div class="row rows">
                    <div class="input-group">
                        <label>Material Title</label>
                        <asp:TextBox runat="server" ID="txtTitle" CssClass="form-control" required="true"></asp:TextBox>
                    </div>
                </div>

            <div class="row rows">
                    <div class="input-group">
                        <label>Material Description</label>
                        <asp:TextBox runat="server" ID="txtDesc" CssClass="form-control" required="true" TextMode="MultiLine" Rows="5"></asp:TextBox>
                    </div>
                </div>

                 <div class="row rows">
                     <label>Material Attachment(pdf, word, video)</label>
                 <asp:FileUpload ID="FileUpload1" runat="server" /></div>

            <div class="row rows">
                    <div class="input-group">
                        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-flat btn-danger" Text="Save" OnClick="btnSave_Click" UseSubmitBehavior="true"/>
                    </div>
                </div>
        </div>
            </div>

             <div class="navbar navbar-default navbar-inverse footerss" role="navigation">
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
