using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Entidades
{
    [Table("Usuario")]
    public class Usuario
    {
        [Key]
        [Column("UsuarioId")]
        public int Id { get; set; }

        public string NombreUsuario { get; set; }

        public string TipoDocumento { get; set; }

        // [Column(TypeName = "int(7)")]
        public int NumDocumento { get; set; }

        public int Telefono { get; set; }

        public string Clave { get; set; }

        public string EstadoUsuario { get; set; }
        
        public int RolId { get; set; }

        [ForeignKey("RolId")]
        public Rol Rol { get; set; }
    }
}
