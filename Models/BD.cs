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
    public static bool RegistrarUsuario(Usuario usua)
    {
        Console.WriteLine(usua);
        bool exito = false;
        if(usua != null)
        {
                using(SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
            {
                string SQL = "INSERT INTO Usuario(nombre, apellido, nombre_usuario, contraseña, gmail, fecha_nacimiento, nombre_escuela, año_escolar) VALUES (@pnombre, @papellido, @pnombre_usuario, @pcontraseña, @pgmail, @pfecha_nacimiento, @pnombre_escuela, @paño_escolar )";
                using(SqlConnection db = new SqlConnection(_connectionString)){
                db.Execute(SQL, new{pnombre = usua.nombre, papellido = usua.apellido, pnombre_usuario = usua.nombre_usuario, pcontraseña = usua.contraseña, pgmail = usua.gmail, pfecha_nacimiento = usua.fecha_nacimiento, pnombre_escuela = usua.nombre_escuela, paño_escolar = usua.año_escolar});
                }
            }
            exito=true;
        }
        return exito;
    }

    public static int RegistrarLibro(Libro libro)
    {
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            string sql = "INSERT INTO Libro (nombre, descripcion, año, id_materia, id_editorial, id_autor) OUTPUT INSERTED.ID VALUES (@nombre, @descripcion, @año, @id_materia, @id_editorial, @id_autor)";
            int newId = connection.QuerySingle<int>(sql, new {nombre = libro.nombre, descripcion = libro.descripcion, año = libro.año, id_materia = libro.id_materia, id_editorial = 6, id_autor = 9});
            return newId;
        }
    }

    public static void RegistrarPublicacion(Publicacion publicacion)
    {
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            string sql = "INSERT INTO Publicacion (id_libro, precio, id_usuario, fecha, imagen) VALUES (@id_libro, @precio, @id_usuario, @fecha, @imagen)";
            connection.Execute(sql, new {id_libro = publicacion.id_libro, precio = publicacion.precio, id_usuario = publicacion.id_usuario, fecha = publicacion.fecha, imagen = publicacion.imagen});
        }
    }


    public static List<Publicacion> _ListadoFavoritos = new List<Publicacion>();

    public static List<Publicacion> ListarFavoritos(int idUsuario)
    {
        using (SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "SELECT Favorito.id_publicacion, Publicacion.id_libro, Publicacion.precio, Publicacion.fecha, Publicacion.imagen FROM Favorito JOIN Publicacion ON Favorito.id_publicacion = Publicacion.id WHERE Favorito.id_usuario = @IdUsuario;";
            _ListadoFavoritos = TP_REBOOKING.Query<Publicacion>(sql, new { IdUsuario = idUsuario }).ToList();
        }
        return _ListadoFavoritos;
    }

    public static List<Publicacion> _ListadoPubliUs = new List<Publicacion>();

    public static List<Publicacion> ListarPublicacionesUsuario(int idUsuario)
    {
        using (SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = @"SELECT Publicacion.id, Publicacion.id_libro, Publicacion.precio, Publicacion.fecha, Publicacion.imagen FROM Publicacion WHERE Publicacion.id_usuario = @IdUsuario;";
            
            _ListadoPubliUs = TP_REBOOKING.Query<Publicacion>(sql, new { IdUsuario = idUsuario }).ToList();
        }
        return _ListadoPubliUs;
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
    public static List<Publicacion> ListarCarrito(int IdUsuario)
    {
        using(SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = @"SELECT p.* FROM Carrito c INNER JOIN Publicacion p ON c.id_publicacion = p.id WHERE c.id_usuario = @idUsuario";
            _ListadoCarrito = TP_REBOOKING.Query<Publicacion>(sql, new { idUsuario = IdUsuario }).ToList(); 
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
            string sql = "exec ObtenerNombreLibroPorPublicacionID @PublicacionID";
            string nombreLibro = TP_REBOOKING.QueryFirstOrDefault<string>(sql, new { publicacionID });
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
    Usuario usuarioIniciado;
    public static Usuario IniciarSesion(string gmail, string contraseña)
    {
        
        using (SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Usuario WHERE gmail = @Gmail AND contraseña = @Contraseña;";
            Usuario usuarioIniciado = TP_REBOOKING.QueryFirstOrDefault<Usuario>(sql, new { Gmail = gmail, Contraseña = contraseña });
            return usuarioIniciado;
        }
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

    public static List<Review> _ListadoReviews = new List<Review>();
    
    public static List<Review> ListarReviewsPorUser(int userId)
    {
        using (SqlConnection connection = new SqlConnection(_connectionString))
        {
            string sql = @"SELECT r.id, r.id_publicacion, r.usuario_escritor, r.usuario_recibidor, r.estrellas, r.descripcion FROM Review r WHERE r.usuario_escritor = @UserId";
            _ListadoReviews = connection.Query<Review>(sql, new { UserId = userId }).ToList();
        }
        return _ListadoReviews;
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

    public static List<Etiqueta> _ListadoEtiquetas = new List<Etiqueta>();
    
    public static List<Etiqueta> ListarEtiquetas()
    {
        using(SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "exec ObtenerEtiquetas";
            _ListadoEtiquetas = TP_REBOOKING.Query<Etiqueta>(sql).ToList(); 
        }
        return _ListadoEtiquetas;
    }

    public static List<Publicacion> _ListadoPublicacionesConFiltroBusqueda = new List<Publicacion>();
    
    public static List<Publicacion> FiltrarLibrosPorBusquedaTexto(string busquedaTexto)
    {
        using (SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "exec FiltrarPublicacionesPorNombreLibro @BusquedaTexto";
            _ListadoPublicacionesConFiltroBusqueda = TP_REBOOKING.Query<Publicacion>(sql, new {BusquedaTexto = busquedaTexto}).ToList();
        }
        return _ListadoPublicacionesConFiltroBusqueda;
    }
    public static decimal? CalcularTotalCarrito(int IdUsuario)
    {
        using (SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = @"SELECT SUM(Publicacion.precio) AS TotalCost FROM Carrito JOIN Publicacion ON Carrito.id_publicacion = Publicacion.id WHERE Carrito.id_usuario = @idUsuario";
            return TP_REBOOKING.QuerySingleOrDefault<decimal?>(sql, new { idUsuario = IdUsuario });
        }
    }

    static int count;
    public static bool EliminarItemCarrito(int userId, int publicacionId)
    {
        using (SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sqlDelete = @"DELETE FROM Carrito WHERE id_usuario = @UserId AND id_publicacion = @PublicacionId";
            string sqlCheck = @"SELECT COUNT(*) FROM Carrito WHERE id_usuario = @UserId AND id_publicacion = @PublicacionId";
            TP_REBOOKING.Execute(sqlDelete, new { UserId = userId, PublicacionId = publicacionId });
            count = TP_REBOOKING.QuerySingle<int>(sqlCheck, new { UserId = userId, PublicacionId = publicacionId });
        }
        bool exito = false;
        if (count == 0)
        {
            exito = true;
        }
        return exito;
    }
    
    public static List<Favorito> _ListadoPublicacionesFavorito = new List<Favorito>();
    
    public static List<Favorito> SP_AgregarAFavoritos(int idUsuario, int idPublicacion)
    {
        using (SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "exec SP_AgregarAFavoritos @idUsuario, @idPublicacion";
            _ListadoPublicacionesFavorito = TP_REBOOKING.Query<Favorito>(sql, new { idUsuario, idPublicacion }).ToList();
        }
        return _ListadoPublicacionesFavorito;

    }

    public static void EliminarFavoritos(int userId, int publicacionId)
    {
        using (SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sqlDelete = "DELETE FROM Favorito WHERE id_usuario = @UserId AND id_publicacion = @PublicacionId";
            TP_REBOOKING.Execute(sqlDelete, new { UserId = userId, PublicacionId = publicacionId });
        }
    }


    public static void AgregarAlCarrito(int idUsuario, int idPublicacion)
    {
        using (SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = @"INSERT INTO Carrito (id_usuario, id_publicacion) VALUES (@idUsuario, @idPublicacion);";
            TP_REBOOKING.Execute(sql, new { idUsuario, idPublicacion });
        }
    }

    public static Usuario ObtenerUsuarioPorId(int idUsuario)
    {
        using (SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "EXEC ObtenerUsuarioPorId @IdUsuario";
            Usuario usuario = TP_REBOOKING.QueryFirstOrDefault<Usuario>(sql, new { IdUsuario = idUsuario });

            return usuario;
        }
    }

public static bool VerificarFavorito(int idUsuario, int idPublicacion)
{
    using (SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
    {
        string sql = "EXEC VerificarFavorito @id_usuario, @id_publicacion";
        bool estaEnFavoritos = TP_REBOOKING.QueryFirstOrDefault<bool>(sql, new { id_usuario = idUsuario, id_publicacion = idPublicacion });

        return estaEnFavoritos;
    }
}


}

