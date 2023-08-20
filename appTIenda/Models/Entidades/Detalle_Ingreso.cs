using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Entidades
{
    [Table("Detalle_Ingreso")]
    public class Detalle_Ingreso
    {
        [Key]
        [Column("DetalleIngresoId")]
        public int Id { get; set; }

        public int CantidadDetaIngreso { get; set; }

        [Column(TypeName = "decimal(7,2)")]
        public decimal PrecioDetaIngreso { get; set; }
        
        public int ProductoId { get; set; }

        [ForeignKey("ProductoId")]
        public Producto Producto { get; set; }
       
        public int IngresoId { get; set; }

        [ForeignKey("IngresoId")]
        public Ingreso Ingreso { get; set; }
    }
}
