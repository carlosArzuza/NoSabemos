using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class PolizaEntity
    {
        public int NO_POLIZAS { get; set; }
        public string COD_POLIZA { get; set; }
        public string FECHA_INI_POL { get; set; }
        public string FECHA_FINAL_POL { get; set; }
        public string ASEGURADORA { get; set; }
        public decimal VALOR_POLIZA { get; set; }
        public int TIPO_POLIZA { get; set; }
        public decimal VALOR_ASEGURADO { get; set; }
        public string OFERTAMERCANTIL { get; set; }

    }
}
