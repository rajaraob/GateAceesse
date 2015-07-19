using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GateAccess.Models.Helper;
using GateAccess.Models;
using System.Data;

namespace GateAccess.Models.DAL
{
    public class HintQuestionsDAL:Dal
    {
        private HintQuestionsModel hintQuestionObj;
        private List<HintQuestionsModel> hintQuestionsList;

        internal List<HintQuestionsModel> HintQuestionsList()
        {
            DataTable Dt_HintQuestionList = this.GetDataTable("usp_GetHintQuestions");
            hintQuestionsList = new List<HintQuestionsModel>();
            if (Dt_HintQuestionList.Rows.Count > 0)
            {
                foreach (DataRow dr in Dt_HintQuestionList.Rows)
                {
                    hintQuestionObj = new HintQuestionsModel();
                    hintQuestionObj.HintQuestionID = Convert.ToByte(dr["HintQuestionID"].ToString());
                    hintQuestionObj.Hintquestion = dr["HintQuestion"].ToString();
                    
                    hintQuestionsList.Add(hintQuestionObj);
                }
            }
            return hintQuestionsList;
        }
    }
}