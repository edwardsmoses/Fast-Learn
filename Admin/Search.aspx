<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Admin_Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="content-wrapper">
            <section class="content-header">
          <h1>
            Search Results for '<%=Request.QueryString["s"]%>'
          </h1>
          <ol class="breadcrumb">
            <li><a href="Index.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Search</li>
          </ol>
        </section>
        <section class="content">
            <div class="row" id="searchContainer" runat="server">
                </div>
            </section>
          </div>
</asp:Content>

