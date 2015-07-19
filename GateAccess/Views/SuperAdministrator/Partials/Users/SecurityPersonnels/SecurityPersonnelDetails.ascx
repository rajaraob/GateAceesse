<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.SecurityPersonnelsModel>" %>
<br />
<div id="Div_SecurityPersonDetails">
    <table width="80%" rules="all" style="border: 1px solid #000; font-size: 12px" align="center">
        <tr style="border: 1px solid #000000; height: 25px; background: #E6E6E6">
            <td colspan="2">
                <b>SecurityPersonnel Details</b>
                <img align="right" id="securityPersonnelDetailsClose" name="<%= Model.SecurityPersonnelID %>"
                    src="<%: Url.Content("~/Images/close.png")%>" alt="close" />
            </td>
        </tr>
        <tr>
            <td style="width: 50%" valign="top">
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
                                        <%:Html.TextBoxFor(x => x.EmailID, new { @readonly="readonly" })%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.SP_HintQuestion)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.SP_HintQuestion, new { @readonly = "readonly" })%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.SP_Hint)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.SP_Hint, new { @readonly = "readonly" })%>
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
                            <%:Html.LabelFor(x => x.SP_FirstName)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.SP_FirstName, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.SP_MiddleName)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.SP_MiddleName, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.SP_LastName)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.SP_LastName, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.SP_Mobile)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.SP_Mobile, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.SP_HomePhone)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.SP_HomePhone, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.SP_WorkPhone)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.SP_WorkPhone, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.SP_Address1)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.SP_Address1, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.SP_Address2)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.SP_Address2, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
<br />
