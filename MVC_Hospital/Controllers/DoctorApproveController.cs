using DatabaseLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_Hospital.Controllers
{
    public class DoctorApproveController : Controller
    {
        private Mvc_HospitalEntities db = new Mvc_HospitalEntities();

        // GET: DoctorApprove
        public ActionResult PendingAppoint()
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                return RedirectToAction("Login", "Home");

            }
            var doc = (DoctorTable)Session["Doctor"];
            var pendingappointment = db.DoctorAppointTables.Where(d => d.DoctorID == doc.DoctorID && d.IsChecked == false && d.IsFeeSubmit == false && d.DoctorComment.Trim().Length == 0);
            return View(pendingappointment);
        }

        public ActionResult PendingAppoint()
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                return RedirectToAction("Login", "Home");

            }
            var doc = (DoctorTable)Session["Doctor"];
            var pendingappointment = db.DoctorAppointTables.Where(d => d.DoctorID == doc.DoctorID);
            return View(pendingappointment);
        }
        public ActionResult ChangeStatus(int? id)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                return RedirectToAction("Login", "Home");

            }
            var appoint = db.DoctorAppointTables.Find(id);
            return View(appoint);
        }
        [HttpPost]
        public ActionResult ChangeStatus(DoctorAppointTable app)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                return RedirectToAction("Login", "Home");

            }
            if (ModelState.IsValid)
            {
                db.Entry(app).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("PendingAppoint");

            }
            return View(app);
        }
        public ActionResult CurrentAppoint()
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                return RedirectToAction("Login", "Home");

            }
            var doc = (DoctorTable)Session["Doctor"];
            var currentappointment = db.DoctorAppointTables.Where(d => d.DoctorID == doc.DoctorID && d.IsChecked == false && d.IsFeeSubmit == true && d.DoctorComment.Trim().Length == 0);
            return View(currentappointment);
        }
        public ActionResult ProcessAppointment(int? id)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                return RedirectToAction("Login", "Home");

            }

            var appoint = db.DoctorAppointTables.Find(id);
            return View(appoint);
        }

        [HttpPost]
        public ActionResult ProcessAppointment(DoctorAppointTable app)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                return RedirectToAction("Login", "Home");

            }
            if (ModelState.IsValid)
            {
                db.Entry(app).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("PendingAppoint");

            }
            return View(app);
        }
    }
}