<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.ServiceProvidersModel>" %>
<%@ Import Namespace="System.Collections.Generic" %>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
    type="text/javascript"></script>
<div id="Div_NewServiceProvider">
    <% using (Html.BeginForm("", "", FormMethod.Post, new { id = "Form_EditServiceProvider" }))
       { %>
    <table width="100%" rules="all" style="border: 1px solid #000; font-size: 12px">
        <tr>
            <td style="width: 50%" valign="top" align="left">
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
                            <%:Html.EditorFor(x => x.EmailID, new { tabindex = "13" })%>
                            <%:Html.ValidationMessageFor(x => x.EmailID)%>
                        </td>
                    </tr>                    
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.HintQuestion)%>
                        </td>
                        <td>
                            <%:Html.DropDownList("HintQuestionID", new SelectList((Model.HintQuestionsList), "HintQuestionID", "HintQuestion"), "--Select HintQuestion--", new {  tabindex = "16", Style = "font-size:13px;width:206px" })%>
                            <%:Html.ValidationMessageFor(x => x.HintQuestion)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Hint)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.Hint, new { tabindex = "17", disabled = "true" })%>
                            <%:Html.ValidationMessageFor(x => x.Hint)%>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 50%" valign="top">
                <table width="100%">
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Name)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.Name, new { tabindex = "1" })%>
                            <%:Html.ValidationMessageFor(x => x.Name)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Address)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.Address, new { tabindex = "2" })%>
                            <%:Html.ValidationMessageFor(x => x.Address)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Phone1)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.Phone1, new { tabindex = "3" })%>
                            <%:Html.ValidationMessageFor(x => x.Phone1)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Phone2)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.Phone2, new { tabindex = "3" })%>
                            <%:Html.ValidationMessageFor(x => x.Phone2)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.ReferredBy)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.ReferredBy, new { tabindex = "4" })%>
                            <%:Html.ValidationMessageFor(x => x.ReferredBy)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.ServiceTypes)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.ServiceTypes, new { tabindex = "5" })%>
                            <%:Html.ValidationMessageFor(x => x.ServiceTypes)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Specialization)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.Specialization, new { tabindex = "6" })%>
                            <%:Html.ValidationMessageFor(x => x.Specialization)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.ContactPerson)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.ContactPerson, new { tabindex = "7" })%>
                            <%:Html.ValidationMessageFor(x => x.ContactPerson)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Rating)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.Rating, new { tabindex = "8" })%>
                            <%:Html.ValidationMessageFor(x => x.Rating)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.City)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.City, new { tabindex = "9" })%>
                            <%:Html.ValidationMessageFor(x => x.City)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Zip)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.Zip, new { tabindex = "10" })%>
                            <%:Html.ValidationMessageFor(x => x.Zip)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.State)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.State, new { tabindex = "11" })%>
                            <%:Html.ValidationMessageFor(x => x.State)%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Country)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.Country, new { tabindex = "12" })%>
                            <%:Html.ValidationMessageFor(x => x.Country)%>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <br />
                <input type="submit" class="Button" value="Update" tabindex="19" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" onclick="Clear(this.form)" value="Clear" class="Button" tabindex="18" />
            </td>
        </tr>
    </table>
    </fieldset>
    <%} %>
</div>
