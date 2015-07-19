<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.ServiceProvidersModel>" %>
<%@ Import Namespace="System.Collections.Generic" %>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
    type="text/javascript"></script>
<% using (Ajax.BeginForm("UpdateServiceProvider", "SuperAdministrator", null,
        new AjaxOptions
        {
            UpdateTargetId = "editMessage",
            InsertionMode = InsertionMode.Replace,
            HttpMethod = "POST",
            OnSuccess = "updateSuccess"
        }, new { @id = "Form_EditServiceProvider" }))
   { %>
<div id="editMessage" class="error invisible">
</div>
<table width="100%" rules="all" style="border: 1px solid #000; font-size: 12px">
    <tr>
        <td style="width: 50%" valign="top" align="left">
            <table width="100%">
                <tr>
                    <td valign="top">
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
                                    <%:Html.LabelFor(x => x.SRP_HintQuestion)%>
                                </td>
                                <td>
                                    <%:Html.DropDownList("HintQuestionID", new SelectList((Model.HintQuestionsList), "HintQuestionID", "HintQuestion"), "--Select HintQuestion--", new {  tabindex = "16", Style = "font-size:13px;width:206px" })%>
                                    <%:Html.ValidationMessageFor(x => x.SRP_HintQuestion)%>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <%:Html.LabelFor(x => x.SRP_Hint)%>
                                </td>
                                <td>
                                    <%:Html.EditorFor(x => x.SRP_Hint, new { tabindex = "17", disabled = "true" })%>
                                    <%:Html.ValidationMessageFor(x => x.SRP_Hint)%>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <b><i>Community Details :</i></b><br />
                        <table width="100%">
                            <tr>
                                <td style="width: 30%" align="right">
                                    <%:Html.LabelFor(x => x.CommunityName)%>
                                </td>
                                <td>
                                    <%:Html.DisplayFor(x => x.CommunityName, new { id="CommunityName" })%>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <%:Html.LabelFor(x => x.CommunityAddress)%>
                                </td>
                                <td>
                                    <%:Html.DisplayFor(x => x.CommunityAddress, new { id="CommunityAddress" })%>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <%:Html.LabelFor(x => x.City)%>
                                </td>
                                <td>
                                    <%:Html.DisplayFor(x => x.City, new { id="City" })%>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <%:Html.LabelFor(x => x.Zip)%>
                                </td>
                                <td>
                                    <%:Html.DisplayFor(x => x.Zip, new { id="Zip" })%>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <%:Html.LabelFor(x => x.State)%>
                                </td>
                                <td>
                                    <%:Html.DisplayFor(x => x.State, new { id="State" })%>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <%:Html.LabelFor(x => x.Country)%>
                                </td>
                                <td>
                                    <%:Html.DisplayFor(x => x.Country, new { id="Country" })%>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
        <td style="width: 50%" valign="top">
            <table width="100%">
                <tr>
                    <td align="right">
                        <%:Html.LabelFor(x => x.SRP_Name)%>
                    </td>
                    <td>
                        <%:Html.EditorFor(x => x.SRP_Name, new { tabindex = "1" })%>
                        <%:Html.ValidationMessageFor(x => x.SRP_Name)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <%:Html.LabelFor(x => x.SRP_Address)%>
                    </td>
                    <td>
                        <%:Html.EditorFor(x => x.SRP_Address, new { tabindex = "2" })%>
                        <%:Html.ValidationMessageFor(x => x.SRP_Address)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <%:Html.LabelFor(x => x.SRP_Phone1)%>
                    </td>
                    <td>
                        <%:Html.EditorFor(x => x.SRP_Phone1, new { tabindex = "3" })%>
                        <%:Html.ValidationMessageFor(x => x.SRP_Phone1)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <%:Html.LabelFor(x => x.SRP_Phone2)%>
                    </td>
                    <td>
                        <%:Html.EditorFor(x => x.SRP_Phone2, new { tabindex = "3" })%>
                        <%:Html.ValidationMessageFor(x => x.SRP_Phone2)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <%:Html.LabelFor(x => x.SRP_ReferredBy)%>
                    </td>
                    <td>
                        <%:Html.EditorFor(x => x.SRP_ReferredBy, new { tabindex = "4" })%>
                        <%:Html.ValidationMessageFor(x => x.SRP_ReferredBy)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <%:Html.LabelFor(x => x.SRP_ServiceTypes)%>
                    </td>
                    <td>
                        <%:Html.EditorFor(x => x.SRP_ServiceTypes, new { tabindex = "5" })%>
                        <%:Html.ValidationMessageFor(x => x.SRP_ServiceTypes)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <%:Html.LabelFor(x => x.SRP_Specialization)%>
                    </td>
                    <td>
                        <%:Html.EditorFor(x => x.SRP_Specialization, new { tabindex = "6" })%>
                        <%:Html.ValidationMessageFor(x => x.SRP_Specialization)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <%:Html.LabelFor(x => x.SRP_ContactPerson)%>
                    </td>
                    <td>
                        <%:Html.EditorFor(x => x.SRP_ContactPerson, new { tabindex = "7" })%>
                        <%:Html.ValidationMessageFor(x => x.SRP_ContactPerson)%>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <%:Html.LabelFor(x => x.SRP_Rating)%>
                    </td>
                    <td>
                        <%:Html.EditorFor(x => x.SRP_Rating, new { tabindex = "8" })%>
                        <%:Html.ValidationMessageFor(x => x.SRP_Rating)%>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<%} %>
