<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<script type="text/javascript" language="javascript">
    $(document).ready(function () {
        $("#Communities").change(function () {
            $("#homeownersinfo").html('');
            $("#NewVisitor").css("visibility", "hidden");
            if ($(this).val() != "") {
                var ddlsource = "#Communities";
                var ddltarget = "#HomeOwners";
                $(ddltarget).empty();
                $("#loader").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader-small.gif")%>" /></div>');
                var url = '<%= Url.Content("~/") %>' + "SuperAdministrator/CommunityHouseOwners/?communityid=" + $('#Communities').val();

                $.getJSON(url, {}, function (data) {
                    if (data != '') {
                        $(ddltarget).empty();
                        $(ddltarget).removeAttr("disabled");
                        $(ddltarget).append("<option value=''>-- Select HomeOwner --</option>");
                        $.each(data, function (index, optionData) {
                            $(ddltarget).append("<option value='" + optionData.Value + "'>" + optionData.Text + "</option>");
                        });
                    }
                    else {
                        $(ddltarget).empty();
                        $(ddltarget).attr("disabled", "disabled");
                        $("#homeownersinfo").html('No HomeOwners in this Community.');
                    } $("#loader").empty();
                });

            } else {
                $("#HomeOwners").each(function () {
                    $(this).empty();
                });
                $("#HomeOwners").attr("disabled", "disabled");
            }
        });
    });
    $(document).ready(function () {
        $("#HomeOwners").change(function () {
            if ($(this).val() != "") {
                $("#VisitorsList").html('<div align="center"><img src="<%: Url.Content("~/Images/ajax-loader.gif")%>" /></div>');
                $("#VisitorsList").load("/SuperAdministrator/VisitorsList/?communityid=" + $("#Communities").val() + "&homeOwnerid=" + $("HomeOwners").val());
            }
            else {
                $("#VisitorForm").empty();
            }
        });
    });
    function DetailsClean() {
        $("#VisitorDetails").empty();
    }

    function EditClean() {
        $("#EditVisitor").empty();
    }
        
</script>
<br />
<div>
    <fieldset>
        <legend>Visitors List</legend>
        <br />
        <table width="100%">
            <tr>
                <td width="48%" style="text-align: left">
                    <b>Communities : </b>
                    <%:Html.DropDownList("Communities", new SelectList((IEnumerable)ViewBag.CommunitiesList, "CommunityID", "CommunityName"), ((List<GateAccess.Models.CommunitiesModel>)ViewBag.CommunitiesList).Count > 0 ? "-- Select Community --" : "-- No Communities --", new { style = "font-size:12px;width:300px" })%>
                </td>
                <td width="4%">
                    <span id="loader"></span>
                </td>
                <td width="30%" style="text-align: right">
                    <b>HomeOwners :</b>
                    <select id="HomeOwners" disabled="disabled" style="width: 200px; font-size: 12px">
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                </td>
                <td style="text-align: right">
                    <span id="homeownersinfo" style="color: #FF0000"></span>
                </td>
            </tr>
        </table>
        <br />
        <div id="Div_ActionInformation" align="right">
        </div>
        <br />
        <div id="Div_VisitorsList">
        </div>
    </fieldset>
</div>
