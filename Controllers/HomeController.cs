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

    public IActionResult Index(int? materia, int? año, int? precio, int? estado)
    {
        decimal precioMin = 0m;
        decimal precioMax = precio.HasValue ? Convert.ToDecimal(precio.Value.ToString("F2")) : decimal.MaxValue;

        if (materia.HasValue || año.HasValue || estado.HasValue || precio.HasValue)
        {
            ViewBag.listaPublicaciones = BD.FiltrarLibros(
                materia ?? 0,
                año ?? 0,
                precioMin,
                precioMax,
                estado ?? 0
            );
        }
        else
        {
            ViewBag.listaPublicaciones = BD.ListarPublicaciones();
        }

        return View();
    }

    public IActionResult Publicacion()
    {
        //Console.WriteLine(id);
        //List<publicaciones> listaPublicaciones = BD.ListarPublicaciones();
        //publicaciones publicacion = listaPublicaciones.FirstOrDefault(p => p.id == id);

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
