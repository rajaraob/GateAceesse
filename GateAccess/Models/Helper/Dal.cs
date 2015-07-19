using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Collections;
using System.Configuration;
using System.Data;

namespace GateAccess.Models.Helper
{
    public class Dal
    {
        private static SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["GADBConnectionString"].ConnectionString);
        private List<SqlParameter> CmdParameters = new List<SqlParameter>();
      

        protected Dal()
        {
            Connect();
        }

        public static SqlConnection Connect()
        {
            if (Con.State != ConnectionState.Open)            
                Con.Open();
                
            return Con;
        }

        public void DisConnect()
        {
            if (Con.State == ConnectionState.Open)
            {
                Con.Close();
                Con.Dispose();
            }
        }

        private void AddCommandParameters(ref SqlCommand Cmd)
        {
            if(Cmd.Parameters.Count>0)
                Cmd.Parameters.Clear();
            foreach (SqlParameter parameter in CmdParameters)
            {
                Cmd.Parameters.Add(parameter);
            }
            CmdParameters.Clear();
        }


        protected void AddParameter(String Parameter, object Value)
        {
            AddParameter(new SqlParameter(Parameter, Value));
        }

        private void AddParameter(SqlParameter sqlParameter)
        {
            if (sqlParameter.DbType != DbType.DateTime)
            {
                if (String.IsNullOrEmpty(Convert.ToString(sqlParameter.Value)))
                    sqlParameter.Value = System.Convert.DBNull;
            }
            else
            {
                if (sqlParameter.Value == null || DateTime.Parse(sqlParameter.Value.ToString()) == DateTime.MinValue)
                    sqlParameter.Value = System.Convert.DBNull;
                else sqlParameter.Value = DateTime.Parse(sqlParameter.Value.ToString());
            }
            CmdParameters.Add(sqlParameter);
        }

        protected DataTable GetDataTable(String CommandText)
        {
            SqlCommand Cmd = new SqlCommand(CommandText, Con);
            Cmd.CommandType = CommandType.StoredProcedure;      
            AddCommandParameters(ref Cmd);

            DataTable Dt = new DataTable();
            SqlDataAdapter Da = new SqlDataAdapter(Cmd);
            Da.Fill(Dt);            
            Da.Dispose();
            Cmd.Dispose();            
            return Dt;
        }


        protected DataSet GetDataset(String CommandText)
        {
            SqlCommand Cmd = new SqlCommand(CommandText, Con);
            Cmd.CommandType = CommandType.StoredProcedure;
          
            AddCommandParameters(ref Cmd);
            SqlDataAdapter Da = new SqlDataAdapter(Cmd);
            DataSet Ds = new DataSet();
            Da.Fill(Ds);
            return Ds;
        }

        protected object ExecuteScalar(String CommandText)
        {
            SqlCommand Cmd = new SqlCommand(CommandText, Con);
            Cmd.CommandType = CommandType.StoredProcedure;
            
            AddCommandParameters(ref Cmd);
            return Cmd.ExecuteScalar();
        }

        protected Int32 ExecuteNonQuery(String CommandText, String Parameter, DataTable Dt)
        {
            SqlCommand Cmd = new SqlCommand(CommandText, Con);
            Cmd.CommandType = CommandType.StoredProcedure;
           
            Cmd.Parameters.Add(Parameter, SqlDbType.Structured);
            Cmd.Parameters[Parameter].Value = Dt;
            Cmd.Parameters[Parameter].Direction = ParameterDirection.Input;

            return Cmd.ExecuteNonQuery();
        }

        protected Int32 ExecuteNonQuery(String CommandText)
        {
            SqlCommand Cmd = new SqlCommand(CommandText, Con);
            Cmd.CommandType = CommandType.StoredProcedure;      
            AddCommandParameters(ref Cmd);

            return Cmd.ExecuteNonQuery();
        }
    }
}
