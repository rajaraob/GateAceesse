<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<GateAccess.Models.ServiceProvidersModel>>" %>
<div id="Div_ActionInformation" style="color: #800000; font-weight: bold">
</div>
<br />
<div class="divTable-titleRow">
    <div class="divTable-titleCell">
        &nbsp;&nbsp;ServiceProviders List
    </div>
    <div align="right">
        <a id="serviceProvidersRefresh" style="color: Blue; cursor: pointer;">Refresh</a>&nbsp;&nbsp;|&nbsp;&nbsp;
        <a id="NewServiceProvider" style="color: Blue; cursor: pointer">New ServiceProvider</a>&nbsp;&nbsp;
    </div>
</div>
<div id="Div_ServiceProvidersListTable">
    <% Html.RenderPartial("Partials/Users/ServiceProviders/ServiceProvidersListTable"); %></div>
