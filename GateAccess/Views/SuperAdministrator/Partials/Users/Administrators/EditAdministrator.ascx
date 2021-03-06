﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.MVVM.EditAdministratorModel>" %>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
    type="text/javascript"></script>
<script type="text/javascript">

    $("#Admin_HintQuestionID").change(function () {
        var adhqid = $("#Admin_HintQuestionID").val();
        if (adhqid != null && adhqid > 0) {
            $(document).find("#Admin_Hint").removeAttr("disabled");
        }
        else {
            $(document).find("#Admin_Hint").val(" ");
            $(document).find("#Admin_Hint").prop("disabled", "disabled");
        }
    });

</script><br />
<% using (Ajax.BeginForm("UpdateAdministrator", "SuperAdministrator", null,
        new AjaxOptions
        {
            HttpMethod = "POST",
            InsertionMode = InsertionMode.Replace,
            UpdateTargetId = "editAdministratorMessage",
            OnSuccess = "editAdministratorSuccess",
            OnBegin = "editAdministratorBegin",
            OnComplete = "editAdministratorComplete"            
        }, new { @id = "Form_EditAdministrator" }))
   { %>
<div id="editAdministratorMessage" class="error invisible"></div>

<br />
<div id="editAdministratorForm">
    <table width="80%" align="center" style="border: 1px solid #000; font-size: 12px">
        <tr style="border: 1px solid #000000; height: 25px; background: #E6E6E6">
            <td style="font-weight: bold; font-size: 16px">
                 Edit Administrator
                <img align="right" id="editAdministratorClose" name="<%= Model.AdministratorID %>"
                    src="<%: Url.Content("~/Images/close.png")%>" alt="close" />
            </td>
        </tr>
        <tr>
            <td valign="top">
                <table align="center" width="100%" rules="all" style="border:1px solid #000000">
                    <tr>
                        <td style="width: 45%" valign="top" align="left">
                            <table width="100%">
                                <tr>
                                    <td valign="top">
                                        <table width="100%">
                                            <tr>
                                                <td colspan="2" width="30%">
                                                    <%: Html.HiddenFor(x => x.CommunityID)%>
                                                    <%: Html.HiddenFor(x => x.AdministratorID) %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <%:Html.LabelFor(x => x.EmailID)%>
                                                </td>
                                                <td>
                                                    <%:Html.TextBoxFor(x => x.EmailID, new { id = "EmailID", tabindex = "1", @readonly = "readonly", style="border:none", onfocus="this.blur()" })%>
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
                                                    <%:Html.LabelFor(x => x.Admin_HintQuestionID)%>
                                                </td>
                                                <td>
                                                    <%:Html.DropDownList("Admin_HintQuestionID", new SelectList(Model.HintQuestionsList, "HintQuestionID", "HintQuestion"), " --Select HintQuestion-- ", new { id = "Admin_HintQuestionID", tabindex = "4", Style = "font-size:13px;width:206px" })%>
                                                    <%:Html.ValidationMessageFor(x => x.Admin_HintQuestionID)%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <%:Html.LabelFor(x => x.Admin_Hint)%>
                                                </td>
                                                <td>
                                                    <%:Html.TextBoxFor(x => x.Admin_Hint, new { id = "Admin_Hint", tabindex = "5" })%>
                                                    <%:Html.ValidationMessageFor(x => x.Admin_Hint)%>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                              <%--  <tr>
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
                        <td style="width: 35%" valign="top" align="left">
                            <table width="100%">
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.Admin_FirstName)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.Admin_FirstName, new { tabindex = "6" })%>
                                        <%:Html.ValidationMessageFor(x => x.Admin_FirstName)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.Admin_MiddleName)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.Admin_MiddleName, new { tabindex = "7" })%>
                                        <%:Html.ValidationMessageFor(x => x.Admin_MiddleName)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.Admin_LastName)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.Admin_LastName, new { tabindex = "8" })%>
                                        <%:Html.ValidationMessageFor(x => x.Admin_LastName)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.Admin_Mobile)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.Admin_Mobile, new { tabindex = "9" })%>
                                        <%:Html.ValidationMessageFor(x => x.Admin_Mobile)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.Admin_HomePhone)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.Admin_HomePhone, new { tabindex = "10" })%>
                                        <%:Html.ValidationMessageFor(x => x.Admin_HomePhone)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.Admin_WorkPhone)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.Admin_WorkPhone, new { tabindex = "11" })%>
                                        <%:Html.ValidationMessageFor(x => x.Admin_WorkPhone)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.Admin_Address1)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.Admin_Address1, new { tabindex = "12" })%>
                                        <%:Html.ValidationMessageFor(x => x.Admin_Address1)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.Admin_Address2)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.Admin_Address2, new { tabindex = "13" })%>
                                        <%:Html.ValidationMessageFor(x => x.Admin_Address2)%>
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
                <input type="submit" value="Update" id="Admin_Update" class="Button" />
            </td>
        </tr>
    </table>
    <%} %>
</div>
<br />
