﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace VacunasAntiCovid
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class VacunasAntiCovidEntities : DbContext
    {
        public VacunasAntiCovidEntities()
            : base("name=VacunasAntiCovidEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<CentroDeAsistencia> CentroDeAsistencias { get; set; }
        public virtual DbSet<Ciudadano> Ciudadanoes { get; set; }
        public virtual DbSet<DestinoVacuna> DestinoVacunas { get; set; }
        public virtual DbSet<HistoricoCiudadano> HistoricoCiudadanoes { get; set; }
        public virtual DbSet<Rol> Rols { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<Usuario> Usuarios { get; set; }
        public virtual DbSet<Vacuna> Vacunas { get; set; }
    }
}
