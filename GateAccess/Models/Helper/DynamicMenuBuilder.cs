using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GateAccess.Models.DAL;

namespace GateAccess.Models.Helper
{
    public class DynamicMenuBuilder
    {
        //internal static Dictionary<Byte, String> MenuOptionsNames(String menuOptionsIDs)
        //{
        //    String[] menuOptions = menuOptionsIDs.Split(',');
        //    MenuOptions menuOption = new MenuOptions();
        //    MenuOptionsDAL menuOptionsDAL = new MenuOptionsDAL();
        //    Dictionary<Byte, String> Dic_MenuOptions = new Dictionary<Byte, String>();
        //    if (menuOptions.Length > 0)
        //    {
        //        menuOptionsDAL = new MenuOptionsDAL();

        //        foreach (var Item in menuOptions)
        //        {
        //            menuOption.MenuOptionID = Convert.ToByte(Item);
        //            Dic_MenuOptions.Add(menuOption.MenuOptionID, menuOptionsDAL.MenuOptionDetails(menuOption).MenuOptionName);
        //        }
        //    }
        //    return Dic_MenuOptions;
        //}

        internal static String BuildMenu(Dictionary<Byte, String> Dictionary_MenuOptions)
        {
            String dynamicmenu = null;
            foreach (var Item in Dictionary_MenuOptions)
            {
                switch (Item.Key)
                {
                    case 1:
                        break;
                    case 2:
                        break;
                    case 3:
                        break;
                    case 4:
                        break;
                    case 5:
                        break;
                    case 6:
                        break;
                    case 7:
                        break;
                    case 8:
                        break;
                    case 9:
                        break;
                    case 10:
                        break;
                    case 11:
                        break;
                    case 12:
                        break;
                    default:
                        break;
                }
            }
            return dynamicmenu;
        }
    }
}