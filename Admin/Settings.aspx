<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Settings.aspx.cs" Inherits="Admin_Setting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="content-wrapper">
      <section class="content-header">
          <h1>
           Reset Password
            <small>Fast Learn</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="Index.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Reset Password</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
             <div class="col-md-12">
              <!-- Horizontal Form -->
              <div class="box box-info">
                <div class="box-header with-border">
                  <h3 class="box-title">Reset Password</h3>
                </div><!-- /.box-header -->
                <!-- form start -->
                  <div class="box-body">
                      <div class="form-horizontal">
                      <asp:Panel CssClass="alert alert-success fade in" runat="server" Visible="False" ID="sPanel">
               <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
               <asp:Label runat="server" ID="lblSuccess" Text="" Font-Bold="true"></asp:Label>
          </asp:Panel>
                            <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">Current Password</label>
                      <div class="col-sm-10">
                          <asp:TextBox runat="server" ID="txtCPwd" CssClass="form-control" required="true" TextMode="Password"></asp:TextBox>
                      </div>
                    </div>
                            <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">New Password</label>
                      <div class="col-sm-10">
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage= "<br />Password length must be between 8 - 12 characters" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{8,12}$" ControlToValidate="txtNPwd" ForeColor="Red" Font-Bold="true" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:TextBox runat="server" ID="txtNPwd" CssClass="form-control" required="true" TextMode="Password"></asp:TextBox>
                      </div>
                    </div>
                      <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">Retype Password</label>
                      <div class="col-sm-10">
                           <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="<br>Passwords do not match" Display="Dynamic" ForeColor="Red" ControlToValidate="txtRPwd" ControlToCompare="txtNPwd"></asp:CompareValidator>
                        <asp:TextBox runat="server" ID="txtRPwd" CssClass="form-control" required="true" TextMode="Password"></asp:TextBox>
                      </div>
                    </div>
                      </div>
                      </div>
                   <div class="box-footer">
                    <button type="submit" class="btn btn-default">Cancel</button>
                    <asp:Button runat="server" ID="btnChange" class="btn btn-info pull-right" Text="Reset Password" OnClick="btnChange_Click" UseSubmitBehavior="true"></asp:Button>
                  </div><!-- /.box-footer -->
              </div></div>
            </section>
         </div>
</asp:Content>

