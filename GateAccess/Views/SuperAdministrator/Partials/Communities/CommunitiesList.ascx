<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<GateAccess.Models.CommunitiesModel>>" %>
<div id="Div_ActionInformation" style="color: Green; font-weight: bold; text-align: left">&nbsp;
</div>
<br />
<div class="divTable-titleRow">
    <div class="divTable-titleCell">
        &nbsp;&nbsp;Communities List
    </div>
    <div align="right">
        <a id="communitiesRefresh" style="color: Blue; cursor: pointer;">Refresh</a>&nbsp;&nbsp;|&nbsp;&nbsp;
        <a id="NewCommunity" style="color: Blue; cursor: pointer">New Community</a>&nbsp;&nbsp;
    </div>
</div>

<div id="Div_CommunitiesListTable">
    <% Html.RenderPartial("Partials/Communities/CommunitiesListTable"); %></div>
