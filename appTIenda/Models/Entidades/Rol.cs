using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Entidades
{
    [Table("Rol")]
    public class Rol
    {
        [Key]
        [Column("RolId")]
        public int Id { get; set; }

        public string NombreRol { get; set; }

        public string EstadoRol { get; set; }
    }
}
