using DatabaseLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication3.Models
{
    public class JobRequirementDetailMV
    {

        public int JobRequirementDetailID { get; set; }
        public int JobRequirementID { get; set; }
        public string JobRequirementDetails { get; set; }
        public int PostJobID { get; set; }

        public virtual JobRequirementsTable JobRequirementsTable { get; set; }
        public virtual PostJobTable PostJobTable { get; set; }
    }
}