<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Admin_Feedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager EnablePageMethods="true" runat="server"/>
    <script>
            function Delete() {
                var selectedIDs = new Array();
                $('input:checkbox.checkbox').each(function () {
                    if($(this).prop('checked'))
                    {
                        selectedIDs.push($(this).val());
                    }
                });
                PageMethods.Deleted(selectedIDs, onSucess);
            }
            function onSucess()
            {
                window.location = "Feedback.aspx";
            }
    </script>
    <div class="content-wrapper">
            <section class="content-header">
          <h1>
            Feedbacks
          </h1>
          <ol class="breadcrumb">
            <li><a href="Index.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Mailbox</li>
          </ol>
        </section>
        <section class="content">
            <div class="row">
                  <div class="col-md-11">
              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">Inbox</h3>
                  <div class="box-tools pull-right">
                  </div><!-- /.box-tools -->
                </div><!-- /.box-header -->
                <div class="box-body no-padding">
                  <div class="mailbox-controls">
                    <!-- Check all button -->
                    <div class="btn-group">
                      <span class="btn btn-default btn-sm btn-danger" onclick="Delete()"><i class="fa fa-trash-o"></i></span>
                    </div><!-- /.btn-group -->
                    <a class="btn btn-default btn-sm btn-primary" href="Feedback.aspx"><i class="fa fa-refresh"></i></a>
                  </div>
                  <div class="table-responsive mailbox-messages">
                    <table class="table table-hover table-striped" >
                      <tbody runat="server" id="messageList">
                      </tbody>
                    </table><!-- /.table -->
                  </div><!-- /.mail-box-messages -->
                </div><!-- /.box-body -->
                <div class="box-footer no-padding">
                </div>
              </div><!-- /. box -->
            </div><!-- /.col -->
                </div>
        </section>
    </div>
</asp:Content>

