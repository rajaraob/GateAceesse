<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.MaintenancesModel>" %>
<%@ Import Namespace="System.Collections.Generic" %>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
    type="text/javascript"></script>

<% using (Html.BeginForm("", "", FormMethod.Post, new { id = "Form_EditMaintenance" }))
   { %>
<table width="100%" style="font-size:12px">
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
            <%:Html.TextAreaFor(x => x.FullText, new { style = "width: 400px;height: 100px;resize:none" })%>
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
    <tr>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td align="left">
            <input type="submit" class="Button" style="height: 40px; width: 70px" value="Update" />            
        </td>
    </tr>
</table>
<%}%>
