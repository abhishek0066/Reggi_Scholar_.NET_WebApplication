﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ReggieScholar
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class ReggieRepoEntities : DbContext
    {
        public ReggieRepoEntities()
            : base("name=ReggieRepoEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<FILE> FILES { get; set; }
        public DbSet<LOGIN> LOGINs { get; set; }
        public DbSet<USER> USERS { get; set; }
    }
}