using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExcellenceIT.Models
{
    public class EmployeeViewModel
    {
        public int EmpID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Gender { get; set; }
        public string DOB { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Department { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Country { get; set; }
        public int Pincode { get; set; }
        public string EmployeePhoto { get; set; }
        public string Hobbies { get; set; }

    }
}