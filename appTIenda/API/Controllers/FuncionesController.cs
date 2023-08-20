using Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Models.Entidades;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FuncionesController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public FuncionesController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet("GetFuncionMaxMin")]
        public async Task<ActionResult<IEnumerable<Producto>>> GetFuncionMaxMin()
        {
            var lista = await (from p in _context.Productos.Include(p => p.Categoria)
                               group p by p.Categoria.NomCategoria into gfmm
                               select new
                               {
                                   Categoria = gfmm.Key,
                                   PrecioMinimo = (from p2 in gfmm select p2.Precio).Min(),
                                   PrecioMaximo = (from p2 in gfmm select p2.Precio).Max()
                               }).ToListAsync();

            return Ok(lista);
        }

        [HttpGet("GetFuncionSum")]
        public async Task<ActionResult<IEnumerable<Detalle_Ingreso>>> GetFuncionSum()
        {
            var lista = await (from p in _context.Detalle_Ingresos.Include(p => p.Producto).ThenInclude(p => p.Categoria)
                               where p.Producto.StockProducto > 10
                               group p by new {p.Producto.Categoria.NomCategoria, 
                                               p.Producto.NomProducto, p.Producto.StockProducto }  into gfs
                               select new
                               {
                                   DetalleIngreso = gfs.Key,
                                   MontoTotal = (from p2 in gfs select p2.PrecioDetaIngreso).Max()
                               }).ToListAsync();

            return Ok(lista);
        }

        [HttpGet("GetFuncionCount")]
        public async Task<ActionResult<IEnumerable<Usuario>>> GetFuncionCount()
        {
            var lista = await (from u in _context.Usuarios.Include(u => u.Rol)
                               where u.EstadoUsuario == "Activo"
                               group u by u.TipoDocumento into gfc
                               select new
                               {
                                   Usuario = gfc.Key,
                                   CantidadDocumento = gfc.Count()
                               }).ToListAsync();

            return Ok(lista);
        }     
    }
}
