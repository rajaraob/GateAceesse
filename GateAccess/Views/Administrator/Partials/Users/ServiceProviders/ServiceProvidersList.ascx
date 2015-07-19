<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<div style="width: 100%">
    <div style="text-align: left">
        <div id="Div_ActionInformation" style="color: #800000; font-weight: bold">
        </div>
    </div>
    <div style="text-align: right">
        <img id="NewServiceProvider" src="<%: Url.Content("~/Images/newserviceprovider.png")%>"
            alt="New ServiceProvider" style="cursor: pointer" align="right" onmousedown="this.src='<%:Url.Content("~/Images/newserviceproviderclick.png")%>'"
            onmouseup="this.src='<%:Url.Content("~/Images/newserviceprovider.png")%>'" />
    </div>
</div>
<% if (ViewBag.ServiceProvidersList != null && ((List<GateAccess.Models.ServiceProvidersModel>)ViewBag.ServiceProvidersList).Count > 0)
   {%>
<div class="divTable-titleRow">
    <div class="divTable-titleCell">
        <img id="serviceProviderRefresh" src="<%: Url.Content("~/Images/refresh.png")%>"
            alt="refresh" width="16px" height="16px" onmousedown="this.src='<%:Url.Content("~/Images/refreshclick.png")%>'"
            style="cursor: pointer" onmouseup="this.src='<%:Url.Content("~/Images/refresh.png")%>'" />
        &nbsp;&nbsp;&nbsp;ServiceProviders List&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
</div>
<div id="Div_ServiceProvidersListTable">
    <% Html.RenderPartial("Partials/Users/ServiceProviders/ServiceProvidersListTable"); %></div>
<%}
   else
   {%><br />
<span style="color: #FF0000">No ServiceProvider(s) were Registered..</span>
<%}
%>