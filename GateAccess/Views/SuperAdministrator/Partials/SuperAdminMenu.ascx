<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<ul id="menu">
    <li>
        <%--<%: Ajax.ActionLink("Home", "Default", "SuperAdministrator", new AjaxOptions() {HttpMethod="Get", UpdateTargetId="main" })%>--%>
        <%: Html.ActionLink("Home", "Default", "SuperAdministrator")%>
       
    </li>
    <li>
        <%--<%: Ajax.ActionLink("Communities", "Communities", "SuperAdministrator", new AjaxOptions() { HttpMethod = "Get", OnBegin = "communitiesAjaxBegin", OnComplete = "communitiesAjaxComplete", OnSuccess = "communitiesAjaxSuccess", OnFailure = "communitiesAjaxFailure", UpdateTargetId = "main", InsertionMode = InsertionMode.Replace })%>--%>
        <%: Html.ActionLink("Communities", "Communities", "SuperAdministrator", null, new { id = "communitiesAjaxLink" })%>
    </li>
    <li>
        <%: Html.ActionLink("Users", "Users", "SuperAdministrator", null, new { id = "usersAjaxLink" })%>
        <%--<%: Ajax.ActionLink("Users", "Users", "SuperAdministrator", new AjaxOptions() { HttpMethod = "Get", OnBegin = "usersAjaxBegin", OnComplete = "usersAjaxComplete", OnSuccess = "usersAjaxSuccess", OnFailure = "usersAjaxFailure", UpdateTargetId = "main", InsertionMode = InsertionMode.Replace })%>--%>
    </li>
    <li>
        <%: Html.ActionLink("Visitors", "Visitors", "SuperAdministrator", null, new { id = "visitorsAjaxLink" })%>
        <%--<%: Ajax.ActionLink("Visitors", "Visitors", "SuperAdministrator", new AjaxOptions() { HttpMethod = "Get", OnBegin = "visitorsAjaxBegin", OnComplete = "visitorsAjaxComplete", OnSuccess = "visitorsAjaxSuccess", OnFailure = "visitorsAjaxFailure", UpdateTargetId = "main", InsertionMode = InsertionMode.Replace })%>--%>
    </li>
    <li>
        <%: Html.ActionLink("Maintenances", "Maintenances", "SuperAdministrator", null, new { id = "maintenancesAjaxLink" })%>
        <%--<%: Ajax.ActionLink("Maintenances", "Maintenances", "SuperAdministrator", new AjaxOptions() { HttpMethod = "Get", OnBegin = "maintenancesAjaxBegin", OnComplete = "maintenancesAjaxComplete", OnSuccess = "maintenancesAjaxSuccess", OnFailure = "maintenancesAjaxFailure", UpdateTargetId = "main", InsertionMode = InsertionMode.Replace })%>--%>
    </li>
    <li>
        <%: Html.ActionLink("Lost/Founds", "LostFounds", "SuperAdministrator", null, new { id = "lostFoundsAjaxLink" })%>
        <%--<%: Ajax.ActionLink("Lost/Founds", "LostFounds", "SuperAdministrator", new AjaxOptions() { HttpMethod = "Get", OnBegin = "lostFoundsAjaxBegin", OnComplete = "lostFoundsAjaxComplete", OnSuccess = "lostFoundsAjaxSuccess", OnFailure = "lostFoundsAjaxFailure", UpdateTargetId = "main", InsertionMode = InsertionMode.Replace })%>--%>
    </li>
    <li>
        <%: Html.ActionLink("Notices", "Notices", "SuperAdministrator", null, new { id = "noticesAjaxLink" })%>
        <%--<%: Ajax.ActionLink("Notices", "Notices", "SuperAdministrator", new AjaxOptions() { HttpMethod = "Get", OnBegin = "noticesAjaxBegin", OnComplete = "noticesAjaxComplete", OnSuccess = "noticesAjaxSuccess", OnFailure = "noticesAjaxFailure", UpdateTargetId = "main", InsertionMode = InsertionMode.Replace })%>--%>
    </li>
    <li>
        <%: Html.ActionLink("Utilities", "Utilities", "SuperAdministrator", null, new { id = "utilitiesAjaxLink" })%>
        <%--<%: Ajax.ActionLink("Notices", "Notices", "SuperAdministrator", new AjaxOptions() { HttpMethod = "Get", OnBegin = "noticesAjaxBegin", OnComplete = "noticesAjaxComplete", OnSuccess = "noticesAjaxSuccess", OnFailure = "noticesAjaxFailure", UpdateTargetId = "main", InsertionMode = InsertionMode.Replace })%>--%>
    </li>
</ul>
