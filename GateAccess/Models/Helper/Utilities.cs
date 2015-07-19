using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Net;
using System.Net.Mail;
using System.Web;

using GateAccess.Models;
using GateAccess.Models.Helper;


namespace GateAccess.Models.Helper
{
    public class Utilities
    {
        public static Boolean SendEmail(MailMessage mailMessage)
        {
            bool mailsentstatus = false;

            String from = ConfigSettings.GetUserName();
            String passWord = ConfigSettings.GetPassword();
            String host = ConfigSettings.GetHost();
            String port = ConfigSettings.GetPort();
          //  String cc = ConfigSettings.GetCC();
          //  String bcc = ConfigSettings.GetBCC();

            SmtpClient client = new SmtpClient();
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.EnableSsl = true;
            client.Host = host;
            client.Port = Convert.ToInt32(port);

            // setup Smtp authentication
            System.Net.NetworkCredential credentials = new System.Net.NetworkCredential(from, passWord);
            client.UseDefaultCredentials = false;
            client.Credentials = credentials;
           
                       
            mailMessage.From = new MailAddress(from);
          //  mailMessage.CC = new MailMessage(cc);
          //  mailMessage.Bcc = new MailMessage(bcc);
            
            try
            {
                client.Send(mailMessage);
                mailsentstatus = true;                
            }

            catch(Exception ex)
            {
                mailsentstatus = false;
            }
            return mailsentstatus;
        }
      
        public static String GetIP()
        {
            IPHostEntry host;
            String localIP = "?";
            host = Dns.GetHostEntry(Dns.GetHostName());
            foreach (IPAddress ip in host.AddressList)
            {
                if (ip.AddressFamily.ToString() == "InterNetwork")
                {
                    localIP = ip.ToString();
                }
            }
            return localIP;
        }

        public static String GetNextAlphaNumeric(int len)
        {
            String _allowedChars = "abcdefghijkmnopqrstuvwxyz0123456789ABCDEFGHJKLMNOPQRSTUVWXYZ";
            Random randNum = new Random();
            char[] chars = new char[len];

            char newchar;
            char? lastchar = null;
            String result;

            int allowedCharCount = _allowedChars.Length;
            for (int i = 0; i < len; i++)
            {
                newchar = _allowedChars[randNum.Next(0, allowedCharCount)];
                if (i != 0)
                {
                    result = String.Compare(newchar.ToString(), lastchar.ToString()) == 0 ? "true" : "false";
                    if (result == "true")
                    {
                        while (result != "false")
                        {
                            newchar = _allowedChars[(int)(allowedCharCount * randNum.NextDouble())];

                            result = String.Compare(newchar.ToString(), lastchar.ToString()) == 0 ? "true" : "false";
                        }
                        chars[i] = newchar;
                        lastchar = chars[i];
                    }
                    else
                    {
                        chars[i] = newchar;
                        lastchar = chars[i];
                    }
                }
                else
                {
                    chars[i] = newchar;
                    lastchar = chars[i];
                }

            }
            return new String(chars);
        }
    }
}