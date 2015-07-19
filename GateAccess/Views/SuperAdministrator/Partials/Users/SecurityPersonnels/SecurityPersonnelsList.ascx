<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<GateAccess.Models.SecurityPersonnelsModel>>" %>
<div id="Div_ActionInformation" style="color: #800000; font-weight: bold">
</div>
<br />
<div class="divTable-titleRow">
    <div class="divTable-titleCell">
        &nbsp;&nbsp;SecurityPersonnels List
    </div>
    <div align="right">
        <a id="securityPersonnelsRefresh" style="color: Blue; cursor: pointer;">Refresh</a>&nbsp;&nbsp;|&nbsp;&nbsp;
        <a id="NewSecurityPersonnel" style="color: Blue; cursor: pointer">New SecurityPersonnel</a>&nbsp;&nbsp;
    </div>
</div>
<div id="Div_SecurityPersonnelsListTable">
    <% Html.RenderPartial("Partials/Users/SecurityPersonnels/SecurityPersonnelsListTable"); %></div>
