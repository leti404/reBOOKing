using System.Diagnostics;
using System.Text.RegularExpressions;
using Microsoft.AspNetCore.Mvc;
using reBOOKing.Controllers;
namespace reBOOKing.Controllers;
using System.Diagnostics;
using System.Text;
using Microsoft.AspNetCore.Mvc;

public class AuthController : Controller
{
    private readonly ILogger<AuthController> _logger;

    public AuthController(ILogger<AuthController> logger)
    {
        _logger = logger;
    }

    public IActionResult Login()
    {
        if (HttpContext.Session.GetString("user") != null)
        {
            return RedirectToAction("Index", "Home");
        }
        return View();
    }

    [HttpPost]
    public IActionResult VerificarLogin(string gmail, string contraseña)
    {
        Usuario user = BD.Login(gmail);

        if (user.gmail == gmail && user.contraseña == contraseña)
        {
            HttpContext.Session.SetString("user", new Usuario(user.id, user.nombre_usuario, contraseña, gmail, user.fecha_nacimiento, user.id_publicacion).ToString());
            return RedirectToAction("Index", "Home");
        }
        else
        {
            ViewBag.Error = "Email o contraseña incorrectos.";
            return View("Login");
        }
    }
    public IActionResult Logout()
    {
        HttpContext.Session.Remove("user");
        return RedirectToAction("Login");
    }

}