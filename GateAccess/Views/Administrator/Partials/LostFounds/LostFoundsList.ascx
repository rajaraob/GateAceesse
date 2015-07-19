<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<table width="100%">
    <tr>
        <td style="text-align: left">
            <div id="Div_ActionInformation" style="color: #800000; font-weight: bold">
            </div>
        </td>       
    </tr>
</table>
<% if (ViewBag.LostFoundsList != null && (((List<GateAccess.Models.LostFoundsModel>)ViewBag.LostFoundsList).Count) > 0)
   {%><br />
<fieldset>
    <legend>LostFounds List</legend>
    <table width="100%">
        <tr>
            <td width="100%">
                <img id="lostFoundsRefresh" src="<%: Url.Content("~/Images/refresh.png")%>" alt="refresh"
                  style="cursor:pointer"   onmousedown="this.src='<%: Url.Content("~/Images/refreshclick.png")%>'" onmouseup="this.src='<%: Url.Content("~/Images/refresh.png")%>'" />
            </td>
        </tr>
    </table>
    <div id="Div_LostFoundsListTable">
        <% Html.RenderPartial("Partials/LostFounds/LostFoundsListTable"); %></div>
</fieldset>
<%}
   else
   {%><br />
<span style="color: #FF0000">No LostFounds were Registered..</span>
<%}
%>