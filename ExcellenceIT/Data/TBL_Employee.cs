//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ExcellenceIT.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class TBL_Employee
    {
        public int EmpID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Gender { get; set; }
        public Nullable<System.DateTime> DOB { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Department { get; set; }
        public Nullable<int> CityID { get; set; }
        public Nullable<int> StateID { get; set; }
        public Nullable<int> CountryID { get; set; }
        public Nullable<int> Pincode { get; set; }
        public string EmployeePhoto { get; set; }
        public string Hobbies { get; set; }
    
        public virtual TBL_City TBL_City { get; set; }
        public virtual TBL_Country TBL_Country { get; set; }
        public virtual TBL_State TBL_State { get; set; }
    }
}
