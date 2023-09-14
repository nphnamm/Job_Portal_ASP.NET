using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication3.Models
{
    public class JobRequirementsMV
    {
        public JobRequirementsMV() 
        {
            Details = new List<JobRequirementDetailMV>();
        }
        public int JobRequirementID { get; set; }
        public string JobRequirementTitle { get; set; }

        public List<JobRequirementDetailMV> Details { get; set; }
    }
}