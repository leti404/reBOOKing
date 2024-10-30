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
    //HACER QUE EL BUTTON DE FILTROS TE TRAIGA ACA(A UNA VIEW NUEVA), AGARRE LOS FILTROS Y LO LLEVE A LA VIEW
    public IActionResult Index()
    {
        ViewBag.listaPublicaciones = BD.ListarPublicaciones();
        return View();
    }

    public IActionResult Publicacion(int id)
    {
        List<publicaciones> listaPublicaciones = BD.ListarPublicaciones();
        publicaciones publicacion = listaPublicaciones.FirstOrDefault(p => p.id == id);

        ViewBag.nombreLibro = BD.ObtenerNombreLibroPorPublicacion(id);
        ViewBag.precio = publicacion.precio;
        ViewBag.usuario = publicacion.usuario;
        ViewBag.fecha = publicacion.fecha;
        ViewBag.imagen = publicacion.imagen;

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
