<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.MaintenancesModel>" %>
<%@ Import Namespace="System.Collections.Generic" %>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
    type="text/javascript"></script>

<% using (Ajax.BeginForm("NewMaintenance", "SuperAdministrator", null,
        new AjaxOptions
        {
            UpdateTargetId = "createMessage",
            InsertionMode = InsertionMode.Replace,
            HttpMethod = "POST",
            OnSuccess = "createSuccess"
        }, new { @id = "Form_NewMaintenance" }))
   { %>
   <div id="createMessage" class="error invisible">
</div>
<table width="100%" style="font-size:12px" >
    <tr>
        <td>
            <%:Html.HiddenFor(x => x.CommunityID)%>
        </td>
    </tr>
    <tr>
        <td align="right" style="font-weight: bold">
            <%:Html.LabelFor(x => x.Request)%>&nbsp;&nbsp;&nbsp;
        </td>
        <td align="left">
            <%:Html.TextBoxFor(x => x.Request, new { style = "width: 400px;" })%>
            <%:Html.ValidationMessageFor(x => x.Request)%>
        </td>
    </tr>
    <tr>
        <td valign="top" align="right" style="font-weight: bold">
            <%:Html.LabelFor(x => x.FullText)%>&nbsp;&nbsp;&nbsp;
        </td>
        <td align="left">
            <%:Html.TextAreaFor(x => x.FullText, new { style = "width: 402px;height: 100px;resize:none" })%>
            <%:Html.ValidationMessageFor(x => x.FullText)%>
        </td>
    </tr>
    <tr>
        <td align="right" style="font-weight: bold">
            <%:Html.LabelFor(x => x.Contact)%>&nbsp;&nbsp;&nbsp;
        </td>
        <td align="left">
            <%:Html.TextBoxFor(x => x.Contact, new { style = "width: 400px;" })%>
            <%:Html.ValidationMessageFor(x => x.Contact)%>
        </td>
    </tr>
    <tr>
        <td align="right" style="font-weight: bold">
            <%:Html.LabelFor(x => x.EmailID)%>&nbsp;&nbsp;&nbsp;
        </td>
        <td align="left">
            <%:Html.TextBoxFor(x => x.EmailID, new { style = "width: 400px;" })%>
            <%:Html.ValidationMessageFor(x => x.EmailID)%>
        </td>
    </tr>   
</table>
<%}%>
