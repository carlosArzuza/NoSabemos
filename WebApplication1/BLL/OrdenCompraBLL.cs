using Dal;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class OrdenCompraBLL
    {
        public void Addordencompra(Orden_Compra PO){
            using (var contex = new ModelContex())
            {

                contex.Orden_Compra.Add(PO);
                contex.SaveChanges();
            }
        }

        public List<OrdcompraEntitty> GetOrdercompra(string id)
        {
            using (var contex = new ModelContex())
            {
                var dto = contex.Orden_Compra.Where(o => o.NO_OFM == id || o.ESTADO_PO == "" || o.ESTADO_PO == "C").ToList();
                List<OrdcompraEntitty> result = new List<OrdcompraEntitty>();
                foreach (var item in dto)
                {
                    OrdcompraEntitty order = new OrdcompraEntitty();
                    order.ID_PO = item.ID_PO;
                    order.NUMERO_PO = item.NUMERO_PO;
                    order.FECHA_CREACION = item.FECHA_CREACION;
                    order.PROVEEDOR = item.PROVEEDOR;
                    order.JURISDICCION_PO = item.JURISDICCION_PO;
                    order.AFE_PO = item.AFE_PO;
                    order.NO_OFM = item.NO_OFM;
                    order.ESTADO_PO = item.ESTADO_PO;
                    result.Add(order);
                }
                return result;
            }
        }

        public List<OrdcompraEntitty> GetEjecutado(string ofm)
        {
            using (var contex = new ModelContex())
            {
                var dto = contex.Orden_Compra.Where(o => o.NO_OFM==ofm).ToList();
                List<OrdcompraEntitty> result = new List<OrdcompraEntitty>();
                foreach (var item in dto)
                {
                    OrdcompraEntitty order = new OrdcompraEntitty();
                    order.TOTAL_PO = item.TOTAL_PO;
                    result.Add(order);
                }
                return result;
            }
        }


        /// <summary>
        /// metodo retorna el AFE perteneciente del proceso competitivo
        /// </summary>
        /// <param name="id_competitvo"></param>
        /// <returns></returns>
        public string Proyectoproceso(int id_competitivo)
        {
            using (var contex = new ModelContex())
            {
                var result = contex.Proceso_Competitivo.Where(p => p.ID_COMPETITIVO==id_competitivo).FirstOrDefault();
                if (result != null)
                {
                    var datos = contex.Proyecto.Where(c => c.PROYEC_ID == result.PROYECTO_COMPETITIVO).FirstOrDefault();
                    if (datos != null)
                    {
                        return datos.AFE;
                    }
    
                }
                return null;
            }
        }
    }
}
