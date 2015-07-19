<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ OutputCache Duration="86400" VaryByParam="*" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Default
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%=ViewBag.Message %></h2>

</asp:Content>
