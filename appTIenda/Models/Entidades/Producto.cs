using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Entidades
{
    [Table("Producto")]
    public class Producto
    {
        [Key]
        [Column("ProductoId")]
        public int Id { get; set; }

        public string NomProducto { get; set; }

        public string DesProducto { get; set; }

        public int StockProducto { get; set; }

        public decimal Precio { get; set; }

        public DateTime FechProducto { get; set; }

        public string ImagenUrl { get; set; }

        public int CategoriaId { get; set; }

        [ForeignKey("CategoriaId")]
        public Categoria Categoria { get; set; }
    }
}
