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
    
    public partial class Yasaklilar
    {
        public int yasakID { get; set; }
        public Nullable<int> kullaniciID { get; set; }
        public Nullable<int> adminID { get; set; }
        public string detay { get; set; }
        public Nullable<System.DateTime> yasakTarihi { get; set; }
        public Nullable<System.DateTime> yasakSuresi { get; set; }
    
        public virtual Admin Admin { get; set; }
        public virtual Kullanici Kullanici { get; set; }
    }
}
