namespace LMS_Web.Areas.CPF.ViewModels
{
    public class ShortBillVM
    {
        //Allowance
        public decimal MedicalAllowance { get; set; }
        public decimal TransportAllowance { get; set; }
        public decimal HouseRentAllowance { get; set; }
        public decimal TiffinAllowance { get; set; }
        public decimal WashAllowance { get; set; }
        public decimal EducationAllowance { get; set; }
        public decimal ChargeAllowance { get; set; }
        public decimal HonoraryAllowance { get; set; }
        public decimal TravelingAllowance { get; set; }
        public decimal FestivalAllowance { get; set; }
        public string BayshakhiAllowance { get; set;}
        public decimal OthersAllowance { get; set; }


        //Deduction
        public decimal CPFRegular { get; set; }
        public decimal CPFAdditional { get; set; }
        public decimal HouseRentDeduction { get; set; }
        public decimal ElectricBill { get; set; }
        public decimal GasBill { get; set; }
        public decimal WaterBill { get; set; }
        public decimal IncomeTaxAmount { get; set; }

        public decimal MotorCycle { get; set; }
        public string MotorCycleAdvance { get; set; }
        public decimal HouseBuildingAdvance { get; set; }
        public decimal HouseRepairing { get; set; }
        public decimal OthersAdvanceLoan { get; set; }
        public decimal CarRental { get; set; }

        public decimal GroupInsurance { get; set; }
        public decimal WelfareFond { get; set; }
        public decimal Rehabilitation { get; set; }
        public decimal FestivalAllowanceDeduction { get; set; }
        public decimal BasicDeduction { get; set; }
        public decimal Others { get; set; }


    }
}
