<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<GateAccess.Models.NoticesModel>>" %>
<div style="width: 100%">
    <div style="text-align: left">
        <div id="Div_ActionInformation" style="color: #800000; font-weight: bold">
        </div>
    </div>
</div>
<%if (Model != null && Model.Count() > 0)
  //if (ViewBag.NoticesList != null && Convert.ToInt16(((List<GateAccess.Models.NoticesModel>)ViewBag.NoticesList).Count) > 0)
  {%><br />
<div class="divTable-titleRow">
    <div class="divTable-titleCell">
        <img id="noticesRefresh" src="<%: Url.Content("~/Images/refresh.png")%>" alt="refresh"
            style="cursor: pointer" height="16px" width="16px" onmousedown="this.src='<%: Url.Content("~/Images/refreshclick.png")%>'"
            onmouseup="this.src='<%: Url.Content("~/Images/refresh.png")%>'" />
        &nbsp;&nbsp;&nbsp;Notices List &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
    </div>
</div>
<div id="Div_NoticesListTable">
    <% Html.RenderPartial("Partials/Notices/NoticesListTable"); %></div>
<%}
  else
  {%><br />
<span style="color: #FF0000">No Notices were Registered..</span>
<%}
%>