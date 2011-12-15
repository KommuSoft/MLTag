<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication2.todo.WebForm1" MasterPageFile="~/Site.master" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

  <asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

  <title>SproutCore Todos</title>
  <meta name="description" content="" />
  <meta name="author" content="" />

  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <link rel="shortcut icon" href="/favicon.ico" />
  <link rel="apple-touch-icon" href="/apple-touch-icon.png" />
  <link rel="stylesheet" href="css/style.css?v=2" />
  <link rel="stylesheet" href="css/todos.css" />
  </asp:Content>
  <asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
  <h1>Todos</h1>
  <script type="text/x-handlebars">
  {{view Todos.CreateTodoView width="500" id="new-todo" placeholder="What needs to be done?"}}

  {{#view Todos.StatsView id="stats"}}
    {{#view SC.Button classBinding="isActive" 
      target="Todos.todosController"
      action="clearCompletedTodos"}}
      Clear Completed Todos
    {{/view}}
    {{remainingString}} remaining
  {{/view}}

  {{view SC.Checkbox class="mark-all-done"
    title="Mark All as Done"
    valueBinding="Todos.todosController.allAreDone"}}

  {{#collection contentBinding="Todos.todosController" tagName="ul" itemClassBinding="content.isDone"}}
    {{view SC.Checkbox titleBinding="content.title"
        valueBinding="content.isDone"}}
  {{/collection}}
  </script>


  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
  <script>      !window.jQuery && document.write(unescape('%3Cscript src="js/libs/jquery-1.6.1.min.js"%3E%3C/script%3E'))</script>
  <script src="js/libs/sproutcore-2.0.beta.3.min.js"></script>
  <script src="js/app.js"></script>
  <asp:ToolkitScriptManager ID="ScriptManager1" runat="server"></asp:ToolkitScriptManager>

        <br /><br /><br />
        <asp:Panel ID='tagOut' runat=server></asp:Panel>
        
        
       

        <asp:DynamicPopulateExtender ID="dpop" runat="server"
                BehaviorID="dpBeh"
                TargetControlID="tagOut"
                ClearContentsDuringUpdate = "false"
                ServiceMethod="Populate" 
                ContextKey="No Todo Entered"
                
                />
                <br /><br /><br />
         <input  type="text" disabled="true" />       
         
    
</asp:Content>
