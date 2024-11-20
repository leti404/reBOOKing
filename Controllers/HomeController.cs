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

   public IActionResult Index(int materia, int anio, int precio, int estado)
    {
        int precioMin = 0;
        int precioMax = precio > 0 ? precio : int.MaxValue;

        ViewBag.ListaMaterias = BD.ListarMaterias();
        ViewBag.ListaEtiquetas = BD.ListarEtiquetas();
        
       ViewBag.listaPublicaciones = BD.FiltrarLibros(
                materia,
                anio,
                precioMin,
                precioMax,
                estado
            );
        

        return View();
    }



    public IActionResult Publicacion(int id)
    {
        List<Publicacion> listaPublicaciones = BD.ListarPublicaciones();
        Publicacion publicacion = listaPublicaciones.FirstOrDefault(p => p.id == id);

        ViewBag.nombreLibro = BD.ObtenerNombreLibroPorPublicacion(id);
        ViewBag.publicacion = publicacion;
        ViewBag.estado = BD.ObtenerEtiquetaXPublicacion(id);
        ViewBag.descripcion = BD.ObtenerDescripcionPublicacion(id);
        return View();
    }
    public IActionResult SobreNosotros()
    {
        return View();
    }
    
    public IActionResult Carrito()
    {
        return View();
    }
    public IActionResult Usuario()
    {
        return View();
    }
    public IActionResult CrearPublicacion()
    {
        ViewBag.ListaLibros = BD.ListarLibros();
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

    public IActionResult PublicacionExitosa()
    {
        
        return View();
    }

    public IActionResult ConoceMas()
    {
        
        return View();
    }

    public IActionResult Login()
    {
        // ViewBag.User = Usuario.FromString(HttpContext.Session.GetString("user"));
        /*if(ViewBag.User is null)
        {
            return RedirectToAction("Login", "Auth");
        }*/
        return View();
    }
    
   
}