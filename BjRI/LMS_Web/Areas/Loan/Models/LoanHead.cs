using System.Collections.Generic;

namespace LMS_Web.Areas.Loan.Models
{
    public class LoanHead
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public LoanHeadType LoanHeadType{ get; set; }
       
    }
}
