using System.Text.Json;

public class Usuario
{
    public int id { get; set; }
    public string nombre_usuario { get; set; }
    public string? contraseña { get; set; }
    public string? gmail { get; set; }
    public DateTime fecha_nacimiento { get; set; }
    public int id_publicacion { get; set; }

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
