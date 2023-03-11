﻿using System.Collections.Generic;
using LMS_Web.Areas.Salary.Models;
using LMS_Web.Interface.Manager;

namespace LMS_Web.Areas.Salary.Interface.Manager
{
   interface IGradeStepBasicManager : IBaseManager<GradeStepBasic>
   {
       ICollection<GradeStepBasic> GetList(int gradeId);
       GradeStepBasic GetById(int id);
   }
}
