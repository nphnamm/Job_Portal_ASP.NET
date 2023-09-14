using DatabaseLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Description;
using WebApplication3.Models;

namespace WebApplication3.Controllers
{
    public class JobController : Controller
    {

        private JobshuntDbEntities Db = new JobshuntDbEntities();
        // GET: Job
        public ActionResult PostJob()
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Login", "User");

            }


            var job = new PostJobMV();
            ViewBag.JobCategoryID = new SelectList(
                                    Db.JobCategoryTables.ToList(),
                                    "JobCategoryID",
                                    "JobCategory",
                                    "0");

            ViewBag.JobNatureID = new SelectList(
                                    Db.JobNatureTables.ToList(),
                                    "JobNatureID",
                                    "JobNature",
                                    "0");
           
            return View(job);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult PostJob(PostJobMV postJobMV)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Login", "User");

            }
            int userid = 0;
            int companyid = 0;
            int.TryParse(Convert.ToString(Session["UserID"]), out userid);
            int.TryParse(Convert.ToString(Session["CompanyID"]), out companyid);
            postJobMV.UserID = userid;
            postJobMV.CompanyID = companyid;

            if (ModelState.IsValid)
            {
                var post = new PostJobTable();


                post.UserID = postJobMV.UserID;
                post.CompanyID = postJobMV.CompanyID;
                post.JobCategoryID = postJobMV.JobCategoryID;
                post.JobTitle = postJobMV.JobTitle;
                post.JobDescription = postJobMV.JobDescription;
                post.MinSalary = postJobMV.MinSalary;
                post.MixSalary = postJobMV.MixSalary;
                post.Location = postJobMV.Location;
                post.Vacancey = postJobMV.Vacancey;
                post.JobNatureID = postJobMV.JobNatureID;
                post.PostDate = DateTime.Now;
                post.ApplicationLastDate = postJobMV.ApplicationLastDate;
                post.LastDate = postJobMV.ApplicationLastDate;
                post.JobStatusID = 1 ;
                post.WebUrl = postJobMV.WebUrl;
                Db.PostJobTables.Add(post);
                Db.SaveChanges();
                return RedirectToAction("CompanyJobsList");



             }

            ViewBag.JobCategoryID = new SelectList(
                                    Db.JobCategoryTables.ToList(),
                                    "JobCategoryID",
                                    "JobCategory",
                                    "0");

            ViewBag.JobNatureID = new SelectList(
                                    Db.JobNatureTables.ToList(),
                                    "JobNatureID",
                                    "JobNaturery",
                                    "0");

            return View(postJobMV);
        }
        public ActionResult CompanyJobsList()
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Login", "User");

            }
            int userid = 0;
            int companyid = 0;
            int.TryParse(Convert.ToString(Session["UserID"]), out userid);
            int.TryParse(Convert.ToString(Session["CompanyID"]), out companyid);
            var allpost = Db.PostJobTables.Where(c => c.CompanyID == companyid && c.UserID == userid ).ToList();
            return View(allpost);
        }


        public ActionResult ALlCompanyPendingJobs()
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Login", "User");

            }
            int userid = 0;
            int companyid = 0;
            int.TryParse(Convert.ToString(Session["UserID"]), out userid);
            int.TryParse(Convert.ToString(Session["CompanyID"]), out companyid);
            var allpost = Db.PostJobTables.ToList();


            if(allpost.Count() > 0)
            {
                allpost = allpost.OrderByDescending(o => o.PostJobID).ToList();
            }
            return View(allpost);
        }

        public ActionResult AddRequirements(int? id)

        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Login", "User");

            }
            var details = Db.JobRequirementDetailTables.Where(j =>j.PostJobID ==id).ToList();
            if(details.Count() > 0)
            {
                details = details.OrderBy(r => r.JobRequirementID).ToList();
            }
            var requirments = new JobRequirmentsMV();
            
            requirments.Details = details;
            requirments.PostJobID = (int)id;

            ViewBag.JobRequirementID = new SelectList(Db.JobRequirementsTables.ToList(), "JobRequirementID","JobRequirementTitle","0");
            return View(requirments);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddRequirements(JobRequirmentsMV jobRequirmentsMV)

        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Login", "User");

            }
            try
            {
                var requirements = new JobRequirementDetailTable();
                requirements.JobRequirementID = jobRequirmentsMV.JobRequirementID;
                requirements.JobRequirementDetails = jobRequirmentsMV.JobRequirementDetails;
                requirements.PostJobID = jobRequirmentsMV.PostJobID;
                Db.JobRequirementDetailTables.Add(requirements);
                Db.SaveChanges();
                return RedirectToAction("AddRequirements", new {id = requirements.PostJobID});

            }
            catch (Exception )
            {
                var details = Db.JobRequirementDetailTables.Where(j => j.PostJobID == jobRequirmentsMV.PostJobID).ToList();
                if (details.Count() > 0)
                {
                    details = details.OrderBy(r => r.JobRequirementID).ToList();
                }
             

                jobRequirmentsMV.Details = details;
                ModelState.AddModelError("JobRequirementID", "Required");
            }

       
            ViewBag.JobRequirementID = new SelectList(Db.JobRequirementsTables.ToList(), "JobRequirementID", "JobRequirementTitle", jobRequirmentsMV.JobRequirementID);
            return View(jobRequirmentsMV);
        }
        public ActionResult DeleteRequirment(int? id)
        {
            var jobpostid = Db.JobRequirementDetailTables.Find(id).PostJobID;
            var requirements = Db.JobRequirementDetailTables.Find(id);
            Db.Entry(requirements).State = System.Data.Entity.EntityState.Deleted;
            Db.SaveChanges();


            
            return RedirectToAction("AddRequirements", new {id = jobpostid});
        }
        public ActionResult DeleteJobPost(int? id)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Login", "User");

            }
            var jobpost = Db.PostJobTables.Find(id);
            Db.Entry(jobpost).State = System.Data.Entity.EntityState.Deleted;
            Db.SaveChanges();
             
            return RedirectToAction("ALlCompanyPendingJobs");
        }
        public ActionResult ApprovedPost(int? id)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Login", "User");

            }
            var jobpost = Db.PostJobTables.Find(id);
            jobpost.JobStatusID = 2;
            Db.Entry(jobpost).State = System.Data.Entity.EntityState.Modified;
            Db.SaveChanges();

            return RedirectToAction("ALlCompanyPendingJobs");
        }

        public ActionResult CanceledPost(int? id)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserTypeID"])))
            {
                return RedirectToAction("Login", "User");

            }
            var jobpost = Db.PostJobTables.Find(id);
            jobpost.JobStatusID = 3;
            Db.Entry(jobpost).State = System.Data.Entity.EntityState.Modified;
            Db.SaveChanges();

            return RedirectToAction("ALlCompanyPendingJobs");
        }
        public ActionResult JobDetails(int? id)
        {

            var getpostjob = Db.PostJobTables.Find(id);
            var postjob = new PostJobDetailMV();

            postjob.PostJobID = getpostjob.PostJobID;

            postjob.Company = getpostjob.CompanyTable.CompanyName;
            postjob.JobCategory = getpostjob.JobCategoryTable.JobCategory;
            postjob.JobTitle = getpostjob.JobTitle;
            postjob.JobDescription =  getpostjob.JobDescription;
            postjob.MinSalary = getpostjob.MinSalary;
            postjob.MixSalary = getpostjob.MixSalary;
            postjob.Location = getpostjob.Location;
            postjob.Vacancey = getpostjob.Vacancey;
            postjob.JobNature = getpostjob.JobNatureTable.JobNature;
            postjob.PostDate = getpostjob.PostDate;
            postjob.ApplicationLastDate = getpostjob.ApplicationLastDate;
            postjob.WebUrl = getpostjob.WebUrl;

            getpostjob.JobRequirementDetailTables = getpostjob.JobRequirementDetailTables.OrderBy(d => d.JobRequirementID).ToList();
            int jobrequirmentid = 0;
            var jobrequirments = new JobRequirementsMV();
            
            foreach (var detail in getpostjob.JobRequirementDetailTables)
            {
                var jobrequirmentdetails = new JobRequirementDetailMV();
                if (jobrequirmentid == 0)
                {
                    jobrequirments.JobRequirementID = detail.JobRequirementID;
                    jobrequirments.JobRequirementTitle = detail.JobRequirementsTable.JobRequirementTitle;
                    jobrequirmentdetails.JobRequirementID = detail.JobRequirementID;
                    jobrequirmentdetails.JobRequirementDetails = detail.JobRequirementDetails;
                    jobrequirments.Details.Add(jobrequirmentdetails);
                    jobrequirmentid = detail.JobRequirementID;
                }else if(jobrequirmentid == detail.JobRequirementID)
                {
                    jobrequirmentdetails.JobRequirementID = detail.JobRequirementID;
                    jobrequirmentdetails.JobRequirementDetails = detail.JobRequirementDetails;
                    jobrequirments.Details.Add(jobrequirmentdetails);
                    jobrequirmentid = detail.JobRequirementID;

                }
                else if (jobrequirmentid != detail.JobRequirementID)
                {
                    postjob.Requirements.Add(jobrequirments);
                    jobrequirments = new JobRequirementsMV();
                    jobrequirments.JobRequirementID = detail.JobRequirementID;
                    jobrequirments.JobRequirementTitle = detail.JobRequirementsTable.JobRequirementTitle;
                    jobrequirmentdetails.JobRequirementID = detail.JobRequirementID;
                    jobrequirmentdetails.JobRequirementDetails = detail.JobRequirementDetails;
                    jobrequirments.Details.Add(jobrequirmentdetails);
                    jobrequirmentid = detail.JobRequirementID;


                }

            }

            postjob.Requirements.Add(jobrequirments);
            return View(postjob);
        }
        public ActionResult FilterJob()
        {
            var obj = new FilterJobMV();
            var date = DateTime.Now.Date;
            var result = Db.PostJobTables.Where(r => r.ApplicationLastDate >= date && r.JobStatusID == 2).ToList();

            obj.Result = result;
            ViewBag.JobCategoryID = new SelectList(
                                    Db.JobCategoryTables.ToList(),
                                    "JobCategoryID",
                                    "JobCategory",
                                    "0");

            ViewBag.JobNatureID = new SelectList(
                                    Db.JobNatureTables.ToList(),
                                    "JobNatureID",
                                    "JobNature  ",
                                    "0");

            return View(obj);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult FilterJob(FilterJobMV filterJobMV)
        {
            var date = DateTime.Now.Date;
            var result = Db.PostJobTables.Where(r => r.ApplicationLastDate >= date && r.JobStatusID == 2 &&(r.JobCategoryID == filterJobMV.JobCategoryID || r.JobNatureID == filterJobMV.JobNatureID)).ToList();

            filterJobMV.Result = result;

            ViewBag.JobCategoryID = new SelectList(
                                    Db.JobCategoryTables.ToList(),
                                    "JobCategoryID",
                                    "JobCategory",
                                    filterJobMV.JobCategoryID);

            ViewBag.JobNatureID = new SelectList(
                                    Db.JobNatureTables.ToList(),
                                    "JobNatureID",
                                    "JobNature",
                                    filterJobMV.JobNatureID);

            return View(filterJobMV);
        }
         
    }

}