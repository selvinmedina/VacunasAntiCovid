//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Ciudadano
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Ciudadano()
        {
            this.HistoricoCiudadanoes = new HashSet<HistoricoCiudadano>();
        }
    
        public int Id { get; set; }
        public string Identidad { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public System.DateTime FechaNacimiento { get; set; }
        public bool Activo { get; set; }
        public int UsuarioAgregaId { get; set; }
        public System.DateTime FechaAgrega { get; set; }
        public Nullable<System.DateTime> FechaModifica { get; set; }
        public Nullable<int> UsuarioModificaId { get; set; }
    
        public virtual Usuario Usuario { get; set; }
        public virtual Usuario Usuario1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HistoricoCiudadano> HistoricoCiudadanoes { get; set; }
    }
}
