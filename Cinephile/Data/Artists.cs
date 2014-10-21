//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Cinephile.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Artists
    {
        public Artists()
        {
            this.MoviesPlayedIn = new HashSet<Movies>();
            this.MoviesDirected = new HashSet<Movies>();
        }
    
        public System.Guid Id { get; set; }
        public string FullName { get; set; }
        public Nullable<System.DateTime> BirthDate { get; set; }
        public int CounryId { get; set; }
        public string PicturePath { get; set; }
    
        public virtual Coutries Coutries { get; set; }
        public virtual ICollection<Movies> MoviesPlayedIn { get; set; }
        public virtual ICollection<Movies> MoviesDirected { get; set; }
    }
}