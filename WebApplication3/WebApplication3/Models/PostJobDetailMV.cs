using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication3.Models
{
    public class PostJobDetailMV
    {
        public PostJobDetailMV() 
        {
            Requirements = new List<JobRequirementsMV>() ;
        }
    public int PostJobID { get; set; }

        public string Company { get; set; }
        public string JobCategory { get; set; }
        public string JobTitle { get; set; }
        public string JobDescription { get; set; }
        public int MinSalary { get; set; }
        public int MixSalary { get; set; }
        public string Location { get; set; }
        public int Vacancey { get; set; }
        public string JobNature { get; set; }
        public System.DateTime PostDate { get; set; }
        public System.DateTime ApplicationLastDate { get; set; }

        public string WebUrl { get; set; }

        public List<JobRequirementsMV> Requirements{ get; set; }

    }
}