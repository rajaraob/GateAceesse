<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.ServiceProvidersModel>" %>
<br />
<div id="Div_ServiceProviderDetails">
    <table width="80%" rules="all" style="border: 1px solid #000; font-size: 12px" align="center">
        <tr style="border: 1px solid #000000; height: 25px; background: #E6E6E6">
            <td colspan="2">
                <b>ServiceProvider Details</b>
                <img align="right" id="serviceProviderDetailsClose" name="<%= Model.ServiceProviderID %>"
                    src="<%: Url.Content("~/Images/close.png")%>" alt="close" />
            </td>
        </tr>
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
                            <%:Html.TextBoxFor(x => x.EmailID, new { @readonly = "readonly" })%>
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
            <td style="width: 50%" valign="top">
                <table width="100%">
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Name)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.Name, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Address)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.Address, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Phone1)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.Phone1, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Phone2)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.Phone2, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.ReferredBy)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.ReferredBy, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.ServiceTypes)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.ServiceTypes, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Specialization)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.Specialization, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.ContactPerson)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.ContactPerson, new { @readonly = "readonly" })%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <%:Html.LabelFor(x => x.Rating)%>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(x => x.Rating, new { @readonly = "readonly" })%>
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
