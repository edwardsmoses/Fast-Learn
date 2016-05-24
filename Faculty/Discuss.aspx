<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Discuss.aspx.cs" Inherits="Faculty_Discuss" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title><%= HttpContext.Current.User.Identity.Name + " | Discuss" %></title>

<%--icon section--%>
    <link rel="icon" href="../images/fl.jpg"/>

    <%--stylesheet section--%>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
    <link href="../css/open-sans.css" rel="stylesheet" />
    <link href="../css/stylesheet.css" rel="stylesheet" />
    <link href="css/m.css" rel="stylesheet" />
    <link href="css/discuss.css" rel="stylesheet" />


    <%--javascript section--%>
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="js/names.js"></script>

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
    
        <div class="containers">
        
            <div class="col-lg-push-1 col-lg-5">
                <div class="containerpanel">
                        <div class="row">
                            <div class="col-lg-3">
                 <div class="sideheader">
                    <img src="../images/user.png" id="myimage" runat="server"/>
                    <p><%=HttpContext.Current.User.Identity.Name %></p>
                </div>
                                </div>
                            <div class="col-lg-9">
                 <div class="messageheader">
                    <img src="../images/user.png" id="usernamepic" runat="server"/>
                    <p id="usernames" runat="server">Edwards Moses</p>
                     <small id="lastseen" runat="server">last seen today at 5.34pm</small>
                </div>
                                </div>
            </div>
            <div class="col-lg-3 collg3">
                <div class="namelist" runat="server" id="nameList">
                    <div class="names"><img src="../images/user.png" /><p>Edwards Moses</p></div>
                    <div class="names"><img src="../images/user.png" /><p>Edwards Moses</p></div>
                    <div class="names"><img src="../images/user.png" /><p>Edwards Moses</p></div>
                    <div class="names"><img src="../images/user.png" /><p>Edwards Moses</p></div>
                    <div class="names"><img src="../images/user.png" /><p>Edwards Moses</p></div>
                </div>
                </div>
                <div class="col-lg-9">
                    
                    <div class="messageList" id="msgList" runat="server">
                        <div class="msg">
                        <div class="messages messages-in">
                            <p>Edwards, welcome to Fast</p>
                            <p class="time"><i class="fa fa-clock-o"></i>   3:00pm</p>
                        </div>
                            </div>
                        <div class="msg">
                        <div class="messages messages-out">
                            <p>Edwards, welcome to fast learn, and behave with your sense here, we aint playing, we are godamm serious.</p>
                            <p class="time"><i class="fa fa-clock-o"></i>   5:00pm</p>
                        </div>
                            </div>
                        </div>

                    <div class="messagefooter">
                       <div class="input-group">
                    <asp:TextBox runat="server" id="txtMessage" CssClass="form-control textbox" placeholder="Type a message..." AutoCompleteType="Disabled" required="true"></asp:TextBox>
                    <div class="input-group-btn">
                      <asp:LinkButton CssClass="btn btn-primary" Title="Send message" runat="server" ID="btnSend" OnClick="btnSend_Click"><i class="fa fa-send-o fa-2x"></i></asp:LinkButton>
                    </div>
                  </div></div>
                        <!-- /.panel-body -->
                    </div>
</div>
                </div></div>
                
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
    </form>
</body>
</html>
