<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<GateAccess.Models.ForgotPasswordModel>" %>
<% using (Html.BeginForm("", "", FormMethod.Post, new { id = "Form_ForgotPassword", DefaultButton = "Btn_ForgotPassword" }))
   {
%>
<div>
    <h3>
        Forgot Password?</h3>
    reset your password, enter the email address you use to sign in to GateAccess.<br />
    <br />
    <div class="editor-label">
        <b>
            <%: Html.LabelFor(m => m.UserName)%></b>&nbsp; &nbsp;
        <%: Html.TextBoxFor(m => m.UserName, new { maxlength = 100 })%>
        <%: Html.ValidationMessageFor(m => m.UserName)%>
        <div id="Status">
        </div>
    </div>
    <br />
    <div>
        <input id="Btn_UserNameVerify" type="submit" value="Verify" class="Button" disabled="disabled" />
        <input id="Btn_ForgotPassword" type="submit" value="Reset" class="Button" disabled="disabled" />
    </div>
</div>
<%} %>