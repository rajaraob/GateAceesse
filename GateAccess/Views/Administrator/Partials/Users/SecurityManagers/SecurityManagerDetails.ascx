<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.SecurityManagersModel>" %>
<br />
<div id="Div_SecurityManagerDetails" >
    <table width="80%" rules="all" style="border: 1px solid #000; font-size: 12px" align="center">
        <tr style="border: 1px solid #000000; height: 25px; background: #E6E6E6">
            <td colspan="2">
                <b>SecurityManager Details</b>
                <img align="right" id="securityManagerDetailsClose" name="<%= Model.SecurityManagerID %>"
                    src="<%: Url.Content("~/Images/close.png")%>" alt="close" />
            </td>
        </tr>
        <tr>
            <td style="width: 40%" valign="top">
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
                </table>
            </td>
            <td style="width: 40%" valign="top">
                <table width="100%">
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.FirstName)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.FirstName, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.MiddleName)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.MiddleName, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.LastName)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.LastName, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Mobile)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.Mobile, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.HomePhone)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.HomePhone, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.WorkPhone)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.WorkPhone, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Address1)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.Address1, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Address2)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.Address2, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.City)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.City, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Zip)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.Zip, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.State)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.State, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Country)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.Country, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
<br />
