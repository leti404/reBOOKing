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
    [HttpGet]
    public IActionResult Registrarse()
    {
        return View();
    }

    [HttpPost]
    public IActionResult Registrarse(Usuario usua)
    {
        if(BD.RegistrarUsuario(usua))
        {
            return RedirectToAction("RegistroExito");
        }
        else
        {
            return View(); // Podrías redirigir a una vista de error aquí si es necesario
        }
    }

    [HttpPost]
    public IActionResult CrearPublicacion(PublicacionViewModel model)
    {
        if (ModelState.IsValid)
        {
            // Primero, registrar el libro si no está en la base de datos
            int libroId;
            if (model.EnBiblioteca == "No")
            {
                libroId = BD.RegistrarLibro(new Libro
                {
                    nombre = model.NombreLibro,
                    año = model.Anio,
                    descripcion = model.Descripcion,
                    id_materia = model.IdMateria
                });
            }
            else
            {
                libroId = model.LibroSeleccionadoId;
            }

            // Registrar la publicación
            BD.RegistrarPublicacion(new Publicacion
            {
                id_libro = libroId,
                precio = model.Precio,
                id_usuario = model.IdUsuario,
                fecha = DateTime.Now,
                imagen = model.Imagen
            });

            return RedirectToAction("PublicacionExitosa");
        }
        return View(model);
    }

    public IActionResult PublicacionExitosa()
    {
        return View();
    }

    public IActionResult RegistroExito()
    {
        return View();
    }
    public IActionResult Usuario()
    {
        return View();
    }
    [HttpGet]
    public IActionResult CrearPublicacion()
    {
        ViewBag.ListaLibros = BD.ListarLibros();
        ViewBag.ListaEstados = BD.ListarEtiquetas();
        ViewBag.ListaMaterias = BD.ListarMaterias();
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
    
    public IActionResult BuscarLibro(string query)
    {
        ViewBag.listaPublicaciones = BD.FiltrarLibrosPorBusquedaTexto(query);
        ViewBag.ListaMaterias = BD.ListarMaterias();
        ViewBag.ListaEtiquetas = BD.ListarEtiquetas();
        return View("Index");
    }
   
}