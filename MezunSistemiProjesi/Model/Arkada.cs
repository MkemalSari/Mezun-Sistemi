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
    
    public partial class Arkada
    {
        public int arkadasID { get; set; }
        public Nullable<int> kullaniciID1 { get; set; }
        public Nullable<int> kullaniciID2 { get; set; }
        public Nullable<bool> arkadaslikOnay { get; set; }
    
        public virtual Kullanici Kullanici { get; set; }
        public virtual Kullanici Kullanici1 { get; set; }
    }
}