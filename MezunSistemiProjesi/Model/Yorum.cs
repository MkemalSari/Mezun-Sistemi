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
    
    public partial class Yorum
    {
        public int yorumID { get; set; }
        public Nullable<int> paylasimID { get; set; }
        public Nullable<int> kullaniciID { get; set; }
        public string icerik { get; set; }
        public Nullable<System.DateTime> tarih { get; set; }
    
        public virtual Kullanici Kullanici { get; set; }
        public virtual Paylasim Paylasim { get; set; }
    }
}
