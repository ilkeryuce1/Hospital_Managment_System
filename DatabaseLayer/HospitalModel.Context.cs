﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class Mvc_HospitalEntities : DbContext
    {
        public Mvc_HospitalEntities()
            : base("name=Mvc_HospitalEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AccountTypeTable> AccountTypeTables { get; set; }
        public virtual DbSet<DoctorAppointTable> DoctorAppointTables { get; set; }
        public virtual DbSet<DoctorTable> DoctorTables { get; set; }
        public virtual DbSet<DoctorTimeSlotTable> DoctorTimeSlotTables { get; set; }
        public virtual DbSet<GenderTable> GenderTables { get; set; }
        public virtual DbSet<LabAppointTable> LabAppointTables { get; set; }
        public virtual DbSet<LabTable> LabTables { get; set; }
        public virtual DbSet<LabTestDetailsTable> LabTestDetailsTables { get; set; }
        public virtual DbSet<LabTestTable> LabTestTables { get; set; }
        public virtual DbSet<LabTimeSlotTable> LabTimeSlotTables { get; set; }
        public virtual DbSet<PatientTable> PatientTables { get; set; }
        public virtual DbSet<PatientTestDetailTable> PatientTestDetailTables { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<UserTable> UserTables { get; set; }
        public virtual DbSet<UserTypeTable> UserTypeTables { get; set; }
    }
}
