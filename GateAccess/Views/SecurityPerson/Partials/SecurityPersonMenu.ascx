<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<ul id="navbar">
    <li>
        <%--<%: Ajax.ActionLink("Home", "Default", "Administrator", new AjaxOptions() {HttpMethod="Get", UpdateTargetId="main" })%>--%>
        <%: Html.ActionLink("Home", "Default", "Administrator")%>
    </li>     
    <li>
        <%: Html.Label("Visitor") %>
        <ul class="menu1">
            <li>
                <%--<%: Ajax.ActionLink("New Visitor", "VisitorRegistration", "Administrator", new AjaxOptions() { HttpMethod = "Get", UpdateTargetId = "main" })%>
                <%: Ajax.ActionLink("Visitor List", "VisitorsList", "Administrator", new AjaxOptions() { HttpMethod = "Get", UpdateTargetId = "main" })%>--%>
                <%: Html.ActionLink("New Visitor", "NewVisitor", "Administrator")%>
                <%: Html.ActionLink("Visitor List", "VisitorsList", "Administrator")%>
            </li>
        </ul>
    </li>
    <li>
        <%: Html.Label("Manintanace") %>
        <ul class="menu2">
            <li>
                <%--<%: Ajax.ActionLink("New Maintenance", "Maintenance", "Administrator", new AjaxOptions() { HttpMethod = "Get", UpdateTargetId = "main" })%>
                <%: Ajax.ActionLink("Maintenance List", "MaintenanceList", "Administrator", new AjaxOptions() { HttpMethod = "Get", UpdateTargetId = "main" })%>--%>
                <%: Html.ActionLink("New Maintenance", "NewMaintenance", "Administrator")%>
                <%: Html.ActionLink("Maintenance List", "MaintenancesList", "Administrator")%>
            </li>
        </ul>
    </li>
    <li>
        <%:Html.Label("Lost/Found") %>
        <ul class="menu3">
            <li>
                <%--<%: Ajax.ActionLink("Lost/Found", "LostFound", "Administrator", new AjaxOptions() { HttpMethod = "Get", UpdateTargetId = "main" })%>
                <%: Ajax.ActionLink("Lost/Found List", "LostFoundsList", "Administrator", new AjaxOptions() { HttpMethod = "Get", UpdateTargetId = "main" })%>--%>
                <%: Html.ActionLink("New Lost/Found", "NewLostFound", "Administrator")%>
                <%: Html.ActionLink("Lost/Found List", "LostFoundsList", "Administrator")%>
            </li>
        </ul>
    </li>  
</ul>
