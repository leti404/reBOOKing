using System.Text.Json;

public class Usuario
{
    public int id { get; set; }
    public string nombre_usuario { get; set; }
    public string? contraseña { get; set; }
    public string? gmail { get; set; }
    public DateTime fecha_nacimiento { get; set; }
    public int id_publicacion { get; set; }

    // Constructor con 6 parámetros
    public Usuario(int id, string nombre_usuario, string? contraseña, string? gmail, DateTime fecha_nacimiento, int id_publicacion)
    {
        this.id = id;
        this.nombre_usuario = nombre_usuario;
        this.contraseña = contraseña;
        this.gmail = gmail;
        this.fecha_nacimiento = fecha_nacimiento;
        this.id_publicacion = id_publicacion;
    }

    public override string ToString()
    {
        return JsonSerializer.Serialize(this);
    }

    public static Usuario? FromString(string? json)
    {
        if (json is null)
        {
            return null;
        }
        return JsonSerializer.Deserialize<Usuario>(json);
    }
}
