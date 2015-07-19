<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.AccountModel>" %>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
    type="text/javascript"></script>
<script type="text/javascript">

    $(document).on("click", "#Btn_Clear", function () {
        $(document).find(':input').each(function () {
            switch (this.type) {
                case 'password':
                case 'select-multiple':
                case 'select-one':
                case 'text':
                case 'textarea':
                    $(this).val('');
                    break;
                case 'checkbox':
                case 'radio':
                    if (this.name != "RoleID")
                        this.checked = false;
            }
        });
        OnLoad();
    });

    function OnLoad() {
        $("#UserName").focus();
        document.title = "GA :: LogOn";
        $("#LogOnInfo").html('');
    }

    $("#Form_Login").bind("keypress", function (e) {
        KCode = e.keyCode || e.charCode;
        if (KCode == 13) {
            var defaultbutton = $(this).attr("DefaultButton");
            $("#" + defaultbutton).click();
            return false;
        }
    });    
    
</script>
<%if (ViewBag.errors != null)
  { %>
<div id="LogOnInfo" style="color: Red; font-weight: bold">
    <%
      Dictionary<String, String> tempErrors = (Dictionary<String, String>)ViewBag.errors;
      foreach (var error in tempErrors)
      {
          Response.Write(error.Value);
          Response.Write("\n");
      }
    %>
</div>
<%} %>
<% using (Html.BeginForm("", "", FormMethod.Post, new { id = "Form_Login", DefaultButton = "LoginSubmit" }))
   {       
%>
<div style="width: 350px; margin: 0 auto;">
    <fieldset style="background: #F2F2F2">
        <legend class="loginlegend">LogOn</legend>
        <br />
        <div class="editor-label">
            <b>
                <%: Html.LabelFor(m => m.UserName)%></b>&nbsp; &nbsp;
            <%: Html.TextBoxFor(m => m.UserName, new { maxlength = 100, style = "height:25px;width:275px;font-size:15px" })%>
            <%: Html.ValidationMessageFor(m => m.UserName)%>
            <br />
            <span style="color: Gray; font-style: italic; font-size: 14px">ex : someone@example.com</span>
        </div>
        <br />
        <div class="editor-label">
            <b>
                <%: Html.LabelFor(m => m.Password)%></b>&nbsp; &nbsp; &nbsp;
            <%: Html.PasswordFor(m => m.Password, new { maxlength = 20, style = "height:25px;width:275px;font-size:17px"})%>
            <%: Html.ValidationMessageFor(m => m.Password)%>
        </div>
        <br />
        <br />
        <div>
            <input id="LoginSubmit" type="submit" value="Log On" class="Button" />&nbsp;&nbsp;
            <input id="Btn_Clear" type="button" value="Clear" class="Button" /></div>       
        <br />
        <%--<div class="editor-label" style="color: Black">
            <%: Html.CheckBoxFor(m => m.RememberMe)%>
            <%: Html.LabelFor(m => m.RememberMe)%>
        </div>--%>
        <br />
        <div>
            <label id="Lnk_NeedHelp" onmouseover="this.style.textDecoration='underline'" onmouseout="this.style.textDecoration='none'"
                style="color: Blue; cursor: pointer; text-decoration: none">
                Need Help?</label>
        </div>
    </fieldset>
</div>
<% } %>