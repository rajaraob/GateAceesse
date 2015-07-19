<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.AdministratorsModel>" %>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
    type="text/javascript"></script>
<div id="Div_EditAdministrator">
    <% using (Html.BeginForm("", "", FormMethod.Post, new { id = "Form_EditAdministrator" }))
       { %>
    <br />
    <table width="100%" style="border: 1px solid #000000; font-size: 12px" rules="all">
        <tr>
            <td style="width: 55%" valign="top" align="left">
                &nbsp;
                <table width="100%">
                    <tr>
                        <td colspan="2" width="30%">
                            <%: Html.HiddenFor(x => x.CommunityID)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.EmailID)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.EmailID, new { tabindex = "1" })%>
                            <%:Html.ValidationMessageFor(x => x.EmailID)%>
                            <div id="Div_message">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.HintQuestion)%>
                        </td>
                        <td>
                            <%:Html.DropDownList("HintQuestionID", new SelectList((Model.HintQuestionsList), "HintQuestionID", "HintQuestion"), " -- Select HintQuestion -- ", new {  tabindex = "4", Style = "font-size:13px;width:206px" })%>
                            <%:Html.ValidationMessageFor(x => x.HintQuestion)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Hint)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.Hint, new { tabindex = "5"})%>
                            <%:Html.ValidationMessageFor(x => x.Hint)%>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 45%" valign="top" align="left">
                &nbsp;
                <table width="100%">
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.FirstName)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.FirstName, new { tabindex = "6" })%>
                            <%:Html.ValidationMessageFor(x => x.FirstName)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.MiddleName)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.MiddleName, new { tabindex = "7" })%>
                            <%:Html.ValidationMessageFor(x => x.MiddleName)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.LastName)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.LastName, new { tabindex = "8" })%>
                            <%:Html.ValidationMessageFor(x => x.LastName)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Mobile)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.Mobile, new { tabindex = "9" })%>
                            <%:Html.ValidationMessageFor(x => x.Mobile)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.HomePhone)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.HomePhone, new { tabindex = "10" })%>
                            <%:Html.ValidationMessageFor(x => x.HomePhone)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.WorkPhone)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.WorkPhone, new { tabindex = "11" })%>
                            <%:Html.ValidationMessageFor(x => x.WorkPhone)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Address1)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.Address1, new { tabindex = "12" })%>
                            <%:Html.ValidationMessageFor(x => x.Address1)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Address2)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.Address2, new { tabindex = "13" })%>
                            <%:Html.ValidationMessageFor(x => x.Address2)%>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <%} %>
</div>
