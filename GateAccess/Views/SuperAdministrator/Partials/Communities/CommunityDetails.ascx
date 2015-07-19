<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.CommunitiesModel>" %>
<%@ OutputCache Duration="86400" VaryByParam="none" %>
<br />
<div id="communityDetails">
    <table width="70%" align="center" style="border: 1px solid #000000;">
        <tr style="border: 1px solid #000000; height: 25px; background: #E6E6E6">
            <td>
                <b>Community Details</b>
                <img align="right" id="CommunityDetailsClose" name="<%= Model.CommunityID %>" src="<%: Url.Content("~/Images/close.png")%>"
                    alt="close" />
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" style="border: 1px solid #000000; font-size: 12px" rules="all">
                    <tr>
                        <td style="width: 60%;" valign="top">
                            <table width="100%" rules="all">
                                <tr style="font-weight: bold; height: 30px">
                                    <td style="background-color: #f3f3f3; text-align: center">
                                        Community Details
                                    </td>
                                </tr>
                                <tr>
                                    <td width="60%" valign="top">
                                        <table width="100%">
                                            <tr>
                                                <td align="right" width="30%">
                                                    <%:Html.LabelFor(x => x.CommunityName)%>
                                                </td>
                                                <td width="70%">
                                                    <%:Html.DisplayFor(x => x.CommunityName, new { style="width:230px", maxlength="100" })%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top">
                                                    <%:Html.LabelFor(x => x.CommunityAddress)%>
                                                </td>
                                                <td>
                                                    <%:Html.TextAreaFor(x => x.CommunityAddress, new { style = "width: 230px;height: 80px;resize:none", maxlength = "200", @readonly = "readonly" })%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <%:Html.LabelFor(x => x.City)%>
                                                </td>
                                                <td>
                                                    <%:Html.DisplayFor(x => x.City, new { style="width:230px", maxlength="50" })%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <%:Html.LabelFor(x => x.State)%>
                                                </td>
                                                <td>
                                                    <%:Html.DisplayFor(x => x.State, new { style="width: 230px", maxlength="50"})%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <%:Html.LabelFor(x => x.Country)%>
                                                </td>
                                                <td>
                                                    <%:Html.DisplayFor(x => x.Country, new { style = "width: 230px", maxlength="100" })%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <%:Html.LabelFor(x => x.Zip)%>
                                                </td>
                                                <td>
                                                    <%:Html.DisplayFor(x => x.Zip, new { style = "width: 230px", maxlength="12" })%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <%:Html.LabelFor(x => x.CommunityPhone1)%>
                                                </td>
                                                <td>
                                                    <%:Html.DisplayFor(x => x.CommunityPhone1, new { style = "width: 230px", maxlength="20" })%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <%:Html.LabelFor(x => x.CommunityPhone2)%>
                                                </td>
                                                <td>
                                                    <%:Html.DisplayFor(x => x.CommunityPhone2, new { style = "width: 230px", maxlength = "20" })%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <%:Html.LabelFor(x => x.CommunityEmail)%>
                                                </td>
                                                <td>
                                                    <%:Html.DisplayFor(x => x.CommunityEmail, new { style = "width: 230px", maxlength = "100" })%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <%:Html.LabelFor(x => x.TotalUnits)%>
                                                </td>
                                                <td>
                                                    <%:Html.DisplayFor(x => x.TotalUnits, new { style = "width: 230px", maxlength = "3" })%>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td width="40%" valign="top" align="center">
                            <table width="100%" rules="all">
                                <tr style="font-weight: bold; height: 30px">
                                    <td style="background-color: #f3f3f3; text-align: center; font-weight: bold">
                                        MenuOptions
                                    </td>
                                </tr>
                                <tr style="height: 225px">
                                    <td valign="top">
                                        <table>
                                            <% String[] menuOptions = Model.MenuOptions.Split(',');
                                               var boolChecked = "";
                                               foreach (var Item in (IEnumerable<GateAccess.Models.MenuOptions>)Model.MenuOptionsList)
                                               { 
                                            %>
                                            <tr>
                                                <td>
                                                    <% if (menuOptions.Contains(Item.MenuOptionID.ToString()))
                                                           boolChecked = "checked";
                                                       else
                                                           boolChecked = "";
                                                    %>
                                                    <input type="checkbox" id="menuOption<%=Item.MenuOptionID%>" name="SelectedMenuOptions"
                                                        <%=boolChecked%> value="<%=Item.MenuOptionID%>" disabled="disabled" />
                                                    <label for="menuOption<%=Item.MenuOptionID%>">
                                                        <%=Item.MenuOptionName%></label><br />
                                                </td>
                                            </tr>
                                            <%} %>
                                        </table>
                                    </td>
                                </tr>
                                <tr style="font-weight: bold; height: 30px">
                                    <td style="background-color: #f3f3f3; text-align: center; font-weight: bold">
                                        Gates / Entrances
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br />
                                        Total Count:
                                        <%:Html.DisplayFor(x => x.MaxGates)%>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
<br />
