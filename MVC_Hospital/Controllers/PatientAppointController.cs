using DatabaseLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC_Hospital.Controllers
{
    public class PatientAppointController : Controller
    {
        private Mvc_HospitalEntities db = new Mvc_HospitalEntities();
        // GET: PatientAppoint
        public ActionResult GetAllDoctors()
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                return RedirectToAction("Login", "Home");
            }
            var doclist=db.DoctorTables.Where(i=>i.UserTable.IsVerifed==true);  
            return View(doclist);
        }
        public ActionResult GetAllLabs()
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                return RedirectToAction("Login", "Home");
            }
            var lablist = db.LabTables.Where(i => i.UserTable.IsVerifed == true);
            return View(lablist);
        }
        public ActionResult GetAllPatients()
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                return RedirectToAction("Login", "Home");
            }
            var lablist = db.LabTables.Where(i => i.UserTable.IsVerifed == true);
            return View(lablist);
        }

    }
}