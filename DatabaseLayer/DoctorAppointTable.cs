//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DatabaseLayer
{
    using System;
    using System.Collections.Generic;
    
    public partial class DoctorAppointTable
    {
        public int DoctorAppointID { get; set; }
        public int DoctorID { get; set; }
        public int PatientID { get; set; }
        public int DoctorTimeSlotID { get; set; }
        public System.DateTime AppointDate { get; set; }
        public string Description { get; set; }
        public bool IsFeeSubmit { get; set; }
        public bool IsChecked { get; set; }
        public string TransectionID { get; set; }
        public string DoctorComment { get; set; }
    
        public virtual DoctorTable DoctorTable { get; set; }
        public virtual DoctorTimeSlotTable DoctorTimeSlotTable { get; set; }
        public virtual PatientTable PatientTable { get; set; }
    }
}
