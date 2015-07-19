<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<GateAccess.Models.CommunitiesModel>>" %>
<% Int32 opCommunityID = 0;
   if (Session["NewCommunityID"] != null)
   {
       Int32.TryParse(Session["NewCommunityID"].ToString(), out opCommunityID);
       Session.Remove("NewCommunityID");
   }

   if (Session["UpdatedCommunityID"] != null)
   {
       Int32.TryParse(Session["UpdatedCommunityID"].ToString(), out opCommunityID);
       Session.Remove("UpdatedCommunityID");
   }


   if (Model != null && Model.Count() > 0)
   {       
%>
<div class="divTable-body">
    <div class="divTable-headerRow">
        <div class="divTable-headerCell" style="width: 5%;">
            &nbsp;
        </div>
        <div class="divTable-headerCell" style="width: 20%">
            Community Name
        </div>
        <div class="divTable-headerCell" style="width: 15%">
            City
        </div>
        <div class="divTable-headerCell" style="width: 10%">
            Country
        </div>
        <div class="divTable-headerCell" style="width: 15%">
            Phone1
        </div>
        <div class="divTable-headerCell" style="width: 25%">
            Email
        </div>
        <div align="center" class="divTable-headerCell" style="width: 5%">
            &nbsp;&nbsp;
            <input type="checkbox" id="CheckAll" title="Select All" />
        </div>
    </div>
    <% foreach (var Item in Model)
       {
           String style = null;
           if (opCommunityID != null && Item.CommunityID == opCommunityID)
               style = "style = 'background-color: #F5ECCE'";           
    %>
    <div id="community<%=Item.CommunityID%>" class="divTable-row" <%=style%>>
        <div align="center" style="width: 5%; text-align: center" class="divTable-editCell">
            <img id="EditCommunity" name="<%=Item.CommunityID%>" class="editCommunity" style="cursor: pointer"
                src="<%: Url.Content("~/Images/edit.png")%>" alt="Edit" onmousedown="editclick(this)"
                onmouseup="unclickedit(this)" />
        </div>
        <div style="width: 20%" class="divTable-labelCell">
            &nbsp;&nbsp;<%= Item.CommunityName%>
        </div>
        <div style="width: 15%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.City%>
        </div>
        <div style="width: 10%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.Country%>
        </div>
        <div style="width: 15%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.CommunityPhone1%>
        </div>
        <div style="width: 25%" class="divTable-labelCell">
            &nbsp; &nbsp;
            <%= Item.CommunityEmail%>
        </div>
        <div align="center" style="width: 5%; text-align: center" class="divTable-labelCell">
            <input name="CommunitiesToDelete" id="CommunitiesToDelete" type="checkbox" value="<%=Item.CommunityID%>" />
        </div>
    </div>
    <%}%>
</div>
<div align="right">
    <input type="submit" id="Btn_DeleteCommunities" disabled="disabled" value="Delete Communitie(s)" />
</div>
<div id="Div_EditCommunity" style="height: auto;">
</div>
<%
   }
   else
   {%><br />
<span style="color: #FF0000">No Communities were Registered..</span>
<%} %>