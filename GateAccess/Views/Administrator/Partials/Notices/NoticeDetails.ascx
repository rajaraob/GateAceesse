<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.NoticesModel>" %>
<table width="50%" align="center" style="font-size: 12px;border:1px solid #000000">
     <tr style="border: 1px solid #000000; height: 25px; background: #E6E6E6">
        <td>
            <b>Notice Details</b>
            <img align="right" id="NoticeDetailsClose" name="<%= Model.NoticeID %>" src="<%: Url.Content("~/Images/close.png")%>"
                alt="close" />
        </td>
    </tr>
    <tr>
        <td>
            <table>
                <%:Html.HiddenFor(x => x.CommunityID)%>
                <tr>
                    <td valign="top" align="right" style="width: 20%">
                        <b>
                            <%:Html.LabelFor(x => x.NoticeText)%></b>
                    </td>
                    <td style="width: 80%">
                        <%:Html.TextAreaFor(x => x.NoticeText, new { style = "width:300px;height: 150px;resize:none", @readonly = "readonly" })%>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
