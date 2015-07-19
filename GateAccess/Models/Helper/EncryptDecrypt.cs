using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GateAccess.Models.Helper
{
    public class EncryptDecrypt
    {
        public static String Encrypt(String toEncrypt)
        {
            try
            {
                byte[] encData_byte = new byte[toEncrypt.Length];
                encData_byte = System.Text.Encoding.UTF8.GetBytes(toEncrypt);
                String encodedData = Convert.ToBase64String(encData_byte);
                return encodedData;
            }
            catch (Exception ex)
            {
                throw new Exception("Error in base64Encode" + ex.Message);
            }
        }

        public static String Decrypt(String cipherString)
        {
            System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();
            System.Text.Decoder utf8Decode = encoder.GetDecoder();
            byte[] todecode_byte = Convert.FromBase64String(cipherString);
            int charCount = utf8Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
            char[] decoded_char = new char[charCount];
            utf8Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
            String result = new String(decoded_char);
            return result;
        }

        internal static HttpCookie Encrypt(HttpCookie myCookie)
        {
            throw new NotImplementedException();
        }
    }
}