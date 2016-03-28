using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
   public class OrdcompraEntitty
    {
        public int ID_PO { get; set; }
        public string NUMERO_PO { get; set; }
        public string FECHA_CREACION { get; set; }
        public int PROVEEDOR { get; set; }
        public string JURISDICCION_PO { get; set; }
        public string AFE_PO { get; set; }
        public decimal TOTAL_PO { get; set; }
        public string NO_OFM { get; set; }
        public string ESTADO_PO { get; set; }
    }
}
