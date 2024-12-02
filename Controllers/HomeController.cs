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
        
        ViewBag.usuario1 = User;
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
        ViewBag.usuario1 = User;
        return View();
    }
    public IActionResult SobreNosotros()
    {
        ViewBag.usuario1 = User;
        return View();
    }

    public IActionResult Carrito()
    {
        ViewBag.usuario1 = User;
        return View();
    }
    public IActionResult Registrarse(Usuario usua)
    {
        ViewBag.usuario1 = User;
        return View();
    }
    public IActionResult RegistroExito()
    {
        ViewBag.usuario1 = User;
        return View();
    }
    public IActionResult Usuario()
    {
        ViewBag.usuario1 = User;
        return View();
    }
    public IActionResult CrearPublicacion()
    {
        ViewBag.ListaLibros = BD.ListarLibros();
        ViewBag.ListaEstados = BD.ListarEtiquetas();
        ViewBag.ListaMaterias = BD.ListarMaterias();
        ViewBag.usuario1 = User;
        return View();
    }
    public IActionResult TusFavoritos()
    {
        ViewBag.usuario1 = User;
        return View();
    }

    public IActionResult TusPublicaciones()
    {
        ViewBag.usuario1 = User;
        return View();
    }

    public IActionResult TusReviews()
    {
        ViewBag.usuario1 = User;
        return View();
    }



    public IActionResult Privacy()
    {
        ViewBag.usuario1 = User;
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }

    public IActionResult PublicacionExitosa()
    {
        ViewBag.usuario1 = User;
        return View();
    }

    public IActionResult ConoceMas()
    {
        ViewBag.usuario1 = User;
        return View();
    }
    public static Usuario User = null;
    [HttpPost]
    public IActionResult IniciarSesion(string email, string contraseña)
    {
        User = BD.IniciarSesion(email, contraseña);
        if (User != null)
        {
            return RedirectToAction( "Index", "Home"); 
        }
        else
        {
            ViewBag.Error = "Usuario y/o contraseña incorrectos";
            return View();
        }

        ViewBag.usuario1 = User;
    }

    public IActionResult Logout()
    {
        User = null;
        return RedirectToAction("Index", "Home");
    }

}