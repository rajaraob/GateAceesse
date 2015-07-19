<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.VisitorsModel>" %>
<script type="text/javascript">
    $("#visitorsRefresh").live("click", function () {
        $("#VisitorsListTable").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>"  alt="Loading..." /></div>');
        $("#VisitorsListTable").load('/SuperAdministrator/VisitorsListTable/?communityid=' + $("#Communities").val());
    });
</script>
<img src="<%: Url.Content("~/Images/newvisitor.png")%>" alt="New Visitor" align="right"
    onmousedown="this.src='<%:Url.Content("~/Images/newvisitorclick.png")%>'" onmouseup="this.src='<%:Url.Content("~/Images/newvisitor.png")%>'" />
<% if (ViewBag.VisitorsList != null && Convert.ToInt16(((List<GateAccess.Models.VisitorsModel>)ViewBag.VisitorsList).Count) > 0)
   {%><br />
<fieldset>
    <legend>Visitors List</legend>
    <table width="100%">
        <tr>
            <td width="100%">
                <img id="visitorsRefresh" src="<%: Url.Content("~/Images/refresh.png")%>" alt="refresh"
                    style="cursor: pointer" onmousedown="this.src='<%:Url.Content("~/Images/refreshclick.png")%>'"
                    onmouseup="this.src='<%:Url.Content("~/Images/refresh.png")%>'" />
            </td>
        </tr>
    </table>
    <div id="Div_VisitorsListTable">
        <% Html.RenderPartial("Partials/Notices/VisitorsListTable"); %></div>
</fieldset>
<%}
   else
   {%><br />
<span style="color: #FF0000">No Visitors were Registered..</span>
<%}
%>
