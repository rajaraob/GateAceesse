<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.AdministratorsModel>" %>
<%@ Import Namespace="System.Collections.Generic" %>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
    type="text/javascript"></script>
<div id="Div_NewAdministrator">
    <% using (Html.BeginForm("", "", FormMethod.Post, new { id = "Form_NewAdministrator" }))
       { %>
    <table width="100%" rules="all" style="border: 1px solid #000; font-size: 12px">
        <tr>
            <td style="width: 55%" valign="top" align="left">
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
                            <%:Html.EditorFor(x => x.EmailID, new { tabindex = "1" })%>
                            <%:Html.ValidationMessageFor(x => x.EmailID)%>
                            <div id="Div_message">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Password)%>
                        </td>
                        <td>
                            <%:Html.PasswordFor(x => x.Password, new { tabindex = "2" })%>
                            <%:Html.ValidationMessageFor(x => x.Password)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.ConfirmPassword)%>
                        </td>
                        <td>
                            <%:Html.PasswordFor(x => x.ConfirmPassword, new { tabindex = "3" })%>
                            <%:Html.ValidationMessageFor(x => x.ConfirmPassword)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.HintQuestionID)%>
                        </td>
                        <td>
                            <%:Html.DropDownList("HintQuestionID", new SelectList((Model.HintQuestionsList), "HintQuestionID", "HintQuestion"), " -- Select HintQuestion -- ", new {  tabindex = "4", Style = "font-size:13px;width:206px" })%>
                            <%:Html.ValidationMessageFor(x => x.HintQuestionID)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Hint)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.Hint, new { tabindex = "5", disabled = "true" })%>
                            <%:Html.ValidationMessageFor(x => x.Hint)%>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 45%" valign="top" align="left">
                <table width="100%">
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.FirstName)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.FirstName, new { tabindex = "6" })%>
                            <%:Html.ValidationMessageFor(x => x.FirstName)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.MiddleName)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.MiddleName, new { tabindex = "7" })%>
                            <%:Html.ValidationMessageFor(x => x.MiddleName)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.LastName)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.LastName, new { tabindex = "8" })%>
                            <%:Html.ValidationMessageFor(x => x.LastName)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Mobile)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.Mobile, new { tabindex = "9" })%>
                            <%:Html.ValidationMessageFor(x => x.Mobile)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.HomePhone)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.HomePhone, new { tabindex = "10" })%>
                            <%:Html.ValidationMessageFor(x => x.HomePhone)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.WorkPhone)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.WorkPhone, new { tabindex = "11" })%>
                            <%:Html.ValidationMessageFor(x => x.WorkPhone)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Address1)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.Address1, new { tabindex = "12" })%>
                            <%:Html.ValidationMessageFor(x => x.Address1)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Address2)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.Address2, new { tabindex = "13" })%>
                            <%:Html.ValidationMessageFor(x => x.Address2)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.City)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.City, new { tabindex = "14" })%>
                            <%:Html.ValidationMessageFor(x => x.City)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Zip)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.Zip, new { tabindex = "15" })%>
                            <%:Html.ValidationMessageFor(x => x.Zip)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.State)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.State, new { tabindex = "16" })%>
                            <%:Html.ValidationMessageFor(x => x.State)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Country)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.Country, new { tabindex = "17" })%>
                            <%:Html.ValidationMessageFor(x => x.Country)%>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <br />
                <input type="submit" class="Button" value="Register" tabindex="18" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" onclick="Clear(this.form)" value="Clear" class="Button" tabindex="19" />
            </td>
        </tr>
    </table>
    <%} %>
</div>
