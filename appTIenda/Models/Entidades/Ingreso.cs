using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Entidades
{
    [Table("Ingreso")]
    public class Ingreso
    {
        [Key]
        [Column("IngresoId")]
        public int Id { get; set; }

        public DateTime FechaIngreso { get; set; }

        public string EstadoIngreso { get; set; }
        
        public int UsuarioId { get; set; }

        [ForeignKey("UsuarioId")]
        public Usuario Usuario { get; set; }
    }
}
