using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace Dal
{
    public class Orden_Compra_detalle
    {
        [Key]
        public int ID_PO_DETALLE { get; set; }
        public string NUMERO_POD { get; set; }
        public string LINEA { get; set; }
        public string DESCRIPCION { get; set; }
        public decimal CANTIDAD { get; set; }
        public string UNIDAD { get; set; }
        public decimal VALORUNITARIO { get; set; }
        public decimal VALORTOTAL { get; set; }

    }
}
