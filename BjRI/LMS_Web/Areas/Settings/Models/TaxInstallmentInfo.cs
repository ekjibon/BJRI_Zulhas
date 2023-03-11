using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace LMS_Web.Areas.Settings.Models
{
    public class TaxInstallmentInfo
    {
        public int  Id { get; set; }        
        public string AppUserId { get; set; }
        public int Month { get; set; }
        public int Year { get; set; }        
        public int InstallmentNo { get; set; }
        [ForeignKey("UserTax")]
        public int UserTaxId { get; set;}
        public virtual  UserTax UserTax { get; set; }
    }
}
