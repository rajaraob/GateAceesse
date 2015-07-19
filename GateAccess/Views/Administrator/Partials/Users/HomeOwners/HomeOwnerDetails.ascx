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
                            <%:Html.LabelFor(x => x.HintQuestion)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.HintQuestion, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Hint)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.Hint, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="vertical-align: top">
                            <%:Html.LabelFor(x => x.Directions)%>
                        </td>
                        <td>
                            <%:Html.TextAreaFor(x => x.Directions, new { style = "width: 200px;height: 150px;resize:none", @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 45%" valign="top">
                <table width="100%">
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.FirstName)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.FirstName, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.MiddleName)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.MiddleName, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.LastName)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.LastName, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <%--<tr>
                                <td>
                                    <%:Html.LabelFor(x => x.Gender)%>
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
                            <%:Html.LabelFor(x => x.Mobile)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.Mobile, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.HomePhone)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.HomePhone, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.WorkPhone)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.WorkPhone, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Address1)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.Address1, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Address2)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.Address2, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.City)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.City, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Zip)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.Zip, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.State)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.State, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Country)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.Country, new { @readonly = "readonly" })%>
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
    </table>
</div>
<br />
