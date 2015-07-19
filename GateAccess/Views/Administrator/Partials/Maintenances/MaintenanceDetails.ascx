<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.MaintenancesModel>" %>
<br />
<table width="55%" align="center" style="border: 1px solid #000000; font-size: 12px">
    <tr bgcolor="#f3f3f3" style="border: 1px solid #000000">
        <td style="text-align: left; width: 50%">
            Maintenance Details
            <img align="right" id="MaintenanceDetailsClose" name="<%= Model.MaintenanceID %>"
                src="<%: Url.Content("~/Images/close.png")%>" alt="close" />
        </td>
    </tr>
    <tr>
        <td>
            <table width="100%">
                <tr>
                    <td>
                        <%:Html.HiddenFor(x => x.CommunityID) %>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="25%" style="font-weight: bold">
                        <%:Html.LabelFor(x => x.Request)%>
                    </td>
                    <td>
                        <%= Html.DisplayFor(x => x.Request, new { style="width:300px"})%>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top" style="font-weight: bold">
                        <%:Html.LabelFor(x => x.FullText)%>
                    </td>
                    <td>
                        <%:Html.TextAreaFor(x => x.FullText, new { style = "width: 300px;height: 120px;resize:none;outline:none", @readonly = "readonly" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="font-weight: bold">
                        <%:Html.LabelFor(x => x.Contact)%>
                    </td>
                    <td>
                        <%:Html.DisplayFor(x => x.Contact, new { style = "width: 300px;" })%>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="font-weight: bold">
                        <%:Html.LabelFor(x => x.EmailID)%>
                    </td>
                    <td>
                        <%:Html.DisplayFor(x => x.EmailID, new { style = "width: 300px;" })%>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<br />
