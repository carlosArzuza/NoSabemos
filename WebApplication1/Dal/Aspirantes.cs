using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace Dal
{
    public class Aspirantes
    {
        [Key]
        public int ASPIRANTE_ID { get; set; }

        public string VENDORID { get; set; }
        public string EMPRESA { get; set; }
        public string CORREO { get; set; }
        public string DIRECCION { get; set; }
        public string CIUDAD { get; set; }
        public string DEPARTAMENTO { get; set; }
        public string TELEFONO { get; set; }
        public string CELULAR { get; set; }

        public string CONTACTO_1 { get; set; }
        public string CONTACTO_2 { get; set; }
        public string CONTACTO_3 { get; set; }
        public string CONTACTO_4 { get; set; }

        [ForeignKey("ID_ASPIRANTE")]
        public virtual ICollection<Aspirante_Proceso> Aspirante_Proceso { get; set; }

        [ForeignKey("CONTRATISTA")]
        public virtual ICollection<Oferta_Mercantil> OfertaAspirante { get; set; }

        [ForeignKey("PROVEEDOR")]
        public virtual ICollection<Orden_Compra> PoAspirante { get; set; }
    }
}
