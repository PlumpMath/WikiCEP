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
    
    public partial class TutorialesYouTube
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TutorialesYouTube()
        {
            this.Definiciones = new HashSet<Definicione>();
        }
    
        public int IDTutorial { get; set; }
        public string Titulo { get; set; }
        public string LinkYouTube { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Definicione> Definiciones { get; set; }
    }
}
