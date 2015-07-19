<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.NoticesModel>" %>
<%@ Import Namespace="System.Collections.Generic" %>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
    type="text/javascript"></script>

    <% using (Ajax.BeginForm("UpdateNotice", "SuperAdministrator", null,
        new AjaxOptions
        {
            UpdateTargetId = "editMessage",
            InsertionMode = InsertionMode.Replace,
            HttpMethod = "POST",
            OnSuccess = "updateSuccess"
        }, new { @id = "Form_EditNotice" }))
   { %>
<div id="editMessage" class="error invisible">
</div>
<table width="100%" align="center" style="font-size: 12px">
    <%:Html.HiddenFor(x => x.CommunityID)%>
    <tr>
        <td valign="top" align="right" style="width: 20%">
            <b>
                <%:Html.LabelFor(x => x.NoticeText)%></b>
        </td>
        <td style="width: 80%">
            <%:Html.TextAreaFor(x => x.NoticeText, new { style = "width:300px;height: 150px;resize:none", maxlength="700"})%>
            <%:Html.ValidationMessageFor(x => x.NoticeText)%>
        </td>
    </tr>
    <tr>
        <td>
        </td>
        <td>
            <div id="charNum">
            </div>
        </td>
    </tr>   
</table>
<%}%>
