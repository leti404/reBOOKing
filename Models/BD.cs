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
    public static List<publicaciones> ListarPublicaciones()
    {
        using(SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM publicaciones";
            _ListadoPublicaciones = TP_REBOOKING.Query<publicaciones>(sql).ToList(); 
        }
        return _ListadoPublicaciones;
    }

        public static void AgregarPublicacion(publicaciones publi)
    {
        using(SqlConnection TP_REBOOKING = new SqlConnection(_connectionString))
        {
            string sql = "exec AgregarPublicacion idLib, p";
            TP_REBOOKING.Execute(sql, new{nombre = publi.libro, Preci = publi.precio}); 
            List<publicaciones> listaCategorias = TP_REBOOKING.Query<publicaciones>(sql).ToList();
        }
     
    }


}