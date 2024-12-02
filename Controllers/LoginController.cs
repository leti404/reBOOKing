// No esta queriendo andar 
using System.Diagnostics;
using System.Text.RegularExpressions;
using Microsoft.AspNetCore.Mvc;
using reBOOKing.Controllers;
namespace reBOOKing.Controllers;
using System.Diagnostics;
using System.Text;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using reBOOKing.Models;

public class AuthController : Controller
{

    public static Usuario User = null;
    [HttpPost]
    public IActionResult IniciarSesion(string email, string password)
    {
        Console.WriteLine("hola");

        User = BD.IniciarSesion(email, password);
        if (User != null)
        {
            return RedirectToAction("Home", "Index"); 
        }
        else
        {
            ViewBag.Error = "Usuario y/o contraseña incorrectos";
            return View();
        }
    }

    public IActionResult Logout()
    {
        User = null;
        return RedirectToAction("Index", "Home");
    }
}