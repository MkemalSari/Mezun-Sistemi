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
    
    public partial class Referan
    {
        public int referansID { get; set; }
        public Nullable<int> kullaniciID { get; set; }
        public Nullable<int> etkinlikID { get; set; }
        public Nullable<bool> onay { get; set; }
    
        public virtual Etkinlik Etkinlik { get; set; }
        public virtual Kullanici Kullanici { get; set; }
    }
}