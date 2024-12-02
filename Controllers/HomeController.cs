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

    public IActionResult Carrito(int IdUsuario)
    {
        ViewBag.ListaCarrito = BD.ListarCarrito(IdUsuario);
        ViewBag.TotalCarrtio = BD.CalcularTotalCarrito(IdUsuario);
        return View();
    }
    public IActionResult Registrarse()
    {
        ViewBag.usuario1 = User;
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
    [HttpGet]
    public IActionResult CrearPublicacion()
    {
        ViewBag.ListaLibros = BD.ListarLibros();
        ViewBag.ListaEstados = BD.ListarEtiquetas();
        ViewBag.ListaMaterias = BD.ListarMaterias();
        ViewBag.ListaEstados = BD.ListarEtiquetas();
        ViewBag.ListaMaterias = BD.ListarMaterias();
        ViewBag.usuario1 = User;
        return View();
    }
    public IActionResult TusFavoritos(int idUsuario)
    {
        ViewBag.Listafavortios = BD.ListarFavoritos(idUsuario);
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

    public IActionResult IniciarSesion(string email, string password)
    {
        Console.WriteLine("hola");
        Usuario usuario = BD.IniciarSesion(email, password);
        if (usuario != null)
        {
            HttpContext.Session.SetString("user", usuario.ToString()); 
            return RedirectToAction("Home", "Index"); 
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
    
    public IActionResult BuscarLibro(string query)
    {
        ViewBag.listaPublicaciones = BD.FiltrarLibrosPorBusquedaTexto(query);
        ViewBag.ListaMaterias = BD.ListarMaterias();
        ViewBag.ListaEtiquetas = BD.ListarEtiquetas();
        return View("Index");
    }

    [HttpPost]
    public IActionResult RemoveItem([FromBody] int id)
    {
        try
        {
            bool isDeleted = BD.EliminarItemCarrito(int userId, int id);
            
            if (isDeleted)
            {
                return Ok(); 
            }
            else
            {
                return BadRequest("El libro no puedo ser eliminado"); 
            }
        }
    }
   
}