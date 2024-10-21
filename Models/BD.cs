using System.Data.SqlClient;
using System;
using Dapper;
public class BD{
private static string _connectionString = @"Server=localhost; DataBase=TP_REBOOKING;Trusted_Connection=True;";

    public static void ObtenerCategorias(publicaciones publi)
    {
        using(SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM publicaciones";
            TP_REBOOKING.Execute(sql, new{nombre = publi.libro, Preci = publi.precio}); 
            List<publicaciones> listaCategorias = TP_REBOOKING.Query<publicaciones>(sql).ToList();
        }
     
    }

    public static List<publicaciones> _ListadoPublicaciones = new List<publicaciones>();
    public static List<publicaciones> ListarPublicaciones()
    {
        using(SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM publicaciones";
            _ListadoPublicaciones = TP_REBOOKING.Query<publicaciones>(sql).ToList(); 
        }
        return _ListadoPublicaciones;
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
            string nombreLibro = TP_REBOOKING.QueryFirstOrDefault<string>(sql, new { PublicacionID = publicacionID });
            return nombreLibro;
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
}