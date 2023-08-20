using Microsoft.EntityFrameworkCore;
using Models.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options)
        {
        }
        
        public DbSet<Categoria> Categorias { get; set; }

        public DbSet<Producto> Productos { get; set; }

        public DbSet<Rol> Roles { get; set; }

        public DbSet<Usuario> Usuarios { get; set; }

        public DbSet<Ingreso> Ingresos { get; set; }

        public DbSet<Detalle_Ingreso> Detalle_Ingresos { get; set; }

        public DbSet<ProductoStock> ProductoStocks { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());
            modelBuilder.Entity<ProductoStock>(e => e.HasNoKey());
        }
    }
}
