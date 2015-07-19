<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.HomeOwnersModel>" %>
<br />
<div id="Div_HomeOwnerDetails">
    <table width="80%" rules="all" align="center" style="border: 1px solid #000; font-size: 12px">
        <tr style="border: 1px solid #000000; height: 25px; background: #E6E6E6">
            <td colspan="2">
                <b>HomeOwner Details</b>
                <img align="right" id="homeOwnerDetailsClose" name="<%= Model.HomeOwnerID %>" src="<%: Url.Content("~/Images/close.png")%>"
                    alt="close" />
            </td>
        </tr>
        <tr>
            <td style="width: 55%" valign="top" align="left">
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
                                        <%:Html.TextBoxFor(x => x.EmailID, new { @readonly="readonly" })%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.HO_HintQuestion)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.HO_HintQuestion, new { @readonly = "readonly" })%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.HO_Hint)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.HO_Hint, new { @readonly = "readonly" })%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="vertical-align: top">
                                        <%:Html.LabelFor(x => x.HO_Directions)%>
                                    </td>
                                    <td>
                                        <%:Html.TextAreaFor(x => x.HO_Directions, new { style = "width: 200px;height: 150px;resize:none", @readonly = "readonly" })%>
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
            <td style="width: 45%" valign="top">
                <table width="100%">
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.HO_FirstName)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.HO_FirstName, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.HO_MiddleName)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.HO_MiddleName, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.HO_LastName)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.HO_LastName, new { @readonly = "readonly" })%>
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
                            <%:Html.EditorFor(x => x.HO_Mobile, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.HO_HomePhone)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.HO_HomePhone, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.HO_WorkPhone)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.HO_WorkPhone, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.HO_Address1)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.HO_Address1, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.HO_Address2)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.HO_Address2, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
<br />
