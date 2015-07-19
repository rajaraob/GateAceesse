<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<GateAccess.Models.AdministratorsModel>>" %>
<div id="Div_ActionInformation" style="color: #800000; font-weight: bold">
</div>
<br />
<div class="divTable-titleRow">
    <div class="divTable-titleCell">
        &nbsp;&nbsp;&nbsp;Administrators List
    </div>
    <div align="right">
        <a id="administratorsRefresh" style="color: Blue; cursor: pointer;">Refresh</a>&nbsp;&nbsp;|&nbsp;&nbsp;
        <a id="NewAdministrator" style="color: Blue; cursor: pointer">New Administrator</a>&nbsp;&nbsp;
    </div>
</div>
<div id="Div_AdministratorsListTable">
    <% Html.RenderPartial("Partials/Users/Administrators/AdministratorsListTable"); %>
</div>