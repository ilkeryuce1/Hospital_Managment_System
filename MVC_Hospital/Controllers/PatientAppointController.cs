using DatabaseLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
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

     
        public ActionResult DoctorAppointment(int? id)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                return RedirectToAction("Login", "Home");
            }
            ViewBag.DoctorTimeSlotID = db.DoctorTimeSlotTables.Where(d => d.DoctorID == id && d.IsActive == true);
            ViewBag.Doctor = db.DoctorTimeSlotTables.Find(id);
           
            return View();

        }



        public ActionResult DoctorAppointment(DoctorAppointTable appointment)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["UserName"])))
            {
                return RedirectToAction("Login", "Home");
            }
            appointment.DoctorComment = string.Empty;
            appointment.IsChecked = false;
            appointment.IsFeeSubmit = false;
            if (ModelState.IsValid)
            {
                var check = db.DoctorAppointTables.Where(i => i.TransectionID == appointment.TransectionID).FirstOrDefault();
                var find = db.DoctorAppointTables.Where(p => p.DoctorTimeSlotID == appointment.DoctorTimeSlotID && p.DoctorID == appointment.DoctorID && p.AppointDate == appointment.AppointDate).FirstOrDefault();
                if (find==null)
                {

                }
            }

            return View();

        }

        public ActionResult DoctorProfile(int? id)
        {

            var doc = db.DoctorTables.Find(id);
            return View();
        }

    }
}