using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using reBOOKing.Models;

namespace reBOOKing.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }
    public IActionResult SobreNosotros()
    {
        return View();
    }
    public IActionResult Donar()
    {
        return View();
    }
    
    public IActionResult CrearPublicacion()
    {
        return View();
    }
    public IActionResult TusFavoritos()
    {
        return View();
    }

    public IActionResult TusPublicaciones()
    {
        return View();
    }

    public IActionResult TusReviews()
    {
        return View();
    }



    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
