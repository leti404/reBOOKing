using System.Data.SqlClient;
using System;
using Dapper;
using System.Data;
public class BD{
private static string _connectionString = @"Server=localhost; DataBase=TP_REBOOKING;Trusted_Connection=True;";

    public static void ObtenerCategorias(Publicacion publi)
    {
        using(SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Publicacion";
            TP_REBOOKING.Execute(sql, new{nombre = publi.id_libro, Preci = publi.precio}); 
            List<Publicacion> listaCategorias = TP_REBOOKING.Query<Publicacion>(sql).ToList();
        }
     
    }

    public static List<Publicacion> _ListadoPublicaciones = new List<Publicacion>();
    public static List<Publicacion> ListarPublicaciones()
    {
        using(SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Publicacion";
            _ListadoPublicaciones = TP_REBOOKING.Query<Publicacion>(sql).ToList(); 
        }
        return _ListadoPublicaciones;
    }
    public static List<Publicacion> _ListadoCarrito = new List<Publicacion>();
    public static List<Publicacion> ListarCarrito()
    {
        using(SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Carrito";
            _ListadoCarrito = TP_REBOOKING.Query<Publicacion>(sql).ToList(); 
        }
        return _ListadoCarrito;
    }

    public static void AgregarPublicacion(int idLibro, int precioLibro, int UsuarioId, DateTime Fecha)
    {
        using(SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "exec AgregarPublicacion @idLib, @precio, @usuaId, @fecha";
            TP_REBOOKING.Execute(sql, new{idLib = idLibro, precio = precioLibro, usuaId = UsuarioId, fecha = Fecha}); 
        }
    }

    public static void AgregarPublicacionAFavoritos(int UsuarioID, int PublicacionID)
    {
        using(SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "exec AgregarPublicacionFavoritos @UsuarioId, @PublicacionId";
            TP_REBOOKING.Execute(sql, new{UsuarioId = UsuarioID, PublicacionId = PublicacionID}); 
        }
    }
    public static void EliminarPublicacion(int UsuarioID, int PublicacionID)
    {
        using(SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "exec AgregarPublicacionFavoritos @UsuarioId, @PublicacionId";
            TP_REBOOKING.Execute(sql, new{UsuarioId = UsuarioID, PublicacionId = PublicacionID}); 
        }
    }
    public static string ObtenerNombreLibroPorPublicacion(int publicacionID)
    {
        using (SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "exec ObtenerNombreLibroPorPublicacionID @publicacionID";
            string nombreLibro = TP_REBOOKING.QueryFirstOrDefault<string>(sql, new { PublicacionID = publicacionID });
            return nombreLibro;
        }
    }
    public static string ObtenerEtiquetaXPublicacion(int publicacionID)
    {
        using (SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "SELECT E.nombre FROM PublicacionXEtiqueta PXT JOIN Etiqueta E ON PXT.id_etiqueta = E.id WHERE PXT.id_publicacion = @PublicacionID;";
            string etiqueta = TP_REBOOKING.QueryFirstOrDefault<string>(sql, new { PublicacionID = publicacionID });
            return etiqueta;
        }
    }
    
    public static string ObtenerDescripcionPublicacion(int publicacionID)
    {
        using (SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "SELECT l.descripcion FROM Publicacion p JOIN Libro l ON p.id_libro = l.id WHERE p.id = @PublicacionID;";
            string descripcion = TP_REBOOKING.QueryFirstOrDefault<string>(sql, new { PublicacionID = publicacionID });
            return descripcion;
        }
    }
    public static string ObtenerNombreUsuario(int usuarioID)
    {
        using (SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "SELECT nombre_usuario FROM Usuario WHERE id = @UsuarioID;";
            string nombreUsuario = TP_REBOOKING.QueryFirstOrDefault<string>(sql, new { UsuarioID = usuarioID });
            return nombreUsuario;
        }
    }
    public static void AgregarLibro(string nombre, string materia, string descripcion, int anio, int autorId, int editorialId, int categoriaId)
    {
        using (SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "exec AgregarLibro @Nombre, @Materia, @Descripcion, @Anio, @AutorID, @EditorialID, @CategoriaID";
            TP_REBOOKING.Execute(sql, new { Nombre = nombre, Materia = materia, Descripcion = descripcion, Anio = anio, AutorID = autorId, EditorialID = editorialId, CategoriaID = categoriaId });
        }
    }
    public static void AgregarAutor(string nombre)
    {
        using (SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "exec AgregarAutor @Nombre";
            TP_REBOOKING.Execute(sql, new { Nombre = nombre });
        }
    }
    public static void AgregarCategoria(string nombre)
    {
        using (SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "exec AgregarCategoria @Nombre";
            TP_REBOOKING.Execute(sql, new { Nombre = nombre });
        }
    }
    public static void AgregarEditorial(string nombre)
    {
        using (SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "exec AgregarEditorial @Nombre";
            TP_REBOOKING.Execute(sql, new { Nombre = nombre });
        }
    }
    public static void AgregarPublicacion(int libroID, decimal precio, int usuarioID, DateTime fecha)
    {
        using (SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "exec AgregarPublicacion @LibroID, @Precio, @UsuarioID, @Fecha";
            TP_REBOOKING.Execute(sql, new { LibroID = libroID, Precio = precio, UsuarioID = usuarioID, Fecha = fecha });
        }
    }
    public static void EliminarPublicacion(int publicacionID)
    {
        using (SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "exec EliminarPublicacion @PublicacionID";
            TP_REBOOKING.Execute(sql, new { PublicacionID = publicacionID });
        }
    }
    public static void AgregarReview(int publicacionID, int usuarioEscritor, int usuarioRecibidor, int estrellas, string descripcion)
    {
        using (SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "exec AgregarReview @PublicacionID, @UsuarioEscritor, @UsuarioRecibidor, @Estrellas, @Descripcion";
            TP_REBOOKING.Execute(sql, new { PublicacionID = publicacionID, UsuarioEscritor = usuarioEscritor, UsuarioRecibidor = usuarioRecibidor, Estrellas = estrellas, Descripcion = descripcion });
        }
    }
    public static void AgregarEtiquetaAUnaPublicacion(int publicacionID, int etiquetaID)
    {
        using (SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "exec AgregarEtiquetaAUnaPublicacion @PublicacionID, @EtiquetaID";
            TP_REBOOKING.Execute(sql, new { PublicacionID = publicacionID, EtiquetaID = etiquetaID });
        }
    }

    public static List<Publicacion> _ListadoPublicacionesConFiltro = new List<Publicacion>();
    
    public static List<Publicacion> FiltrarLibros(int materia, int año, int precioMin, int precioMax, int etiqueta)
    {
        using (SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "exec FiltrarLibros @MateriaID, @Anio, @PrecioMin, @PrecioMax, @EtiquetaId";
            _ListadoPublicacionesConFiltro = TP_REBOOKING.Query<Publicacion>(sql, new {  MateriaId = materia, Anio = año, PrecioMin = precioMin, PrecioMax = precioMax, EtiquetaId = etiqueta}).ToList();
        }
 
        return _ListadoPublicacionesConFiltro;

    }
    public static Usuario usuarioIniciado;
    public static Usuario Login(string gmail)
    {
        using (SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Usuario WHERE gmail = @Gmail;";
            usuarioIniciado = TP_REBOOKING.Query<Usuario>(sql, new { Gmail = gmail }).FirstOrDefault();
        }
        return usuarioIniciado;
    }
    public static List<Libro> _ListadoLibros = new List<Libro>();
    
    public static List<Libro> ListarLibros()
    {
        using(SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "exec ListarLibros";
            _ListadoLibros = TP_REBOOKING.Query<Libro>(sql).ToList(); 
        }
        return _ListadoLibros;
    }

    public static List<Materia> _ListadoMaterias = new List<Materia>();
    
    public static List<Materia> ListarMaterias()
    {
        using(SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "exec ObtenerMaterias";
            _ListadoMaterias = TP_REBOOKING.Query<Materia>(sql).ToList(); 
        }
        return _ListadoMaterias;
    }
}

