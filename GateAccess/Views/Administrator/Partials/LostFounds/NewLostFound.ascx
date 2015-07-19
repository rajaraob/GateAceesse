<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.LostFoundsModel>" %>
<script type="text/javascript">
    $(document).ready(function () {
        OnLoad();
    });
</script>
<div>
    <fieldset>
        <legend>Lost/Found</legend>
        <br />
        <% using (Html.BeginForm("", "", FormMethod.Post, new { id = "Form_NewLostFound" }))
           { %>
        <%: Html.ValidationSummary(true, "Saving was unsuccessful.")%>
        <table width="100%">
            <tr>
                <td>
                    <%: Html.HiddenFor(x => x.CommunityID) %>
                </td>
            </tr>
            <tr>
                <td>
                    <%:Html.LabelFor(x => x.LostWhat)%>
                </td>
                <td>
                    <%:Html.EditorFor(x => x.LostWhat, new { style = "width: 300px;" })%>
                    <%:Html.ValidationMessageFor(x => x.LostWhat)%>
                </td>
            </tr>
            <tr>
                <td>
                    <%:Html.LabelFor(x => x.LostWhen)%>
                </td>
                <td>
                    <%:Html.EditorFor(x => x.LostWhen, new { style = "width: 300px;" })%>
                    <%:Html.ValidationMessageFor(x => x.LostWhen)%>
                </td>
            </tr>
            <tr>
                <td>
                    <%:Html.LabelFor(x => x.LostAt)%>
                </td>
                <td>
                    <%:Html.EditorFor(x => x.LostAt, new { style = "width: 300px;" })%>
                    <%:Html.ValidationMessageFor(x => x.LostAt)%>
                </td>
            </tr>
            <tr>
                <td>
                    <%:Html.LabelFor(x => x.FoundWhat)%>
                </td>
                <td>
                    <%:Html.EditorFor(x => x.FoundWhat, new { style = "width: 300px;" })%>
                    <%:Html.ValidationMessageFor(x => x.FoundWhat)%>
                </td>
            </tr>
            <tr>
                <td>
                    <%:Html.LabelFor(x => x.FoundWhen)%>
                </td>
                <td>
                    <%:Html.EditorFor(x => x.FoundWhen, new { style = "width: 300px;" })%>
                    <%:Html.ValidationMessageFor(x => x.FoundWhen)%>
                </td>
            </tr>
            <tr>
                <td>
                    <%:Html.LabelFor(x => x.FoundAt)%>
                </td>
                <td>
                    <%:Html.EditorFor(x => x.FoundAt, new { style = "width: 300px;" })%>
                    <%:Html.ValidationMessageFor(x => x.FoundAt)%>
                </td>
            </tr>
            <tr>
                <td>
                    <%:Html.LabelFor(x => x.Description)%>
                </td>
                <td>
                    <%:Html.TextAreaFor(x => x.Description, new { style = "width: 302px;height: 120px" })%>
                    <%:Html.ValidationMessageFor(x => x.Description)%>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td align="justify">
                    <input type="submit" class="Button" style="height: 40px; width: 70px" value="Save" />
                    <input type="button" class="Button" onclick="Clear(this.form)" value="Clear" />
                </td>
            </tr>
        </table>
        <%}%>
    </fieldset>
</div>
