using DatabaseLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication3.Models;


namespace WebApplication3.Controllers
{
    public class UserController : Controller
    {

        private  JobshuntDbEntities Db = new JobshuntDbEntities();
        // GET: User
        public ActionResult NewUser()
        {
            return View(new UserMV());

        }
        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult NewUser(UserMV userMV)
        {
            if (ModelState.IsValid)
            {

                var checkuser = Db.UserTables.Where(u =>u.EmailAddress == userMV.EmailAddress ).FirstOrDefault();
                if(checkuser != null)

                {
                    ModelState.AddModelError("Email Address","Email is Already Registered");
                    return View(userMV);
                }
                checkuser = Db.UserTables.Where(u => u.UserName == userMV.UserName).FirstOrDefault();
                if (checkuser != null)

                {
                    ModelState.AddModelError("UserName", "UserName is Already Registered");
                    return View(userMV);
                }

                using (var trans = Db.Database.BeginTransaction())
                {

                    try
                    {
                        var user = new UserTable();
                        user.UserName = userMV.UserName;
                        user.Password = userMV.Password;
                        user.ContactNO = userMV.ContactNO;
                        user.EmailAddress = userMV.EmailAddress;
                        user.UserTypeID = userMV.AreYouProvider == true ? 2 : 3;

                        Db.UserTables.Add(user);
                        Db.SaveChanges();

                        if (userMV.AreYouProvider == true)
                        {
                            var company = new CompanyTable();
                            company.UserID = user.UsersID;
                            if (string.IsNullOrEmpty(userMV.Company.EmailAddress))
                            {
                                trans.Rollback();
                                ModelState.AddModelError("Company.EmailAddress", "Required*");
                                return View(userMV);
                            }

                         
                         
                            if (string.IsNullOrEmpty(userMV.Company.PhoneNo))
                            {
                                trans.Rollback();
                                ModelState.AddModelError("Company.PhoneNo", "Required*");
                                return View(userMV);
                            }

                            if (string.IsNullOrEmpty(userMV.Company.Description))
                            {
                                trans.Rollback();
                                ModelState.AddModelError("Company.Description", "Required*");
                                return View(userMV);
                            }


                            company.EmailAddress = userMV.Company.EmailAddress;
                            company.CompanyName = userMV.Company.CompanyName;
                            company.ContactNo = userMV.ContactNO;
                            company.PhoneNo = userMV.Company.PhoneNo;
                            company.Logo = "~/Content/assest/img/logo/logo.png";
                            company.Description = userMV.Company.Description;
                            Db.CompanyTables.Add(company);
                            Db.SaveChanges();
                        }
                        trans.Commit();
                        return RedirectToAction("Login");

                    }
                    catch (Exception)
                    {
                        ModelState.AddModelError(string.Empty, "Please Provide Correct Details");
                        trans.Rollback();
                    }

                }

            }
            return View(userMV);

        }

        public ActionResult Login()
        {

            return View ( new UserLoginMV());
        }
        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult Login(UserLoginMV userLoginMV) 
        {
            
            if(ModelState.IsValid)
            {
                var user = Db.UserTables.Where(u => u.UserName == userLoginMV.UserName  && u.Password == userLoginMV.Password).FirstOrDefault();
                if(user == null)
                {
                    ModelState.AddModelError(string.Empty, "UserName & Password is Incorrect");
                    
                    return View(userLoginMV);
                    

                }
                Session["UserID"] = user.UsersID;
                Session["UserName"] = user.UserName;
                Session["UserTypeID"] = user.UserTypeID;

                if(user.UserTypeID == 2)
                {
                    Session["CompanyID"] = user.CompanyTables.FirstOrDefault().CompanyID;
                }
                return RedirectToAction("Index","Home");
            }
            return View(userLoginMV);

        }

        public ActionResult Logout() {
            Session["UserID"] = string.Empty;
            Session["UserName"] = string.Empty;
            Session["CompanyID"] = string.Empty;
            Session["UserTypeID"] = string.Empty;

            return RedirectToAction("Index","Home");
        }

        public ActionResult AllUsers()
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {

                return RedirectToAction("Login", "Usrer");
            }
            var users = Db.UserTables.ToList();
            return View(users);

        }



        public ActionResult Forgot()
        {

            return View(new ForgotPasswordMV());
        }
        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult Forgot(ForgotPasswordMV forgotPasswordMV)
        {

            var user = Db.UserTables.Where(u => u.EmailAddress == forgotPasswordMV.Email).FirstOrDefault();

            if (user != null)
            {
                string userandpassword = "User Name : " + user.UserName + "\n" + "Password" + user.Password;
                //var callbackUrl = Url.Action("ConfirmEmail", "User", new { code = code }, protocol: Request.Url.Scheme);
                //await UserManager.SendEmailAsnyc(user.Id, "Account Details", "Plase confirm your account by clicking <a href=" + callbackUrl + "> here</a> ");
                string body = userandpassword;

                //body = body.Replace("{ConfirmationLink}", callbackUrl);
                //body = body.Replace("{UserName}", user.EmailAddress);
                bool IsSendEmail = WebApplication3.Forgot.Email.EmailSend(user.EmailAddress, "Account Details", body, true);

                if(IsSendEmail)
                {
                    ModelState.AddModelError(string.Empty, "Email and Password is Send!");


                }
                else
                {
                    ModelState.AddModelError("Email", "Your Email is Registered Current email sending is not working properly, please try again after some time  ");

                }
            }
            else
            {
                ModelState.AddModelError("Email", "Email is not Registerd");
            }
            return View(forgotPasswordMV);

        }
    }
}