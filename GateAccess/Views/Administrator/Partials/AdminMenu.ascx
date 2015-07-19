<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<ul id="menu">
    <li>
        <%: Html.ActionLink("Home", "Default", "Administrator")%>
    </li>
    <%  
        if (ViewBag.myCommunityMenuOptions != null)
        {
            foreach (String communityMenuOptionID in ViewBag.myCommunityMenuOptions)
            {
                if (communityMenuOptionID == "1")
                { 
    %>
    <li>
        <%--<%: Ajax.ActionLink("Users", "Users", "Administrator", new AjaxOptions() { HttpMethod = "Get", OnBegin = "ajaxBegin", OnComplete = "ajaxComplete", OnSuccess = "ajaxSuccess", OnFailure = "ajaxFailure", UpdateTargetId = "main", InsertionMode = InsertionMode.Replace })%>--%>
        <%: Html.ActionLink("Users", "Users", "Administrator")%>
        <%--, null, new { id = "usersAjaxLink" })--%>
    </li>
    <%}
                if (communityMenuOptionID == "2")
                { 
    %>
    <li>
        <%--<%: Ajax.ActionLink("Visitors", "Visitors", "SuperAdministrator", new AjaxOptions() { HttpMethod = "Get", OnBegin = "ajaxBegin", OnComplete = "ajaxComplete", OnSuccess = "ajaxSuccess", OnFailure = "ajaxFailure", UpdateTargetId = "main", InsertionMode = InsertionMode.Replace })%>--%>
        <%: Html.ActionLink("Visitors", "Visitors", "Administrator")%>
        <%--, null, new { id = "visitorsAjaxLink" })--%>
    </li>
    <% }
                if (communityMenuOptionID == "3")
                { 
    %>
    <li>
        <%--<%: Ajax.ActionLink("Maintenances", "Maintenances", "SuperAdministrator", new AjaxOptions() { HttpMethod = "Get", OnBegin = "ajaxBegin", OnComplete = "ajaxComplete", OnSuccess = "ajaxSuccess", OnFailure = "ajaxFailure", UpdateTargetId = "main", InsertionMode = InsertionMode.Replace })%>--%>
        <%: Html.ActionLink("Maintenances", "Maintenances", "Administrator")%>
        <%--, null, new { id = "maintenancesAjaxLink" })--%>
    </li>
    <%}
                if (communityMenuOptionID == "4")
                { 
    %>
    <li>
        <%--<%: Ajax.ActionLink("Lost/Founds", "LostFounds", "SuperAdministrator", new AjaxOptions() { HttpMethod = "Get", OnBegin = "ajaxBegin", OnComplete = "ajaxComplete", OnSuccess = "ajaxSuccess", OnFailure = "ajaxFailure", UpdateTargetId = "main", InsertionMode = InsertionMode.Replace })%>--%>
        <%: Html.ActionLink("Lost/Founds", "LostFounds", "Administrator")%>
        <%--, null, new { id = "lostFoundsAjaxLink" })--%>
    </li>
    <%}
                if (communityMenuOptionID == "5")
                { 
    %>
    <li>
        <%--<%: Ajax.ActionLink("Notices", "Notices", "SuperAdministrator", new AjaxOptions() { HttpMethod = "Get", OnBegin = "ajaxBegin", OnComplete = "ajaxComplete", OnSuccess = "ajaxSuccess", OnFailure = "ajaxFailure", UpdateTargetId = "main", InsertionMode = InsertionMode.Replace })%>--%>
        <%: Html.ActionLink("Notices", "Notices", "Administrator")%>
        <%--, null, new { id = "noticesAjaxLink" })--%>
    </li>
    <%}
            }
        }
    %>
</ul>
