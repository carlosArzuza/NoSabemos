using Dal;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class AmparosBLL
    {
        public void AddAmparo(Amparos_Polizas a) {
            using (var contex = new ModelContex())
            {
                contex.Amparos_Polizas.Add(a);
                contex.SaveChanges();
            }
        }


        public List<AmparosEntity> GestAmparos() {
            using (var contex = new ModelContex())
            {
                var dto = contex.Amparos_Polizas.ToList();
                List<AmparosEntity> lisam = new List<AmparosEntity>();
                foreach (var item in dto)
                {
                    AmparosEntity amp = new AmparosEntity();

                    amp.ESTADO_AMP=item.ESTADO_AMP;
                    amp.ID_AMP=item.ID_AMP;
                    amp.NOMBRE_AMP=item.NOMBRE_AMP;
                    lisam.Add(amp);
                }
                return lisam;
            }

        }

        public void UpdateAmparos(int id, Amparos_Polizas amparos)
        {
            using (var contex = new ModelContex())
            {
                var dto = contex.Amparos_Polizas.Where(t => t.ID_AMP == id).First();
                if (dto != null)
                {
                    dto.NOMBRE_AMP = amparos.NOMBRE_AMP;
                    dto.ESTADO_AMP = amparos.ESTADO_AMP;
                    contex.SaveChanges();
                }
            }
        }

    }
}
