using Dal;
using Entity;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
   public class OfertaMercantilBLL:PolizasBLL
    {
       ModelContex contex;
       OrdenCompraBLL po = new OrdenCompraBLL();
       /// <summary>
       /// Metodo para registrar una oferta mercantil
       /// </summary>
       /// <param name="ofm"></param>
       public int OFMadd(OjectOfm dto) 
       {
           using (var contex = new ModelContex())
           {
               using (var Transaction = contex.Database.BeginTransaction())
               {
                   try
                   {
                       dto.po.NO_OFM = dto.ofm.N_OFM;
                       contex.Oferta_mercantil.Add(dto.ofm);
                       contex.SaveChanges();
                       Addpolizas(dto.pl, dto.ofm.N_OFM);
                       EstadoProceso(dto.ofm.PROC_OFM);
                       po.Addordencompra(dto.po);
                       Transaction.Commit();
                       return 1;
                   }
                   catch (DbUpdateException)
                   {
                       return 2;
                   }
                   catch (Exception) { throw; } 
                       
                       
               }
           }
       }

       protected void EstadoProceso(int id) {
           using (var contex =  new ModelContex())
           {
               var dto = contex.Proceso_Competitivo.Where(p=> p.ID_COMPETITIVO == id).FirstOrDefault();
               if (dto!=null)
               {
                   dto.ESTADO_PROC = "L";
                   contex.SaveChanges();
               }
           }
       }

       public List<OfmEntity> GetallOfm()
       {
           using (var contex = new ModelContex())
           {
               var dto = contex.Oferta_mercantil.ToList();
               List<OfmEntity> lisofm = new List<OfmEntity>();

               if (dto != null)
               {
                   foreach (var item in dto)
               {
                   OfmEntity ofm = new OfmEntity();
                   ofm.ID_OFERTA = item.ID_OFERTA;
                   ofm.N_OFM = item.N_OFM;
                   ofm.FECHA_SUSCRIP_OFM = item.FECHA_SUSCRIP_OFM;
                   ofm.FECHA_INIC_OFM = item.FECHA_INIC_OFM;
                   ofm.VIGENCIA = item.VIGENCIA;
                   ofm.TITULO_OFM=item.TITULO_OFM;
                   ofm.OBJETO_OFM =item.OBJETO_OFM;
                   ofm.LUGRA_EJECUCION_OFM=item.LUGRA_EJECUCION_OFM;
                   ofm.TIPO_MONEDA=item.TIPO_MONEDA;
                   ofm.VALOR_ESTIMAO_OFM = item.VALOR_ESTIMAO_OFM;
                   lisofm.Add(ofm);
                }
                   return lisofm;
               }
               return lisofm;
           }
       }

    }
}
