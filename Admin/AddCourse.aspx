<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCourse.aspx.cs" Inherits="Admin_AddCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title><%=HttpContext.Current.User.Identity.Name + " - Add Courses"%></title>

    <%--icon section--%>
    <link rel="icon" href="../images/fl.jpg"/>

    <%--stylesheet section--%>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" />
    <link href="../css/open-sans.css" rel="stylesheet" />
    <link href="../css/stylesheet.css" rel="stylesheet" />
    <link href="css/addcourse.css" rel="stylesheet" />

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
                    <div class="input-group margin-right">
      <input type="text" class="form-control textbox" placeholder="Search information" id="txtSearch"/>
                         <span class="input-group-btn"><a class="btn btn-primary" onclick='location.href'><i class="fa fa-search searchlink"></i></a></span>
    </div>
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
            <div class="addcourse"><h1>Add Course</h1></div></div>
            <div class="col-lg-push-4 col-lg-5 courses">
                 <asp:Panel CssClass="alert alert-success fade in" runat="server" Visible="False" ID="sPanel">
               <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
               <asp:Label runat="server" ID="lblSuccess" Text="" Font-Bold="true"></asp:Label>
          </asp:Panel>
                    <div class="row rows">
                        <div class="input-group">
                            <label>Select Category</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="drpCategoryList"></asp:RequiredFieldValidator>
                             <asp:DropDownList runat="server" type="text" class="form-control"  ID="drpCategoryList">
                                 <asp:ListItem>Arts and Humanities</asp:ListItem>
                                 <asp:ListItem>Business Management</asp:ListItem>
                                 <asp:ListItem Selected="True">Computer Science</asp:ListItem>
                                 <asp:ListItem>Math and Logic</asp:ListItem>
                                 <asp:ListItem>Data Science</asp:ListItem>
                                 <asp:ListItem>Physical Science</asp:ListItem>
                                 <asp:ListItem>History</asp:ListItem>
                                 <asp:ListItem>Social Science</asp:ListItem>
                             </asp:DropDownList>
                        </div>
                            </div>
                <div class="row rows">
                    <div class="input-group">
                        <label>Enter Course Name</label>
                        <asp:TextBox runat="server" ID="txtName" CssClass="form-control" placeholder="Learn Web Development" required="true"></asp:TextBox>
                    </div>
                </div>
                  <div class="row rows">
                    <div class="input-group">
                        <label>Enter Course Price</label>
                        <asp:TextBox runat="server" ID="txtPrice" CssClass="form-control" placeholder="₦12,500" required="true" type="number"></asp:TextBox>
                    </div>
                </div>

                <div class="row rows">
                    <div class="input-group">
                        <label>Select Faculty Username</label>
                        <asp:DropDownList runat="server" type="text" class="form-control"  ID="drpFaculty" required="true"></asp:DropDownList>
                    </div>
                </div>

                  <div class="row rows">
                    <div class="input-group">
                        <label>Select Course Duration</label>
                          <asp:DropDownList runat="server" type="text" class="form-control"  ID="drpDuration">
                                 <asp:ListItem>2 weeks</asp:ListItem>
                                 <asp:ListItem  Selected="True">3 weeks</asp:ListItem>
                                 <asp:ListItem>4 weeks</asp:ListItem>
                                 <asp:ListItem>5 weeks</asp:ListItem>
                                 <asp:ListItem>6 weeks</asp:ListItem>
                                 <asp:ListItem>8 weeks</asp:ListItem>
                                 <asp:ListItem>9 weeks</asp:ListItem>
                             </asp:DropDownList>
                    </div>
                </div>
                  <div class="row rows">
                    <div class="input-group">
                        <label>Enter Course Description</label>
                        <asp:TextBox runat="server" ID="txtDesc" CssClass="form-control" TextMode="MultiLine" Rows="5" required="true" placeholder="The Internet is currently undergoing the greatest revolution ever. Millions are joining to help develop the internet. Come join us to learn advancing technogies in Web Development."></asp:TextBox>
                    </div>
                </div>
                   <div class="row rows">
                    <div class="input-group">
                        <label><i class="fa fa-calendar fa-stack"></i>Select Starting Date</label>
                        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                    </div>
                </div>
                  <div class="row rows">
                    <div class="input-group">
                        <label><i class="fa fa-stack fa-picture-o"></i>Browse Course Picture</label>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </div>
                </div>
                <div class="row rows col-lg-push-4 col-lg-1">
                    <asp:Button runat="server" ID="btnSave" CssClass="btn btn-default" Text="Save" OnClick="btnSave_Click"/>
                </div>
                </div></div>

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
