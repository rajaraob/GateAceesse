<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.MVVM.EditHomeOwnerModel>" %>
<%@ Import Namespace="System.Collections.Generic" %>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
    type="text/javascript"></script>
<script type="text/javascript">
    $("#HO_HintQuestionID").change(function () {
        var hohqid = $("#HO_HintQuestionID").val();
        if (hohqid != null && hohqid > 0) {
            $(document).find("#HO_Hint").removeAttr("disabled");
        }
        else {
            $(document).find("#HO_Hint").val(" ");
            $(document).find("#HO_Hint").prop("disabled", "disabled");
        }
    });
</script>
<br />
<% using (Ajax.BeginForm("UpdateHomeOwner", "SuperAdministrator", null,
        new AjaxOptions
        {
            UpdateTargetId = "editHomeOwnerMessage",
            InsertionMode = InsertionMode.Replace,
            HttpMethod = "POST",
            OnSuccess = "editHomeOwnerSuccess",
            OnBegin = "editHomeOwnerBegin",
            OnComplete = "editHomeOwnerComplete"
        }, new { @id = "Form_EditHomeOwner" }))
   { %>
<div id="editHomeOwnerMessage" class="error invisible">
</div>
<div id="editHomeOwnerForm">
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
                                                    <%:Html.HiddenFor(x => x.CommunityID)%>
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
                                                    <%:Html.LabelFor(x => x.HO_HintQuestion)%>
                                                </td>
                                                <td>
                                                    <%:Html.DropDownList("HO_HintQuestionID", new SelectList((Model.HintQuestionsList), "HintQuestionID", "HintQuestion"), " -- Select HintQuestion -- ", new {  tabindex = "4", Style = "font-size:13px;width:206px" })%>
                                                    <%:Html.ValidationMessageFor(x => x.HO_HintQuestion)%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <%:Html.LabelFor(x => x.HO_Hint)%>
                                                </td>
                                                <td>
                                                    <%:Html.TextBoxFor(x => x.HO_Hint, new { tabindex = "5"})%>
                                                    <%:Html.ValidationMessageFor(x => x.HO_Hint)%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="vertical-align: top">
                                                    <%:Html.LabelFor(x => x.HO_Directions)%>
                                                </td>
                                                <td>
                                                    <%:Html.TextAreaFor(x => x.HO_Directions, new { tabindex = "12", style = "width: 200px;height: 150px;resize:none", maxlength = "999"})%>
                                                    <div id="Div_charNum">
                                                        999 Characters Only.
                                                    </div>
                                                    <%:Html.ValidationMessageFor(x => x.HO_Directions)%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <br />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <%--<tr>
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
                        <td style="width: 45%" valign="top">
                            <table width="100%">
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.HO_FirstName)%>
                                    </td>
                                    <td>
                                        <%:Html.EditorFor(x => x.HO_FirstName, new { tabindex = "1" })%>
                                        <%:Html.ValidationMessageFor(x => x.HO_FirstName)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.HO_MiddleName)%>
                                    </td>
                                    <td>
                                        <%:Html.EditorFor(x => x.HO_MiddleName, new { tabindex = "2" })%>
                                        <%:Html.ValidationMessageFor(x => x.HO_MiddleName)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.HO_LastName)%>
                                    </td>
                                    <td>
                                        <%:Html.EditorFor(x => x.HO_LastName, new { tabindex = "3" })%>
                                        <%:Html.ValidationMessageFor(x => x.HO_LastName)%>
                                    </td>
                                </tr>
                                <%--<tr>
                                <td>
                                    <%:Html.LabelFor(x => x.HO_Gender)%>
                                </td>
                                <td>
                                    <%= Html.RadioButton("Gender", "Male", false) %>
                                    Male
                                    &nbsp;&nbsp;
                                    <%= Html.RadioButton("Gender", "Female", false)%>
                                    Female
                                    <br />
                                </td>
                            </tr>--%>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.HO_Mobile)%>
                                    </td>
                                    <td>
                                        <%:Html.EditorFor(x => x.HO_Mobile, new { tabindex = "4" })%>
                                        <%:Html.ValidationMessageFor(x => x.HO_Mobile)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.HO_HomePhone)%>
                                    </td>
                                    <td>
                                        <%:Html.EditorFor(x => x.HO_HomePhone, new { tabindex = "5" })%>
                                        <%:Html.ValidationMessageFor(x => x.HO_HomePhone)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.HO_WorkPhone)%>
                                    </td>
                                    <td>
                                        <%:Html.EditorFor(x => x.HO_WorkPhone, new { tabindex = "6" })%>
                                        <%:Html.ValidationMessageFor(x => x.HO_WorkPhone)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.HO_Address1)%>
                                    </td>
                                    <td>
                                        <%:Html.EditorFor(x => x.HO_Address1, new { tabindex = "7" })%>
                                        <%:Html.ValidationMessageFor(x => x.HO_Address1)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.HO_Address2)%>
                                    </td>
                                    <td>
                                        <%:Html.EditorFor(x => x.HO_Address2, new { tabindex = "8" })%>
                                        <%:Html.ValidationMessageFor(x => x.HO_Address2)%>
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
                <input type="submit" value="Update" id="HomeOwner_Update" class="Button" />
            </td>
        </tr>
    </table>
    <%} %>
</div>
