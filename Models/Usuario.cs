using System.Text.Json;

public class Usuario
{
    public int id { get; set; }
    public string nombre { get; set; }
    public string apellido { get; set; }
    public string nombre_usuario { get; set; }
    public string contraseña { get; set; }
    public string gmail { get; set; }
    public DateTime fecha_nacimiento { get; set; }
    public string nombre_escuela { get; set; }
    public string año_escolar { get; set; }
    public int id_publicacion { get; set; }

    // Constructor sin parámetros
    public Usuario()
    {
    }

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
}
