<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<style type="text/css">
    .RolesListLable
    {
        font-weight: bold;
        cursor: pointer;
    }
</style>
<table width="100%">
    <tr style="text-align: right">
        <td width="8%">
            <b>Roles :</b>
        </td>
        <td width="70%">
            <table width="100%" id="RolesTable">
                <tr style="text-align: center">
                    <td id="role2" class="RolesTableCell">
                        <input type="radio" name="RoleID" id="adminRoleID" onclick="loadPartial(this.value)"
                            value="2" style="width: 40;" />
                        <label for="adminRoleID" class="RolesListLable">
                            Administrator</label>&nbsp;<%if (ViewBag.AdministratorsCount != null)
                                                         {%><span style="color: #2F9C1F">(<%
                                                             Response.Write(ViewBag.AdministratorsCount.ToString());%>)</span><%
                                                         }
                                                         else
                                                         {%>
                        <span style="color: #FF0000">(0)</span>
                        <%}%>
                    </td>
                    <td id="role3" class="RolesTableCell">
                        <input type="radio" name="RoleID" id="smRoleID" onclick="loadPartial(this.value)"
                            value="3" style="width: 40;" />
                        <label for="smRoleID" class="RolesListLable">
                            SecurityManager</label>&nbsp;<%if (ViewBag.SecurityManagersCount != null)
                                                           {%><span style="color: #2F9C1F">(<%
                                                               Response.Write(ViewBag.SecurityManagersCount.ToString());%>)</span><%
                                                           }
                                                           else
                                                           {%>
                        <span style="color: #FF0000">(0)</span>
                        <%}%>
                    </td>
                    <td id="role4" class="RolesTableCell">
                        <input type="radio" name="RoleID" id="spRoleID" onclick="loadPartial(this.value)"
                            value="4" style="width: 40;" />
                        <label for="spRoleID"  class="RolesListLable">
                            SecurityPersonnel</label>&nbsp;<%if (ViewBag.SercurityPersonsCount != null)
                                                          {%><span style="color: #2F9C1F">(<%
                                                              Response.Write(ViewBag.SercurityPersonsCount.ToString());%>)</span><%
                                                          }
                                                          else
                                                          {%>
                        <span style="color: #FF0000">(0)</span>
                        <%}%>
                    </td>
                    <td id="role5" class="RolesTableCell">
                        <input type="radio" name="RoleID" id="hoRoleID" onclick="loadPartial(this.value)"
                            value="5" style="width: 40;" />
                        <label for="hoRoleID" class="RolesListLable">
                            HomeOwner</label>&nbsp;<%if (ViewBag.HomeOwnersCount != null)
                                                     {%><span style="color: #2F9C1F">(<%
                                                         Response.Write(ViewBag.HomeOwnersCount.ToString());%>)</span><%
                                                     }
                                                     else
                                                     {%>
                        <span style="color: #FF0000">(0)</span>
                        <%}%>
                    </td>
                    <td id="role6" class="RolesTableCell">
                        <input type="radio" name="RoleID" id="srpRoleID" onclick="loadPartial(this.value)"
                            value="6" style="width: 40;" />
                        <label for="srpRoleID" class="RolesListLable">
                            ServiceProvider</label>&nbsp;<%if (ViewBag.ServiceProvidersCount != null)
                                                           {%><span style="color: #2F9C1F">(<%
                                                               Response.Write(ViewBag.ServiceProvidersCount.ToString());%>)</span><%
                                                           }
                                                           else
                                                           {%>
                        <span style="color: #FF0000">(0)</span>
                        <%}%>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
