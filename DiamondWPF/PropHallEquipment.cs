//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DiamondWPF
{
    using System;
    using System.Collections.Generic;
    
    public partial class PropHallEquipment
    {
        public int Id { get; set; }
        public Nullable<int> Id_proposition { get; set; }
        public string Things { get; set; }
        public Nullable<float> BruttoPrice { get; set; }
        public Nullable<float> Vat { get; set; }
        public Nullable<int> Amount { get; set; }
        public Nullable<int> Days { get; set; }
    
        public virtual Proposition Proposition { get; set; }
    }
}