using ExcellenceIT.Data;
using ExcellenceIT.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ExcellenceIT.Controllers
{
    public class EmployeeController : Controller
    {
        // GET: Employee
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetEmpData()
        {
            try
            {
                var dbContext = new ExcellenceITEntities();

                var resultData = dbContext.TBL_Employee.Select(x => new EmployeeViewModel
                {
                    City = x.TBL_City.Name,
                    Country = x.TBL_Country.Name,
                    Department = x.Department,
                    DOB = x.DOB.Value.Day + "/" + x.DOB.Value.Month + "/" + x.DOB.Value.Year,
                    Email = x.Email,
                    FirstName = x.FirstName,
                    LastName = x.LastName,
                    Gender = x.Gender,
                    EmpID = x.EmpID,
                    Hobbies = x.Hobbies,
                    Phone = x.Phone,
                    Pincode = x.Pincode ?? 0,
                    State = x.TBL_State.Name,
                    EmployeePhoto = x.EmployeePhoto
                }).ToList();

                return Json(new { isSuccess = true, result = resultData }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                return Json(new { isSuccess = false }, JsonRequestBehavior.AllowGet);
            }
        }


        public ActionResult GetStateData(int id)
        {
            try
            {
                var dbContext = new ExcellenceITEntities();

                var resultData = dbContext.TBL_State.Where(x => x.CountryID == id).Select(x => new SelectListItem
                {
                    Value = x.StateID.ToString(),
                    Text = x.Name,
                }).ToList();

                return Json(new { isSuccess = true, result = resultData }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                return Json(new { isSuccess = false }, JsonRequestBehavior.AllowGet);
            }
        }


        public ActionResult GetCityData(int id)
        {
            try
            {
                var dbContext = new ExcellenceITEntities();

                var resultData = dbContext.TBL_City.Where(x => x.StateID == id).Select(x => new SelectListItem
                {
                    Value = x.CityID.ToString(),
                    Text = x.Name,
                }).ToList();

                return Json(new { isSuccess = true, result = resultData }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                return Json(new { isSuccess = false }, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult Create(int? id)
        {
            var dbContext = new ExcellenceITEntities();

            var EmpData = dbContext.TBL_Employee.Where(x => x.EmpID == id).Select(x => new EmployeeCreateModel
            {
                CityID = x.CityID ?? 1,
                CountryID = x.CountryID ?? 1,
                Department = x.Department,
                DOB = x.DOB ?? DateTime.Now,
                Email = x.Email,
                EmpID = x.EmpID,
                EmployeePhoto = x.EmployeePhoto,
                FirstName = x.FirstName,
                Gender = x.Gender,
                Hobbies = x.Hobbies,
                LastName = x.LastName,
                Phone = x.Phone,
                StateID = x.StateID ?? 1,
                Pincode = x.Pincode ?? 0,
            }).FirstOrDefault();

            ViewBag.Country = dbContext.TBL_Country.Select(x => new SelectListItem { Text = x.Name, Value = x.CountryID.ToString() }).ToList();
            if (EmpData != null)
            {
                ViewBag.State = dbContext.TBL_State.Where(x => x.CountryID == EmpData.CountryID).Select(x => new SelectListItem
                {
                    Value = x.StateID.ToString(),
                    Text = x.Name,
                }).ToList();
                ViewBag.City = dbContext.TBL_City.Where(x => x.StateID == EmpData.StateID).Select(x => new SelectListItem
                {
                    Value = x.CityID.ToString(),
                    Text = x.Name,
                }).ToList();
            }
            return View(EmpData);
        }

        public ActionResult DeleteEmp(int? id)
        {
            try
            {
                var dbContext = new ExcellenceITEntities();
                var EmpData = dbContext.TBL_Employee.Where(x => x.EmpID == id).FirstOrDefault();

                dbContext.TBL_Employee.Remove(EmpData);
                dbContext.SaveChanges();
                return Json(new { isSuccess = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception e)
            {
                return Json(new { isSuccess = false }, JsonRequestBehavior.AllowGet);
            }

        }


        [HttpPost]
        public ActionResult Create(EmployeeCreateModel model)
        {
            try
            {
                var imageName = string.Empty;

                if (System.Web.HttpContext.Current.Request.Files.AllKeys.Any())
                {
                    var EmpPhoto = System.Web.HttpContext.Current.Request.Files["file"];
                    if (EmpPhoto.ContentLength > 0)
                    {
                        var profileName = Path.GetFileName(EmpPhoto.FileName);
                        var ext = Path.GetExtension(EmpPhoto.FileName);
                        imageName = DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString() + ext;
                        var comPath = Server.MapPath("/Images/") + imageName;
                        EmpPhoto.SaveAs(comPath);
                    }
                }
                else
                {
                    imageName = model.EmployeePhoto;
                }

                var dbContext = new ExcellenceITEntities();
                var datamodel = new TBL_Employee
                {
                    CityID = model.CityID,
                    StateID = model.StateID,
                    Pincode = model.Pincode,
                    CountryID = model.CountryID,
                    Department = model.Department,
                    Email = model.Email,
                    EmpID = model.EmpID,
                    FirstName = model.FirstName,
                    LastName = model.LastName,
                    Gender = model.Gender,
                    Hobbies = model.Hobbies,
                    Phone = model.Phone,
                    DOB = model.DOB,
                    EmployeePhoto = imageName
                };

                if (model.EmpID > 0)
                {
                    dbContext.Entry(datamodel).State = System.Data.Entity.EntityState.Modified;
                    TempData["Message"] = "Emplyoyee Updated Suceessfully";

                }
                else
                {
                    dbContext.TBL_Employee.Add(datamodel);
                    TempData["Message"] = "Emplyoyee Added Suceessfully";
                }
                dbContext.SaveChanges();
                return Json(new { isSuccess = true }, JsonRequestBehavior.AllowGet);

            }
            catch (Exception e)
            {
                return Json(new { isSuccess = false }, JsonRequestBehavior.AllowGet);

            }

        }

    }
}