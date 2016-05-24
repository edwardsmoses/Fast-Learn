<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="DeleteStudent.aspx.cs" Inherits="Admin_DeleteStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="content-wrapper">
        <section class="content-header">
          <h1>
           Delete Student Account
            <small>Fast Learn</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="Index.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Delete Student</li>
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
                  <div class="box-body">
                      <asp:Panel CssClass="alert alert-success fade in" runat="server" Visible="False" ID="sPanel">
               <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
               <asp:Label runat="server" ID="lblSuccess" Text="" Font-Bold="true"></asp:Label>
          </asp:Panel>
                            <div class="form-group">
                      <label for="inputPassword3" class="col-sm-2 control-label">Select Student Username</label>
                      <div class="col-sm-10">
                           <asp:DropDownList runat="server" type="text" class="form-control"  ID="drpStudentName" required="true"></asp:DropDownList>
                      </div>
                    </div>
                      </div>
                   <div class="box-footer">
                    <button type="submit" class="btn btn-default">Cancel</button>
                    <asp:Button runat="server" ID="btnDelete" class="btn btn-info pull-right" Text="Delete" OnClick="btnDelete_Click"></asp:Button>
                  </div><!-- /.box-footer -->
              </div></div>
            </section>
             </div>
</asp:Content>

