<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.SecurityManagersModel>" %>
<%@ Import Namespace="System.Collections.Generic" %>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
    type="text/javascript"></script>
<div id="Div_NewSecurityManager">
    <% using (Html.BeginForm("", "", FormMethod.Post, new { id = "Form_NewSecurityManager" }))
       { %>
    <table width="100%" rules="all" style="border: 1px solid #000; font-size: 12px">
        <tr>
            <td style="width: 50%" valign="top">
                <table width="100%">
                    <tr>
                        <td>
                            <%:Html.HiddenFor(x => x.CommunityID) %>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" width="30%">
                            <%:Html.LabelFor(x => x.EmailID)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.EmailID, new { tabindex = "13" })%>
                            <%:Html.ValidationMessageFor(x => x.EmailID)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Password)%>
                        </td>
                        <td>
                            <%:Html.PasswordFor(x => x.Password, new { tabindex = "14" })%>
                            <%:Html.ValidationMessageFor(x => x.Password)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.ConfirmPassword)%>
                        </td>
                        <td>
                            <%:Html.PasswordFor(x => x.ConfirmPassword, new { tabindex = "15" })%>
                            <%:Html.ValidationMessageFor(x => x.ConfirmPassword)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.HintQuestion)%>
                        </td>
                        <td>
                            <%:Html.DropDownList("HintQuestionID", new SelectList((Model.HintQuestionsList), "HintQuestionID", "HintQuestion"), " --Select HintQuestion-- ", new {  tabindex = "16", Style = "font-size:13px;width:206px" })%>
                            <%:Html.ValidationMessageFor(x => x.HintQuestion)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Hint)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.Hint, new { tabindex = "17", disabled = "true" })%>
                            <%:Html.ValidationMessageFor(x => x.Hint)%>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 50%" valign="top">
                <table width="100%">
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.FirstName)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.FirstName, new { tabindex = "1" })%>
                            <%:Html.ValidationMessageFor(x => x.FirstName)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.MiddleName)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.MiddleName, new { tabindex = "2" })%>
                            <%:Html.ValidationMessageFor(x => x.MiddleName)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.LastName)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.LastName, new { tabindex = "3" })%>
                            <%:Html.ValidationMessageFor(x => x.LastName)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Mobile)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.Mobile, new { tabindex = "4" })%>
                            <%:Html.ValidationMessageFor(x => x.Mobile)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.HomePhone)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.HomePhone, new { tabindex = "5" })%>
                            <%:Html.ValidationMessageFor(x => x.HomePhone)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.WorkPhone)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.WorkPhone, new { tabindex = "6" })%>
                            <%:Html.ValidationMessageFor(x => x.WorkPhone)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Address1)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.Address1, new { tabindex = "7" })%>
                            <%:Html.ValidationMessageFor(x => x.Address1)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Address2)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.Address2, new { tabindex = "8" })%>
                            <%:Html.ValidationMessageFor(x => x.Address2)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.City)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.City, new { tabindex = "9" })%>
                            <%:Html.ValidationMessageFor(x => x.City)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Zip)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.Zip, new { tabindex = "10" })%>
                            <%:Html.ValidationMessageFor(x => x.Zip)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.State)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.State, new { tabindex = "11" })%>
                            <%:Html.ValidationMessageFor(x => x.State)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Country)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.Country, new { tabindex = "12" })%>
                            <%:Html.ValidationMessageFor(x => x.Country)%>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <input type="submit" class="Button" value="Register" tabindex="18" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" onclick="Clear(this.form)" value="Clear" class="Button" tabindex="19" />
            </td>
        </tr>
    </table>
    <%} %>
</div>
