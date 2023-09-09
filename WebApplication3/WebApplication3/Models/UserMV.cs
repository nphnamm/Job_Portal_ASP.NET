using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication3.Models
{
    public class UserMV
    {
        public UserMV()
        {
            Company = new CompanyMV();
        }
        public int UsersID { get; set; }
        public int UserTypeID { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string EmailAddress { get; set; }
        public string ContactNO { get; set; }

        public CompanyMV Company { get; set; }
    }
}