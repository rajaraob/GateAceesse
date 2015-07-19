using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Web.Mvc;
using System.Collections;

using GateAccess.Models;
using GateAccess.Models.Helper;
using GateAccess.Models.DAL;

namespace GateAccess.Models
{
    public class CommunitiesModel
    {
        private static IEnumerable _menuOptionsList = null;
        private static IEnumerable _maxGatesList = null;

        public CommunitiesModel()
        {
            if (_menuOptionsList == null) { _menuOptionsList = GetMenuOptionsList(); }
            if (_maxGatesList == null) { _maxGatesList = GetMaxGatesList(); }
        }

        public Int16 CommunityID { get; set; }

        [Required(ErrorMessage = " ")]
        [Display(Name = "CommunityName")]
        [StringLength(100)]
        public String CommunityName { get; set; }

        [Required(ErrorMessage = " ")]
        [Display(Name = "Address")]
        [StringLength(200)]
        public String CommunityAddress { get; set; }

        [Required(ErrorMessage = " ")]
        [Display(Name = "City")]
        [StringLength(50)]
        public String City { get; set; }

        [Required(ErrorMessage = " ")]
        [Display(Name = "State")]
        [StringLength(50)]
        public String State { get; set; }

        [Required(ErrorMessage = " ")]
        [Display(Name = "Country")]
        [DataType(DataType.Date)]
        [StringLength(100)]
        public String Country { get; set; }

        [Required(ErrorMessage = " ")]
        [Display(Name = "Zip")]
        [StringLength(12)]
        public String Zip { get; set; }

        [Required(ErrorMessage = " ")]
        [Display(Name = "Phone 1")]
        [StringLength(20)]
        public String CommunityPhone1 { get; set; }

        [Required(ErrorMessage = " ")]
        [Display(Name = "Phone 2", Prompt = "0-9, + , -")]
        [StringLength(20)]
        public String CommunityPhone2 { get; set; }

        [Required(ErrorMessage = " ")]
        [RegularExpression(".+\\@.+\\..+", ErrorMessage = "Not valid email address")]
        [DataType(DataType.EmailAddress)]
        [Display(Name = "Email")]
        [StringLength(100)]
        public String CommunityEmail { get; set; }

        [Required(ErrorMessage = " ")]
        [Display(Name = "TotalUnits")]
        [Range(1, 999, ErrorMessage = "Between 1 to 999")]
        public Int16 TotalUnits { get; set; }

        public String MenuOptions { set; get; }

        public Byte MaxGates { set; get; }

        public Byte CommunityCreatedRoleID { get; set; }

        public Int64 CommunityCreatedUserID { get; set; }

        public Byte CommunityModifiedRoleID { get; set; }

        public Int64 CommunityModifiedUserID { get; set; }

        public DateTime CommunityCreatedOn { get; set; }

        public DateTime CommunityModifiedOn { get; set; }

        public Char CommunityStatus { get; set; }

        public IEnumerable SelectedMenuOptions { get; set; }

        public IEnumerable MenuOptionsList
        {
            get
            {
                return _menuOptionsList;
            }
        }

        public IEnumerable MaxGatesList
        {
            get
            {
                return _maxGatesList;
            }
        }
        
        private static Dictionary<String, String> GetMaxGatesList()
        {
            Byte maxGateCount = ConfigSettings.GetMaxGates();
            Dictionary<String, String> gatesList = new Dictionary<String, String>();
            for (Byte i = 1; i <= maxGateCount; i++)
            {
                gatesList.Add(i.ToString(), i.ToString());
            }
            return gatesList;
        }

        private static List<MenuOptions> GetMenuOptionsList()
        {
            return MenuOptionsDAL.MenuOptionsList();
        }
    }
}