//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WikiCEP_Project.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Definicione
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Definicione()
        {
            this.Ejemplos = new HashSet<Ejemplo>();
            this.Imagenes = new HashSet<Imagene>();
            this.Temas = new HashSet<Tema>();
            this.TutorialesYouTubes = new HashSet<TutorialesYouTube>();
        }
    
        public int IDDefinicion { get; set; }
        public string Titulo { get; set; }
        public string IDAutor { get; set; }
        public Nullable<System.DateTime> FechaCreacion { get; set; }
        public string Texto { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Ejemplo> Ejemplos { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Imagene> Imagenes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tema> Temas { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TutorialesYouTube> TutorialesYouTubes { get; set; }
    }
}
