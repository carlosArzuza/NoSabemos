using Dal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class OjectOfm
    {
        public Oferta_Mercantil ofm {get;set;}
        public List<Polizas> pl { get; set; }
        public Orden_Compra po { get; set; }
    }

}
