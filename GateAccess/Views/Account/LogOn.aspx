<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<GateAccess.Models.AccountModel>" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    GA :: LogOn
</asp:Content>
<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            OnLoad();
            $("#Div_LogOutInfo").fadeOut(4000);
        });
    </script>
  
    <div id="Div_LogOutInfo" align="center" style="color: #008000; font-weight: bold">
        <%if (ViewBag.LogOut != null)
          {%>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LogOut Successfull.<%          
          }%></div>
    <div id="Div_LogOnPartial">
        <% Html.RenderPartial("_LogOn");%></div>
</asp:Content>
