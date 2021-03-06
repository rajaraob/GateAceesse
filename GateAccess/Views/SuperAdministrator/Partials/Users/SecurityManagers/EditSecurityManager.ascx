﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.MVVM.EditSecurityManagerModel>" %>
<%@ Import Namespace="System.Collections.Generic" %>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
    type="text/javascript"></script>
<script type="text/javascript">

    $("#SM_HintQuestionID").change(function () {
        var smhqid = $("#SM_HintQuestionID").val();
        if (smhqid != null && smhqid > 0) {
            $(document).find("#SM_Hint").removeAttr("disabled");
        }
        else {
            $(document).find("#SM_Hint").val(" ");
            $(document).find("#SM_Hint").prop("disabled", "disabled");
        }
    });

</script>
<br />
<% using (Ajax.BeginForm("UpdateSecurityManager", "SuperSecurityManager", null,
        new AjaxOptions
        {
            HttpMethod = "POST",
            InsertionMode = InsertionMode.Replace,
            UpdateTargetId = "editSecurityManagerMessage",
            OnSuccess = "editSecurityManagerSuccess",
            OnBegin = "editSecurityManagerBegin",
            OnComplete = "editSecurityManagerComplete"
        }, new { @id = "Form_EditSecurityManager" }))
   { %>
<div id="editSecurityManagerMessage" class="error invisible">
</div>

<div id="editSecurityManagerForm">
    <table width="80%" align="center" style="border: 1px solid #000; font-size: 12px">
        <tr style="border: 1px solid #000000; height: 25px; background: #E6E6E6">
            <td style="font-weight: bold; font-size: 16px">
                Edit SecurityManager
                <img align="right" id="editSecurityManagerClose" name="<%= Model.SecurityManagerID %>"
                    src="<%: Url.Content("~/Images/close.png")%>" alt="close" />
            </td>
        </tr>
        <tr>
            <td valign="top">
                <table align="center" width="100%" rules="all" style="border: 1px solid #000000">
                    <tr>
                        <td style="width: 45%" valign="top" align="left">
                            <table width="100%">
                                <tr>
                                    <td valign="top">
                                        <table width="100%">
                                            <tr>
                                                <td>
                                                    <%: Html.HiddenFor(x => x.CommunityID)%>
                                                    <%: Html.HiddenFor(x => x.SecurityManagerID) %>
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
                                                    <%:Html.LabelFor(x => x.CurrentPassword)%>
                                                </td>
                                                <td>
                                                    <%:Html.TextBoxFor(x => x.CurrentPassword, new { tabindex = "2", @readonly = "readonly" })%>
                                                </td>
                                            </tr>
                                            <tr>
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
                                                <td align="right">
                                                    <%:Html.LabelFor(x => x.SM_HintQuestion)%>
                                                </td>
                                                <td>
                                                    <%:Html.DropDownList("SM_HintQuestionID", new SelectList((Model.HintQuestionsList), "HintQuestionID", "HintQuestion"), " --Select HintQuestion-- ", new {  tabindex = "16", Style = "font-size:13px;width:206px" })%>
                                                    <%:Html.ValidationMessageFor(x => x.SM_HintQuestion)%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <%:Html.LabelFor(x => x.SM_Hint)%>
                                                </td>
                                                <td>
                                                    <%:Html.TextBoxFor(x => x.SM_Hint, new { tabindex = "17" })%>
                                                    <%:Html.ValidationMessageFor(x => x.SM_Hint)%>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <%-- <tr>
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
                </tr>--%>
                            </table>
                        </td>
                        <td style="width: 50%" valign="top">
                            <table width="100%">
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.SM_FirstName)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.SM_FirstName, new { tabindex = "1" })%>
                                        <%:Html.ValidationMessageFor(x => x.SM_FirstName)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.SM_MiddleName)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.SM_MiddleName, new { tabindex = "2" })%>
                                        <%:Html.ValidationMessageFor(x => x.SM_MiddleName)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.SM_LastName)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.SM_LastName, new { tabindex = "3" })%>
                                        <%:Html.ValidationMessageFor(x => x.SM_LastName)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.SM_Mobile)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.SM_Mobile, new { tabindex = "4" })%>
                                        <%:Html.ValidationMessageFor(x => x.SM_Mobile)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.SM_HomePhone)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.SM_HomePhone, new { tabindex = "5" })%>
                                        <%:Html.ValidationMessageFor(x => x.SM_HomePhone)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.SM_WorkPhone)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.SM_WorkPhone, new { tabindex = "6" })%>
                                        <%:Html.ValidationMessageFor(x => x.SM_WorkPhone)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.SM_Address1)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.SM_Address1, new { tabindex = "7" })%>
                                        <%:Html.ValidationMessageFor(x => x.SM_Address1)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.SM_Address2)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.SM_Address2, new { tabindex = "8" })%>
                                        <%:Html.ValidationMessageFor(x => x.SM_Address2)%>
                                    </td>
                                </tr>
                            </table>
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
            <td align="center">
                <input type="submit" value="Update" id="SecurityManager_Update" class="Button" />
            </td>
        </tr>
    </table>
    <%} %>
</div>
<br />
