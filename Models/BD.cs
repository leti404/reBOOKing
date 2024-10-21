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

}