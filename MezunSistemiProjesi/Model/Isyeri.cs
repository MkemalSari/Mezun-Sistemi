//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MezunSistemiProjesi.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Isyeri
    {
        public Isyeri()
        {
            this.Isilanlaris = new HashSet<Isilanlari>();
            this.KullaniciIsGecmisis = new HashSet<KullaniciIsGecmisi>();
            this.Departmen = new HashSet<Departman>();
        }
    
        public int IsyeriID { get; set; }
        public string IsyeriAd { get; set; }
        public string IsyeriAdres { get; set; }
        public string IsyeriTell { get; set; }
        public Nullable<int> sehırID { get; set; }
        public Nullable<int> sektorID { get; set; }
        public string website { get; set; }
    
        public virtual ICollection<Isilanlari> Isilanlaris { get; set; }
        public virtual Sehir Sehir { get; set; }
        public virtual Sektor Sektor { get; set; }
        public virtual ICollection<KullaniciIsGecmisi> KullaniciIsGecmisis { get; set; }
        public virtual ICollection<Departman> Departmen { get; set; }
    }
}
