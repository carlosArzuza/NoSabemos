using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace Dal
{
    public class Amparos_Polizas
    {
        [Key]
        public int ID_AMP { get; set; }
        public string NOMBRE_AMP { get; set; }
        public int ESTADO_AMP {get;set;}

        [ForeignKey("TIPO_POLIZA")]
        private ICollection<Polizas> Polizas_aseguradora { get; set; }

        
    }
}
