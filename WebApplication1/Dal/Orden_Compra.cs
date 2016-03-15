using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace Dal
{
    public class Orden_Compra
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID_PO { get; set; }
        [Key]
        public string NUMERO_PO { get; set; }
        public string FECHA_CREACION { get; set; }
        public int PROVEEDOR { get; set; }
        public string JURISDICCION_PO { get; set; }
        public string AFE_PO { get; set; }
        public string NO_OFM { get; set; }
        public string ESTADO_PO { get; set; }

    }
}
