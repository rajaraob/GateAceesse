using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GateAccess.Models.Helper;
using GateAccess.Models;
using System.Data;
using System.IO;
using System.Configuration;
using System.Xml.XPath;
using System.Xml;
using System.Text;

namespace GateAccess.Models.DAL
{
    public static class MenuOptionsDAL
    {
        private static List<MenuOptions> menuOptionsList;
        private static MenuOptions menuOptionObj;


        //internal List<MenuOptions> MenuOptionsList()
        //{
        //    DataTable Dt_MenuOptionslist = this.GetDataTable("usp_GetMenuOptions");
        //    menuOptionsList = new List<MenuOptions>();
        //    if (Dt_MenuOptionslist.Rows.Count > 0)
        //    {
        //        for (int i = 0; i < Dt_MenuOptionslist.Rows.Count; i++)
        //        {
        //            menuOptionObj = new MenuOptions();
        //            menuOptionObj.MenuOptionID = Convert.ToByte(Dt_MenuOptionslist.Rows[i]["MenuOptionID"].ToString());
        //            menuOptionObj.MenuOptionName = Dt_MenuOptionslist.Rows[i]["MenuOption"].ToString();
        //            menuOptionsList.Add(menuOptionObj);
        //        }
        //    }
        //    return menuOptionsList;
        //}

        internal static List<MenuOptions> MenuOptionsList()
        {            
            XmlDocument doc = new XmlDocument();            
            doc.Load(HttpContext.Current.Server.MapPath("~/App_Data/MenuOptions.xml"));
            
            XmlNode root = doc.DocumentElement;                        
            XmlNodeList nodesList = root.SelectNodes("MenuOption");

            if (nodesList.Count > 0)
            {
                menuOptionsList = new List<MenuOptions>();
                foreach (XmlNode node in nodesList)
                {
                    menuOptionObj = new MenuOptions();
                    menuOptionObj.MenuOptionID = Convert.ToByte(node.SelectSingleNode("MenuOptionID").InnerText);
                    menuOptionObj.MenuOptionName = node.SelectSingleNode("MenuOptionName").InnerText.ToString();
                    menuOptionsList.Add(menuOptionObj);                    
                }
            }            
            return menuOptionsList;
        }

        internal static List<String> GetMenuOptionsNames(IEnumerable<String> myCommunityMenuOptions)
        {
            XmlDocument doc = new XmlDocument();
            doc.Load(HttpContext.Current.Server.MapPath("~/App_Data/MenuOptions.xml"));

            XmlNode root = doc.DocumentElement;
            XmlNodeList nodesList = root.SelectNodes("MenuOption");

            List<String> MenuOptionsNames = new List<string>();

            foreach (String item in myCommunityMenuOptions)
            {
                foreach (XmlNode node in nodesList)
                {
                    if (node.SelectSingleNode("MenuOptionID").InnerText == item)
                        MenuOptionsNames.Add(node.SelectSingleNode("MenuOptionName").InnerText.ToString());                    
                }
            }
            return MenuOptionsNames;
        }

        //public List<MenuOptions> MenuOptionsList(XPathDocument doc)
        //{
        //    try
        //    {
        //        XPathNavigator nav = doc.CreateNavigator();

        //        XPathExpression exp = nav.Compile("/MenuOptions/MenuOption"); // Getting all MenuOptions

        //        // Sorting the records by Employee Id
        //        exp.AddSort("MenuOptionId", System.Xml.XPath.XmlSortOrder.Ascending, System.Xml.XPath.XmlCaseOrder.None, "", System.Xml.XPath.XmlDataType.Text);

        //        XPathNodeIterator iterator = nav.Select(exp);
        //        menuOptionsList = new List<MenuOptions>();

        //        while (iterator.MoveNext())
        //        {
        //            XPathNavigator nav2 = iterator.Current.Clone();

        //            menuOptionObj = new MenuOptions();
        //            menuOptionObj.MenuOptionID = Convert.ToByte(nav2.Select("//MenuOption").Current.SelectSingleNode("MenuOpitonID").InnerXml);
        //            menuOptionObj.MenuOptionName = nav2.Select("//MenuOption").Current.SelectSingleNode("MenuOptionName").InnerXml;

        //            menuOptionsList.Add(menuOptionObj);
        //        }
        //        return menuOptionsList;

        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}
        //internal MenuOptions MenuOptionNames(MenuOptions menuOptions)
        //{
        //    AddParameter("@menuoptionsid", menuOptions.menuOptionID);
        //    AddParameter("@menuoptions", menuOptions.menuOption);
        //    DataTable Dt_MenuOptionNames = this.GetDataTable("usp_GetMenuOptionNames");
        //    menuOptions.menuOptionID =Convert.ToByte( Dt_MenuOptionNames.Rows[0]["MenuOptionsID"].ToString());
        //    menuOptions.menuOption = Dt_MenuOptionNames.Rows[0]["MenuOptions"].ToString();
        //    return menuOptions;
        //}


        //internal object AddMenuOption(MenuOptions menuOption)
        //{
        //    AddParameter("@menuOption", menuOption.MenuOption);
        //   // AddParameter("@createduserid", menuOption.CreatedUserID);
        //   // AddParameter("@createdon", menuOption.CreatedOn);
        //    return this.ExecuteScalar("usp_AddMenuOption");
        //}

        //internal MenuOptions MenuOptionDetails(MenuOptions menuOption)
        //{
        //    AddParameter("@menuoptionid", menuOption.MenuOptionID);
        //    DataTable Dt_MenuOptionDetails = this.GetDataTable("usp_GetMenuOptionDetails");

        //    if (Dt_MenuOptionDetails.Rows.Count > 0)
        //    {
        //        menuOptionDetails = new MenuOptions();
        //        menuOptionDetails.MenuOption = Dt_MenuOptionDetails.Rows[0]["MenuOption"].ToString();
        //    }
        //    return menuOptionDetails;
        //}

        //public MenuOptions MenuOptionDetails(MenuOptions menuOption, XPathDocument doc)
        //{
        //    try
        //    {
        //        MenuOptions menuOptionObj = new MenuOptions();


        //        XPathNavigator nav = doc.CreateNavigator();
        //        XPathNodeIterator iterator;

        //        iterator = nav.Select("//MenuOption[MenuOptionId='" + menuOption.MenuOptionID + "']");

        //        while (iterator.MoveNext())
        //        {
        //            XPathNavigator nav2 = iterator.Current.Clone();

        //            menuOptionObj.MenuOptionID = Convert.ToByte(nav2.Select("//MenuOption").Current.SelectSingleNode("MenuOptionID").InnerXml);
        //            menuOptionObj.MenuOptionName = nav2.Select("//MenuOption").Current.SelectSingleNode("MenuOptionName").InnerXml;
        //        }
        //        return menuOptionObj;

        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}




        //internal MenuOptions EditMenuOption(MenuOptions menuOption)
        //{
        //    return this.MenuOptionDetails(menuOption);
        //}

        //internal object UpdateMenuOption(MenuOptions menuOption)
        //{
        //    AddParameter("@menuoptionid", menuOption.MenuOptionID);
        //    AddParameter("@menuoption", menuOption.MenuOption);
        //    //AddParameter("@modifieduserid", menuOption.ModifiedUserID);
        //    //AddParameter("@modifiedon", menuOption.ModifiedOn);
        //    return this.ExecuteScalar("usp_UpdateMenuOption");
        //}

        //internal Object DeleteMenuOption(MenuOptions menuOption)
        //{
        //    AddParameter("@menuoptionid", menuOption.MenuOptionID);
        //    //AddParameter("@modifieduserid", menuOption.ModifiedUserID);
        //    //AddParameter("@modifiedon", menuOption.ModifiedOn);
        //    return ExecuteScalar("usp_DeleteCommunity");

        //}
    }
}