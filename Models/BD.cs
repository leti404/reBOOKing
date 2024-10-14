using System.Data.SqlClient;
using System;
using Dapper;
public class BD{
private static string _connectionString = @"Server=localhost; DataBase=TP_REBOOKING;Trusted_Connection=True;";

    public static void ObtenerCategorias(Categorias cate)
    {
        
        using(SqlConnection PreguntadoORT = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Categorias";
            PreguntadoORT.Execute(sql, new{Nombre = cate.Nombre, Foto = cate.Foto}); 
            List<Categorias> listaCategorias = PreguntadoORT.Query<Categorias>(sql).ToList();
        }
     
    }


}