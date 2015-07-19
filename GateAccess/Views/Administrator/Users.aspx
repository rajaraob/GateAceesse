<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Administrator/Administrator.Master"
    Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Users
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function loadPartial(roleid) {
            $("#Div_UsersList").empty();
            $("#Div_UsersList").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>"  alt="Loading..."/></div>');
            $.ajax({
                type: "GET",
                timeout: 5000,
                url: "/Administrator/UsersList/?roleid=" + roleid,
                success: function (data) {
                    $("#Div_UsersList").html(data);
                },
                error: function (errdata)
                { }
            });
        }   
    </script>
    <div>
        <fieldset>
            <legend>Users</legend>
            <div id="Div_RolesList" align="center">
                <% Html.RenderPartial("Partials/Users/RolesList");%>
            </div>
            <br />
            <div id="Div_ActionInformation" style="color: #800000">
            </div>
            <div id="Div_UsersList">
            </div>
        </fieldset>
    </div>
</asp:Content>
