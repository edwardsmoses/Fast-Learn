<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="AddFaculty.aspx.cs" Inherits="Admin_AddFaculty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Add Faculty
            <small>Fast Learn</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="Index.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Add Faculty</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
           <div class="col-md-12">
              <!-- Horizontal Form -->
              <div class="box box-info">
                <div class="box-header with-border">
                  <h3 class="box-title">New Faculty</h3>
                </div><!-- /.box-header -->
                <!-- form start -->
                     <div class="form-horizontal">
                  <div class="box-body">
                      <asp:Panel CssClass="alert alert-success fade in" runat="server" Visible="False" ID="sPanel">
               <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
               <asp:Label runat="server" ID="lblSuccess" Text="" Font-Bold="true"></asp:Label>
          </asp:Panel>
                    <div class="form-group">
                      <label for="txtFName" class="col-sm-2 control-label">First Name</label>
                      <div class="col-sm-10">
                        <asp:TextBox runat="server" ID="txtFName" CssClass="form-control" placeholder="John" required="true"></asp:TextBox>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">Last Name</label>
                      <div class="col-sm-10">
                          <asp:TextBox runat="server" ID="txtLName" CssClass="form-control" placeholder="John" required="true"></asp:TextBox>
                      </div>
                    </div>

                          <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">Choose Course</label>
                      <div class="col-sm-10">
                           <asp:DropDownList runat="server" type="text" class="form-control"  ID="drpCourseName" required="true"></asp:DropDownList>
                      </div>
                    </div>

                         <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">User Name</label>
                      <div class="col-sm-10">
                           <asp:TextBox runat="server" ID="txtUName" CssClass="form-control" placeholder="john doe" required="true"></asp:TextBox>
                      </div>
                    </div>

                               <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">Email Address</label>
                      <div class="col-sm-10">
                           <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" placeholder="johndoe@fastlearn.com" required="true"></asp:TextBox>
                      </div>
                    </div>
                            <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
                      <div class="col-sm-10">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage= "<br />Password length must be between 8 - 12 characters" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{8,12}$" ControlToValidate="txtPwd" ForeColor="Red" Font-Bold="true" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:TextBox runat="server" ID="txtPwd" CssClass="form-control" required="true" TextMode="Password"></asp:TextBox>
                      </div>
                    </div>
                               <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">Security Question</label>
                      <div class="col-sm-10">
                          <asp:DropDownList runat="server" ID="drquestion" CssClass="form-control" >
                            <asp:ListItem>What is your mother maiden name?</asp:ListItem>
                            <asp:ListItem>What is your pet name?</asp:ListItem>
                            <asp:ListItem>What is your uncle name?</asp:ListItem>
                            <asp:ListItem>What is your best friend name?</asp:ListItem>
                        </asp:DropDownList>
                      </div>
                    </div>
                              <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">Security Answer</label>
                      <div class="col-sm-10">
                        <asp:TextBox runat="server" class="form-control"  aria-describedby="basic-addon1" ID="txtAnswer"/>
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
                 </form>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!--/.col (right) -->
        </section>
      </div><!-- /.content-wrapper -->
</asp:Content>

