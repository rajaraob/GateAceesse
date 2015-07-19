using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

namespace GateAccess.Models.Helper
{
    public class ConfigSettings
    {

        public static String GetHost()
        {
            return ConfigurationManager.AppSettings["Host"].ToString();
        }

        public static String GetPort()
        {
            return ConfigurationManager.AppSettings["Port"].ToString();
        }

        public static String GetUserName()
        {
            return ConfigurationManager.AppSettings["UserName"].ToString();
        }

        public static String GetPassword()
        {
            return ConfigurationManager.AppSettings["Password"].ToString();
        }

        public static String GetCC()
        {
            return ConfigurationManager.AppSettings["CC"].ToString();
        }

        public static String GetBCC()
        {
            return ConfigurationManager.AppSettings["BCC"].ToString();
        }

        public static String GetURL()
        {
            return ConfigurationManager.AppSettings["Url"].ToString();
        }

        internal static byte GetMaxGates()
        {
            return Convert.ToByte(ConfigurationManager.AppSettings["MaxGates"].ToString());
        }
    }
}