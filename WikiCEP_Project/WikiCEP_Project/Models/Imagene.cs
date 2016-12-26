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
    using System.ComponentModel.DataAnnotations;

    public partial class Imagene
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Imagene()
        {
            this.Definiciones = new HashSet<Definicione>();
        }
    
        public int IDImagen { get; set; }
        [Required]
        public string Titulo { get; set; }
        public Nullable<System.DateTime> FechaCreacion { get; set; }
        public string IDAutor { get; set; }
        public byte[] Imagen { get; set; }
        public string ImageMimeType { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Definicione> Definiciones { get; set; }
    }
}
