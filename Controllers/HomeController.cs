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
        ViewBag.publicacion = listaPublicaciones.FirstOrDefault(p => p.id == id);
        ViewBag.nombreLibro = BD.ObtenerNombreLibroPorPublicacion(id);
        ViewBag.estado = BD.ObtenerEtiquetaXPublicacion(id);
        ViewBag.descripcion = BD.ObtenerDescripcionPublicacion(id);
        ViewBag.usuario1 = User;
        /*Usuario hola = User;
        ViewBag.usuario1 = User;*/
       // ViewBag.ListaFavoritos = BD.ListarFavoritos(hola.id);
        return View();
    }
    public IActionResult SobreNosotros()
    {
        ViewBag.usuario1 = User;
        return View();
    }

    public IActionResult Carrito(int idPublicacion)
    {
        List<Publicacion> listaPublicaciones = BD.ListarPublicaciones();
        Publicacion publicacion = listaPublicaciones.FirstOrDefault(p => p.id == idPublicacion);
        ViewBag.nombreLibro = BD.ObtenerNombreLibroPorPublicacion(idPublicacion);
        ViewBag.estado = BD.ObtenerEtiquetaXPublicacion(idPublicacion);
        ViewBag.ListaCarrito = BD.ListarCarrito(User.id);
        ViewBag.TotalCarrtio = BD.CalcularTotalCarrito(User.id);
        ViewBag.usuario1 = User;
        return View();
    }

    public IActionResult AgregarCarrito(int idPublicacion)
    {
        List<Publicacion> listaPublicaciones = BD.ListarPublicaciones();
        Publicacion publicacion = listaPublicaciones.FirstOrDefault(p => p.id == idPublicacion);
        ViewBag.nombreLibro = BD.ObtenerNombreLibroPorPublicacion(idPublicacion);
        ViewBag.publicacion = publicacion;
        ViewBag.estado = BD.ObtenerEtiquetaXPublicacion(idPublicacion);
        ViewBag.descripcion = BD.ObtenerDescripcionPublicacion(idPublicacion);
        BD.AgregarAlCarrito(User.id, idPublicacion);
        ViewBag.usuario1 = User;
        return RedirectToAction("Carrito", "Home", new {idPublicacion = idPublicacion});
    }
    public IActionResult Registrarse()
    {
        ViewBag.usuario1 = User;
        return View();
    }

    [HttpPost]
    public IActionResult VerificarRegistro(string nombre, string apellido, string nombre_usuario, string contraseña, string gmail, DateTime fecha_nacimiento)
    {
        if(BD.RegistrarUsuario(nombre, apellido, nombre_usuario, contraseña, gmail, fecha_nacimiento))
        {
            return RedirectToAction("RegistroExito");
        }
        else
        {
            return View();
        }
    }

    [HttpPost]
    public IActionResult CrearPublicacion(PublicacionViewModel model)
    {
        ViewBag.usuario1 = User;
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
            id_usuario = User.id,
            fecha = DateTime.Now,
            imagen = model.Imagen
        });

        return RedirectToAction("PublicacionExitosa");
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
    public IActionResult TusFavoritos()
    {
        ViewBag.Listafavortios = BD.ListarFavoritos(User.id);
        ViewBag.usuario1 = User;
        return View();
    }

    public IActionResult TusPublicaciones()
    {
        ViewBag.ListaPubliUsua = BD.ListarPublicacionesUsuario(User.id);
        ViewBag.usuario1 = User;
        return View();
    }

    public IActionResult TusReviews()
    {
        ViewBag.Reviews = BD.ListarReviewsPorUser(User.id);
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


    public IActionResult ConoceMas()
    {
        ViewBag.usuario1 = User;
        return View();
    }
    public static Usuario User = null;
    [HttpPost]
    public IActionResult IniciarSesion(string email, string contraseña)
    {
        User = BD.usuarioIniciado;
        bool correcto = BD.IniciarSesion(email, contraseña);
        if (correcto)
        {
            User = BD.usuarioIniciado;
            return RedirectToAction( "Index", "Home"); 
        }
        else
        {
            ViewBag.Error = "Usuario y/o contraseña incorrectos";
            TempData["Mensaje"] = "Usuario y/o contraseña incorrectos.";

            return RedirectToAction( "Index", "Home");
        }
        ViewBag.usuario1 = User;
    }

    public IActionResult VerPerfil(int id)
    {
        ViewBag.UsuarioAjeno = BD.ObtenerUsuarioPorId(id);
        ViewBag.ListaPublicaciones = BD.ObtenerPublicacionesPorUsuario(id);
        ViewBag.ListaReviews = BD.ObtenerReviewsPorUsuario(id);
        
        return View();
    }
    public IActionResult ErrorInicioSesion()
    {
        
        return View();
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
    public IActionResult EliminarPubliCarrito(int idPublicacion)
    {
        ViewBag.usuario1 = User;
        bool isDeleted = BD.EliminarItemCarrito(User.id, idPublicacion);
        
        if (isDeleted)
        {
            return RedirectToAction("Carrito");
        }
        else
        {
            TempData["AlertMessage"] = "Hubo un error al eliminar el item del carrito, por favor intente nuevamente";
            return RedirectToAction("Carrito");
        }

    }

    
    public IActionResult AgregarAfavoritos(int id)
    {
        ViewBag.usuario1 = User;
        Console.WriteLine(User.apellido);
        BD.AgregarPublicacionAFavoritos(User.id, id);

        List<Publicacion> listaPublicaciones = BD.ListarPublicaciones();
        ViewBag.publicacion = listaPublicaciones.FirstOrDefault(p => p.id == id);
        ViewBag.nombreLibro = BD.ObtenerNombreLibroPorPublicacion(id);
        Console.WriteLine(ViewBag.nombreLibro);
        ViewBag.estado = BD.ObtenerEtiquetaXPublicacion(id);
        ViewBag.descripcion = BD.ObtenerDescripcionPublicacion(id);
        ViewBag.usuario1 = User;

        return RedirectToAction("Publicacion", "Home", new { id = id });
    }
    public IActionResult EliminarFavoritos(int id)
    {
        ViewBag.usuario1 = User;
        BD.EliminarFavoritos(User.id, id);

        List<Publicacion> listaPublicaciones = BD.ListarPublicaciones();
        ViewBag.publicacion = listaPublicaciones.FirstOrDefault(p => p.id == id);
        ViewBag.nombreLibro = BD.ObtenerNombreLibroPorPublicacion(id);
        ViewBag.estado = BD.ObtenerEtiquetaXPublicacion(id);
        ViewBag.descripcion = BD.ObtenerDescripcionPublicacion(id);
        ViewBag.usuario1 = User;

        return RedirectToAction("Publicacion", "Home", new { id = id });
    }
    public IActionResult VerUsuario(int idUsuario)
    {
        ViewBag.usuario1 = BD.ObtenerUsuarioPorId(idUsuario);
        return RedirectToAction("Usuario");
    }
   
}
