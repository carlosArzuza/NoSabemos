using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks; 

namespace Dal
{
    public class ModelContex : DbContext
    {
        public DbSet<Configuraciones> Configuracion { get; set; }
        public DbSet<Proyec_Manager> Pro_Manager { get; set; }
        public DbSet<Amparos_Polizas> Amparos_Polizas { get; set; }
        public DbSet<Aseguradoras> Aseguradoras { get; set; }
        public DbSet<Proyecto> Proyecto { get; set; }
        public DbSet<Proceso_Competitivo> Proceso_Competitivo { get; set; }
        public DbSet<Archivo_Ruta> Archivo_Ruta { get; set; }
        public DbSet<Oferta_Mercantil> Oferta_mercantil { get; set;}
        public DbSet<Polizas> Polizas { get; set; }
        public DbSet<Aspirantes> Aspirantes { get; set; }
        public DbSet<Aspirante_Proceso> Aspirantes_proceso { get; set; }
        public DbSet<Orden_Compra> Orden_Compra { get; set; }


    }
}
