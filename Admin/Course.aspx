<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Course.aspx.cs" Inherits="Admin_Course" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Add Course
            <small>Fast Learn</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="Index.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Add Course</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
           <div class="col-md-11">
              <!-- Horizontal Form -->
              <div class="box box-info">
                <div class="box-header with-border">
                  <h3 class="box-title">New Course</h3>
                </div><!-- /.box-header -->
                <!-- form start -->
                     <div class="form-horizontal">
                  <div class="box-body">
                      <asp:Panel CssClass="alert alert-success fade in" runat="server" Visible="False" ID="sPanel">
               <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
               <asp:Label runat="server" ID="lblSuccess" Text="" Font-Bold="true"></asp:Label>
          </asp:Panel>
                    <div class="form-group">
                      <label for="txtFName" class="col-sm-2 control-label">Select Category</label>
                      <div class="col-sm-10">
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
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">Course Name</label>
                      <div class="col-sm-10">
                        <asp:TextBox runat="server" ID="txtName" CssClass="form-control" placeholder="Learn Web Development" required="true"></asp:TextBox>
                      </div>
                    </div>

                          <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">Select Faculty</label>
                      <div class="col-sm-10">
                         <asp:DropDownList runat="server" type="text" class="form-control"  ID="drpFaculty" required="true"></asp:DropDownList>
                      </div>
                    </div>

                         <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">Course Price</label>
                      <div class="col-sm-10">
                           <asp:TextBox runat="server" ID="txtPrice" CssClass="form-control" placeholder="₦12,500" required="true" type="number"></asp:TextBox>
                      </div>
                    </div>

                               <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">Course Duration</label>
                      <div class="col-sm-10">
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
                            <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">Course Description</label>
                      <div class="col-sm-10">
                           <asp:TextBox runat="server" ID="txtDesc" CssClass="form-control" TextMode="MultiLine" Rows="5" required="true" placeholder="The Internet is currently undergoing the greatest revolution ever. Millions are joining to help develop the internet. Come join us to learn advancing technogies in Web Development."></asp:TextBox>
                      </div>
                    </div>
                               <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">Course Picture</label>
                      <div class="col-sm-10">
                               <asp:FileUpload ID="FileUpload1" runat="server" />
                      </div>
                    </div>
                              <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">Starting Date</label>
                      <div class="col-sm-10">
                        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                      </div>
                    </div>
                      </div>
                  </div><!-- /.box-body -->
                  <div class="box-footer">
                    <button type="submit" class="btn btn-default">Cancel</button>
                    <asp:Button runat="server" ID="btnAdd" class="btn btn-info pull-right" Text="Submit" OnClick="btnAdd_Click"></asp:Button>
                  </div><!-- /.box-footer -->
              </div><!-- /.box -->
              <!-- general form elements disabled -->
                </div><!-- /.box-body -->
                </div>
            </section>
              </div><!-- /.box -->
</asp:Content>

