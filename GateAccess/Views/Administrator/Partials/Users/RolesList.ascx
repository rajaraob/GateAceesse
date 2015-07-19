<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="System.Collections.Generic" %>
<table width="100%">
    <tr style="text-align: right">
        <td width="8%">
            <b>Roles :</b>
        </td>
        <td width="70%">
            <table width="100%">
                <tr style="text-align: left">
                    <td>
                        <input type="radio" name="RoleID" id="adminRoleID" onclick="loadPartial(this.value)" value="2" style="width: 40;" />
                        <label for="adminRoleID" style="font-weight: bold">
                            Administrator</label>&nbsp;<%if (ViewBag.AdministratorsCount != null)
                                                         {%><span style="color: #2F9C1F">(<%
                                                        Response.Write(ViewBag.AdministratorsCount.ToString());%>)</span><%
                                                    }
                                                         else
                                                         {%>
                        <span style="color: #FF0000">(0)</span>
                        <%}%>
                    </td>
                    <td>
                        <input type="radio" name="RoleID" id="smRoleID" onclick="loadPartial(this.value)" value="3" style="width: 40;" />
                        <label for="smRoleID" style="font-weight: bold">
                            SecurityManager</label>&nbsp;<%if (ViewBag.SecurityManagersCount != null)
                                                           {%><span style="color: #2F9C1F">(<%
                                                          Response.Write(ViewBag.SecurityManagersCount.ToString());%>)</span><%
                                                      }
                                                           else
                                                           {%>
                        <span style="color: #FF0000">(0)</span>
                        <%}%>
                    </td>
                    <td>
                        <input type="radio" name="RoleID" id="spRoleID" onclick="loadPartial(this.value)" value="4" style="width: 40;" />
                        <label for="spRoleID" style="font-weight: bold">
                            SecurityPersonnel</label>&nbsp;<%if (ViewBag.SercurityPersonsCount != null)
                                                          {%><span style="color: #2F9C1F">(<%
                                                         Response.Write(ViewBag.SercurityPersonsCount.ToString());%>)</span><%
                                                     }
                                                          else
                                                          {%>
                        <span style="color: #FF0000">(0)</span>
                        <%}%>
                    </td>
                    <td>
                        <input type="radio" name="RoleID" id="hoRoleID" onclick="loadPartial(this.value)" value="5" style="width: 40;" />
                        <label for="hoRoleID" style="font-weight: bold">
                            HomeOwner</label>&nbsp;<%if (ViewBag.HomeOwnersCount != null)
                                                     {%><span style="color: #2F9C1F">(<%
                                                    Response.Write(ViewBag.HomeOwnersCount.ToString());%>)</span><%
                                                }
                                                     else
                                                     {%>
                        <span style="color: #FF0000">(0)</span>
                        <%}%>
                    </td>
                    <td>
                        <input type="radio" name="RoleID" id="srpRoleID" onclick="loadPartial(this.value)" value="6" style="width: 40;" />
                        <label for="srpRoleID" style="font-weight: bold">
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
