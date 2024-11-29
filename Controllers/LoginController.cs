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

    [HttpPost]
    public IActionResult IniciarSesion(string email, string password)
    {
        Console.WriteLine("hola");
        Usuario usuario = BD.IniciarSesion(email, password);
        if (usuario != null)
        {
            HttpContext.Session.SetString("user", usuario.ToString()); 
            return RedirectToAction("Home", "Index"); 
        }
        ViewBag.Error = "Usuario o contraseña incorrectos";
        return View("Index", "Home");
    }

    public IActionResult Logout()
    {
        HttpContext.Session.Remove("user");
        return RedirectToAction("Index", "Home");
    }
}