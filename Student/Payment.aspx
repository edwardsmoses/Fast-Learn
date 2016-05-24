<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Student_Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fast Learn</title>
<link rel="icon" href="../../images/fl.jpg" />
    
    <%--beginning of css styles--%> 
        <%--stylesheet region--%>
    
        <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
    <link href="../css/open-sans.css" rel="stylesheet" />
    <link href="../css/stylesheet.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/browse.css" rel="stylesheet" />
    <link href="css/header.css" rel="stylesheet" />
    <link href="css/payment.css" rel="stylesheet" />

    <%--script region--%>
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap.min.js"></script>

    <%--jquery ui autocomplete--%>
        <link href="../css/jquery-ui.min.css" rel="stylesheet" />
     <script src="../js/jquery-ui.min.js"></script>
    <script src="../js/Search.js"></script>

</head>
<body style="margin-bottom:120px;">
    <form id="form1" runat="server">
    <div>
    <%--begginning of header--%>
              <div class="coverphoto coverall">
        <div class="container container-comedown" >
            <div class="top-nav"> 
             <div class="navbar navbar-static-top">
              <a href="Default.aspx"><img src="~/images/logo.png"  runat="server" class="navbar-brand logo"/></a>
           
                    <div class="pull-right">
            <ul class="nav navbar-nav">
                   <li><a href="Default.aspx" class="bname username" title="Home" id="username" runat="server"><%=HttpContext.Current.User.Identity.Name %></a></li>
                </ul>
                    </div>
                </div>
            
       </div>
        </div>
    
    </div>

        <div class="container">
            <div class="paymentcontainer">
                <div class="dl-horizontal header">
                    Complete Your Purchase    <i class="fa fa-lock pull-right"></i>              
                </div>
                
                <div class="productsummary">
                    <p class="order">Your order:</p>
                    <div class="cartitem">
                        <img src="" runat="server" id="cartimage" class="pull-left image"/>
                        <h1 class="coursename"><%=Request.QueryString["course"] %></h1>
                        <p id="cartprice" runat="server" class="pull-right cartprice"></p>
                    </div>
                </div>
                <div class="creditcard">
                    <div class="headerpanel">
                        <%--<i class="fa fa-paypal pull-right"></i><i class="fa fa-credit-card-alt pull-right"></i>--%>
                        <h3 class="coursename">Credit Card Information <img src="../images/payment.png" class="pull-right"/></h3></div>
                    <div class="creditcardbody">
              <asp:Panel CssClass="alert alert-success fade in" runat="server" Visible="False" ID="sPanel">
               <a href="#" class="close fa fa-times-circle-o" data-dismiss="alert" aria-label="close"></a>
               <asp:Label runat="server" ID="lblSuccess" Text="" Font-Bold="true"></asp:Label>
          </asp:Panel>
                        <div class="rows">
                        <div class="input-group">
                            <label>Name on card</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtCreditCardName"></asp:RequiredFieldValidator>
                             <asp:TextBox runat="server" type="text" class="form-control textbox" placeholder="John Doe" aria-describedby="basic-addon1" ID="txtCreditCardName" AutoCompleteType="None"/>
                        </div>
                            </div>
                        <div class="rows">
                            <div class="input-group">
                            <label>Card Number</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtCreditCardNumber"></asp:RequiredFieldValidator>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage= "<br />sorry, card number must be between 11 and 14" ValidationExpression="^[\s\S]{11,14}$" ControlToValidate="txtCreditCardNumber" ForeColor="Red" Font-Bold="true" Display="Dynamic"></asp:RegularExpressionValidator>
                             <asp:TextBox runat="server" class="form-control textbox" placeholder="credit card number" aria-describedby="basic-addon1" ID="txtCreditCardNumber" MaxLength="14" TextMode="Number" AutoCompleteType="None"/>
                        </div>
                            </div>
                        <div class="rows">
                            <div class="input-group">
                            <label>CVV</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="txtCVV"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage= "<br />cvv must not be less than 4" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{4,5}$" ControlToValidate="txtCVV" ForeColor="Red" Font-Bold="true" Display="Dynamic"></asp:RegularExpressionValidator>
                             <asp:TextBox runat="server"  class="form-control textbox" placeholder="CVV" aria-describedby="basic-addon1" ID="txtCVV" MaxLength="4" TextMode="Number" AutoCompleteType="None"/>
                        </div>
                            </div>
                        
                        <div class="rows">
                             <asp:CheckBox runat="server" ID="lcheckbox" Text="Remember my card information" CssClass="checkbox-inline lcheckbox filled-in"/>
                        </div>
                            </div>
                        </div>
                <div class="text-center">
             <asp:Button runat="server" ID="btnPay" Text="Pay Now" CssClass="btn btn-primary enroll text-center" OnClick="btnPay_Click" UseSubmitBehavior="true"/></div>
                <p class="p">By confirming this purchase, I agree to the <a class="a">Terms of Use</a>, <a class="a">Refund Policy</a> and <a class="a">Privacy Policy</a>.</p>
                    </div>
                </div>
        </div>
           <div class="navbar navbar-default footers" role="navigation">
        <div class="container">
            <div class="row">
                <img src="../../images/logo.png" class="navbar-brand"/>
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
    </form>
</body>
</html>
