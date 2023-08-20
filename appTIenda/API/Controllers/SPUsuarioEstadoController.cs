using Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Models.Entidades;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SPUsuarioEstadoController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public SPUsuarioEstadoController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet("GetRangoSP")]
        public async Task<ActionResult<IEnumerable<ProductoStock>>> GetRangoSP(string estadoUsuario)
        {
            var lista = await _context.ProductoStocks
                                      .FromSqlRaw("UsuarioEstado {0}", estadoUsuario)
                                      .ToListAsync();

            return Ok(lista);
        }
    }
}
