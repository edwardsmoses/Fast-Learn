<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="content-wrapper">
                <asp:Panel CssClass="alert alertdiv" runat="server" Visible="false" ID="sPanel">
               <a href="#" class="fa fa-times-circle-o close fa-3x" data-dismiss="alert" aria-label="close" title="please close"></a>
               <asp:Label runat="server" ID="lblSuccess" Text="Driest Bojjhfeujhfufhiuy" Font-Bold="true" CssClass="message"></asp:Label>
          </asp:Panel>

        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Dashboard
            <small>Fast Learn</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Dashboard</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <!-- Info boxes -->
          <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-aqua"><i class="fa fa-group"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Students</span>
                  <span class="info-box-number"><span runat="server" id="studentnumber"></span></span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-red"><i class="fa fa-graduation-cap"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Faculty</span>
                  <span class="info-box-number"><span runat="server" id="facultynumber"></span></span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->

            <!-- fix for small devices only -->
            <div class="clearfix visible-sm-block"></div>

            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-green"><i class="fa fa-comments"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Feedbacks</span>
                  <span class="info-box-number"><span runat="server" id="feedbacknumber"></span></span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="info-box">
                <span class="info-box-icon bg-yellow"><i class="fa fa-car"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">Visitors</span>
                  <span class="info-box-number"><span runat="server" id="visitornumber"></span></span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
            </div><!-- /.col -->
          </div><!-- /.row -->

          <!-- Main row -->
          <div class="row">
            <!-- Left col -->
            <div class="col-md-12">
              <div class="row">
                <div class="col-md-6">
                  <!-- DIRECT CHAT -->
             <div class="box box-success">
                <div class="box-header">
                  <i class=" fa fa-comments"></i>
                  <h3 class="box-title">Send Message to Faculty Members</h3>
                     <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                      </div>
                </div>
                <div class="box-body chat chatbodies" id="chatbox" runat="server" style="max-height: 330px;overflow-y: scroll;">
                  <!-- chat item -->
                </div><!-- /.chat -->
                <div class="box-footer">
                  <div class="input-group">
                    <asp:TextBox runat="server" id="txtFacultyMessage" CssClass="form-control" placeholder="Type message..." AutoCompleteType="Disabled"></asp:TextBox>
                    <div class="input-group-btn">
                      <a class="btn btn-success" title="Send message" data-toggle="modal" data-target=".messageCont"><i class="fa fa-send"></i></a>
                    </div>
                  </div>
                </div>
              </div><!-- /.box (chat box) -->
                </div><!-- /.col -->
                  <div class="modal fade messageCont" id="messages" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" runat="server">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="messageLabel">Choose Faculty Username</h4>
      </div>
      <div class="modal-body" id="messageBody" runat="server">
          <div class="form-group">
                            <label class="contactlabel">Select Faculty Username</label>
                          <asp:DropDownList runat="server" type="text" class="form-control"  ID="drpFacultyName" required="true"></asp:DropDownList>
                        </div> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <asp:LinkButton runat="server" ID="btnSendFaculty" CssClass="btn btn-primary" OnClick="btnSendFaculty_Click"><i class="fa fa-send fa-stack"></i>Send Message</asp:LinkButton>
      </div>
    </div>
  </div>
</div>
                <div class="col-md-6">
                  <!-- USERS LIST -->
                  <div class="box box-danger">
                    <div class="box-header with-border">
                      <h3 class="box-title">Latest Students</h3>
                      <div class="box-tools pull-right">
                        <span class="label label-danger">8 New Members</span>
                        <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                      </div>
                    </div><!-- /.box-header -->
                    <div class="box-body no-padding">
                      <ul class="users-list clearfix" id="newUsers" runat="server">
                      </ul><!-- /.users-list -->
                    </div><!-- /.box-body -->
                    <div class="box-footer text-center">
                      <a href="Search.aspx?s=" class="uppercase">View All Users</a>
                    </div><!-- /.box-footer -->
                  </div><!--/.box -->
                </div><!-- /.col -->
              </div><!-- /.row -->

              <!-- TABLE: LATEST ORDERS -->
                   <!-- quick email widget -->
              <div class="box box-info">
                <div class="box-header">
                  <i class="fa fa-envelope"></i>
                  <h3 class="box-title">Send Message to Student</h3>
                  <!-- tools box -->
                  <div class="pull-right box-tools">
                      <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Minimize"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-sm btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Close"><i class="fa fa-times"></i></button>
                  </div><!-- /. tools -->
                </div>
                <div class="box-body">
                    <div class="form-group">
                                    <asp:DropDownList runat="server" type="text" class="form-control"  ID="drpStudentName" required="true" placeholder="Message to: "></asp:DropDownList>
                    </div>
                    <div>
                      <asp:TextBox TextMode="MultiLine" Rows="5" class="textarea" placeholder="Message" style="width: 100%; height: 125px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;" runat="server" id="contactMessage"></asp:TextBox>
                    </div>
                </div>
                <div class="box-footer clearfix">
                  <asp:LinkButton runat="server" ID="btnSendMessage" CssClass="btn btn-primary pull-right" OnClick="btnSendMessage_Click"><i class="fa fa-send fa-stack"></i>Send Message</asp:LinkButton>
                </div>
              </div>
            </div><!-- /.col -->

          </div><!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
</asp:Content>

