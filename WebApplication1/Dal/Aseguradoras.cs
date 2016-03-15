using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dal
{
   public class Aseguradoras
    {

        
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID_ASG { get; set; }
        [Key]
        public string NIT_ASG { get; set; }
        public string NOMBRE_ASG { get; set; }
        public int ESTADO_ASG { get; set; }

       [ForeignKey("ASEGURADORA")]
       private ICollection<Polizas> Poliza_amparo { get; set; }
       
    }
}
