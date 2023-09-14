using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
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
        [Required(ErrorMessage ="Required*")]
        public string UserName { get; set; }
        [Required(ErrorMessage = "Required*")]


        public string Password { get; set; }
        [Required(ErrorMessage = "Required*")]


        public string EmailAddress { get; set; }
        [Required(ErrorMessage = "Required*")]


        public bool AreYouProvider { get; set; }
        [Required(ErrorMessage = "Required*")]

        public string ContactNO { get; set; }


        public CompanyMV Company { get; set; }
    }
}