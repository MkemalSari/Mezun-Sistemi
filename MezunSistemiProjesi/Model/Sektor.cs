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
    
    public partial class Sektor
    {
        public Sektor()
        {
            this.Isyeris = new HashSet<Isyeri>();
        }
    
        public int SektorID { get; set; }
        public string SektorAd { get; set; }
    
        public virtual ICollection<Isyeri> Isyeris { get; set; }
    }
}
