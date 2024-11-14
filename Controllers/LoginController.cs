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
    public IActionResult Login(string email, string password)
    {
        Usuario usuario = BD.Login(email);
        if (usuario != null && usuario.contraseña == password)
        {
            HttpContext.Session.SetString("user", usuario.ToString()); 
            return RedirectToAction("Index", "Home"); 
        }
        ViewBag.Error = "Usuario o contraseña incorrectos";
        return View();
    }

    public IActionResult Logout()
    {
        HttpContext.Session.Remove("user");
        return RedirectToAction("Index", "Home");
    }
}