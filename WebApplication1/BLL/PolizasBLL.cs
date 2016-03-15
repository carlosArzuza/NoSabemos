using Dal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class PolizasBLL
    {

        public void Addpolizas(List<Polizas> p ,string ofm)
        {
            using (var contex = new  ModelContex())
            {
        

               foreach (var item in p)
               {
                Polizas pl = new Polizas();
                pl.VALOR_POLIZA = item.VALOR_POLIZA;
                pl.VALOR_ASEGURADO = item.VALOR_ASEGURADO;
                pl.ASEGURADORA = item.ASEGURADORA;
                pl.TIPO_POLIZA = item.TIPO_POLIZA;
                pl.NO_POLIZAS = item.NO_POLIZAS;
                pl.FECHA_FINAL_POL = item.FECHA_FINAL_POL;
                pl.FECHA_INI_POL = item.FECHA_INI_POL;
                pl.OFERTAMERCANTIL = ofm;
                pl.COD_POLIZA = item.COD_POLIZA;
                contex.Polizas.Add(pl);
                
                }
               contex.SaveChanges();
            } 
        }
    }
}
