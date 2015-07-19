<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.CommunitiesModel>" %>
<%@ OutputCache Duration="86400" VaryByParam="none" %>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
    type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        OnLoad();
    });

    function OnLoad() {
        $("#CommunityName").focus();
    }

    $("#CommunityName").onblur(function () {
        alert('');
    }); 
    
</script>
<% using (Ajax.BeginForm("NewCommunity", "SuperAdministrator", null,
        new AjaxOptions
        {
            HttpMethod = "POST",
            InsertionMode = InsertionMode.Replace,
            UpdateTargetId = "createCommunityMessage",
            OnBegin = "createCommunityBegin",
            OnSuccess = "createCommunitySuccess",
            OnComplete = "",
            OnFailure = ""
        }, new { @id = "Form_NewCommunity" }))
   { %>
<div id="createCommunityMessage" class="error invisible">
</div>
<div id="newCommunityForm">
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
                                        <%:Html.TextBoxFor(x => x.CommunityName, new { style="width:230px", maxlength="100" })%>
                                        <%:Html.ValidationMessageFor(x => x.CommunityName)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top">
                                        <%:Html.LabelFor(x => x.CommunityAddress)%>
                                    </td>
                                    <td>
                                        <%:Html.TextAreaFor(x => x.CommunityAddress, new { style = "width: 230px;height: 80px;resize:none", maxlength="200" })%>
                                        <%:Html.ValidationMessageFor(x => x.CommunityAddress)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.City)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.City, new { style="width:230px", maxlength="50" })%>
                                        <%:Html.ValidationMessageFor(x => x.City)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.State)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.State, new { style="width: 230px", maxlength="50"})%>
                                        <%:Html.ValidationMessageFor(x => x.State)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.Country)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.Country, new { style = "width: 230px", maxlength="100" })%>
                                        <%:Html.ValidationMessageFor(x => x.Country)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.Zip)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.Zip, new { style = "width: 230px", maxlength="12" })%>
                                        <%:Html.ValidationMessageFor(x => x.Zip)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.CommunityPhone1)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.CommunityPhone1, new { style = "width: 230px", maxlength="20", @class="phone" })%>
                                        <%:Html.ValidationMessageFor(x => x.CommunityPhone1)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.CommunityPhone2)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.CommunityPhone2, new { placeholder = ViewData.ModelMetadata.Watermark, style = "width: 230px", maxlength = "20", @class = "phone" })%>
                                        <%:Html.ValidationMessageFor(x => x.CommunityPhone2)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.CommunityEmail)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.CommunityEmail, new { style = "width: 230px", maxlength = "100", @class="emial" })%>
                                        <%:Html.ValidationMessageFor(x => x.CommunityEmail)%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <%:Html.LabelFor(x => x.TotalUnits)%>
                                    </td>
                                    <td>
                                        <%:Html.TextBoxFor(x => x.TotalUnits, new { style = "width: 230px", maxlength = "3", @class = "nonzeronumeric", value='1' })%>
                                        <%:Html.ValidationMessageFor(x => x.TotalUnits)%>
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
                            <table width="100%">
                                <% foreach (var Item in (IEnumerable<GateAccess.Models.MenuOptions>)Model.MenuOptionsList)
                                   { %>
                                <tr>
                                    <td>
                                        <input type="checkbox" id="menuOption<%=Item.MenuOptionID%>" name="SelectedMenuOptions"
                                            value="<%=Item.MenuOptionID%>" />
                                        <label for="menuOption<%=Item.MenuOptionID%>">
                                            <%=Item.MenuOptionName%></label><br />                                      
                                        <%} %>
                                    </td>
                                </tr>
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
                            <%:Html.DropDownList("MaxGates", new SelectList((IEnumerable)Model.MaxGatesList, "value", "key"), new { style = "font-size:12px" })%>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <%}%>
</div>
