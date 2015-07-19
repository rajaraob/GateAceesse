<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.VisitorsModel>" %>
<script type="text/javascript" language="javascript">
    communityid = $("#CommunitiesModel").val();
    $(document).ready(function () {
        $("#VisitorForm").submit(function (e) {
            e.preventDefault();
            VisitorRegistration($(this));
        });
    });

    function VisitorRegistration(form) {
        $.ajax({
            cache: false,
            async: true,
            url: "/SuperAdministrator/VisitorRegistration/?communityid=" + communityid,
            type: form.method,
            data: $(form).serialize(),
            success: function (data) { alert(data); },
            error: function (data) { alert(data); }
        });
    }

    function ajaxSuccess(data) {
        //        $("#ActionInformation").html("<br/>Visitor Registered Successfully..");
        //        $("#VisitorsList").empty();
        //        $("#VisitorsList").load("/SuperAdministrator/VisitorsListPartial");
    }

    function ajaxError(errdata) {

    }

    $(document).ready(function () {
        OnLoad();
    });    

</script>
<% Dictionary<String, String> dictionary = new Dictionary<String, String>();
   dictionary.Add("-- Select --", "0");
   dictionary.Add("Friend", "1");
   dictionary.Add("Relative", "2");
   SelectList list = new SelectList(dictionary, "value", "key", "0");

   Dictionary<String, String> dictionary1 = new Dictionary<String, String>();
   dictionary1.Add("-- Select --", "0");
   dictionary1.Add("Will Visit", "1");
   dictionary1.Add("Visited", "2");
   dictionary1.Add("cancel", "3");
   SelectList Status1 = new SelectList(dictionary1, "value", "key", "0"); 
%>
<% using (Html.BeginForm("", "", FormMethod.Post, new { id = "VisitorForm" }))
   {
%>
<fieldset>
    <legend>Visitor Registration</legend>
    <br />
    <table width="100%" align="center" rules="all">
        <tr>
            <td width="50%">
                <table width="100%">
                    <tr>
                        <td style="text-align: right; font-weight: bold">
                            <%:Html.LabelFor(x => x.VisitorName)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.VisitorName, new { tabindex = 1 , required="required"})%>
                            <%:Html.ValidationMessageFor(x => x.VisitorName)%>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; font-weight: bold">
                            <%:Html.LabelFor(x => x.VisitorType)%>
                        </td>
                        <td>
                            <%:Html.DropDownList("VisitorType", list, new { name = "VisitorType", tabindex = "2", style = "width: 205px;font-size:12px", required = "required" })%>
                            <%--<%=Html.DropDownList("VisitorType", 
                                                          new SelectList(new List<String>() {"-- Select --", "Friend", "Relative"}),
                                                          new { onchange = "onSelectedIndexChanged()", tabindex = 2, style = "width: 205px" })%>--%>
                            <%:Html.ValidationMessageFor(x => x.VisitorType)%>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; font-weight: bold">
                            <%:Html.LabelFor(x => x.VisitingDate)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.VisitingDate, new { tabindex = 3, required = "required" })%>
                            <%:Html.ValidationMessageFor(x => x.VisitingDate)%>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; font-weight: bold">
                            <%:Html.LabelFor(x => x.MobileNo)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.MobileNo, new { tabindex = 3, required = "required" })%>
                            <%:Html.ValidationMessageFor(x => x.MobileNo)%>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; font-weight: bold">
                            <%:Html.LabelFor(x => x.EmailID)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.EmailID, new { tabindex = 3, required = "required" })%>
                            <%:Html.ValidationMessageFor(x => x.EmailID)%>
                        </td>
                    </tr>
                    <%-- <tr>
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
                        <td style="text-align: right; font-weight: bold">
                            <%:Html.LabelFor(x => x.VisitingTo)%>
                        </td>
                        <td>
                            <%:Html.EditorFor(x => x.VisitingTo, new { tabindex = 4, required = "required" })%>
                            <%:Html.ValidationMessageFor(x => x.VisitingTo)%>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="50%">
                <table width="100%">
                    <tr>
                        <td style="text-align: right; font-weight: bold; vertical-align: top">
                            <%:Html.LabelFor(x => x.Comments)%>
                        </td>
                        <td>
                            <%:Html.TextAreaFor(x => x.Comments, new { style = "width: 202px;height: 100px;resize:none", tabindex = 5 })%>
                            <%:Html.ValidationMessageFor(x => x.Comments)%>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; font-weight: bold">
                            <%:Html.LabelFor(x => x.Status)%>
                        </td>
                        <td>
                            <%:Html.DropDownList("Status", Status1, new { name = "Status", tabindex = "6", style = "width: 205px;font-size:12px", required = "required" })%>
                            <%--<%=Html.DropDownList("Status",
                                                          new SelectList(new List<String>() { "-- Select --", "Will Visit", "Visited", "cancel" }),
                                                          new { onchange = "onSelectedIndexChanged()", tabindex = 6, style = "width: 205px" })%>--%>
                            <%:Html.ValidationMessageFor(x => x.Status)%>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br />
                            <span style="color: #FF0000">* </span>These fields are Mandatory.
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <hr />
    <table width="100%" align="center">
        <tr>
            <td style="text-align: center">
                <input type="submit"  class="Button" value="Register" tabindex="7" style="height: 40px; width: 80px" />
                <input type="button" onclick="Clear(this.form)" value="Clear" style="height: 40px;
                    width: 70px; font-size: 16px" />
            </td>
        </tr>
    </table>
</fieldset>
<% }
%>