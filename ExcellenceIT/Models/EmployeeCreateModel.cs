using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExcellenceIT.Models
{
    public class EmployeeCreateModel
    {
        public int EmpID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Gender { get; set; }
        public DateTime DOB { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Department { get; set; }
        public int CityID { get; set; }
        public int StateID { get; set; }
        public int CountryID { get; set; }
        public int Pincode { get; set; }
        public string EmployeePhoto { get; set; }
        public string Hobbies { get; set; }

    }
}