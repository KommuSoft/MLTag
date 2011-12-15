<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="WebApplication2._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to our fantastic, intelligent todo-application</h2>
    <h2>
        &nbsp;<asp:TextBox ID="txtTodo" 
            runat="server" Width="328px"></asp:TextBox>
        <asp:AutoCompleteExtender ID="AutoCompleteExtender" targetControlID = "txtTodo" 
            runat="server" UseContextKey="True" ServiceMethod="GetCompletionList"></asp:AutoCompleteExtender>
    </h2>
    <p>
        Typ hierboven je todo</p>
    <asp:ToolkitScriptManager ID="ScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
</asp:Content>
