using Dal;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ContactosBLL
    {
        public int Addcontacto(ObjetContacto objc) {

            using (var contex = new ModelContex())
            {
                var result = contex.Aspirantes.Where(cont => cont.ASPIRANTE_ID == objc.padre).FirstOrDefault();
                var contac = contex.Aspirantes.Where(c => c.CONTACTO_1 == result.VENDORID || c.CONTACTO_2 == result.VENDORID
                || c.CONTACTO_3 == result.VENDORID || c.CONTACTO_4 == result.VENDORID).ToList();
                if (contac.Count() >= 4)
                {
                    return 0;

                }
                else
                {
                    contex.Aspirantes.Add(objc.contacto);
                    contex.SaveChanges();
                    var updcontac = contex.Aspirantes.Where(cont => cont.VENDORID == objc.contacto.VENDORID).FirstOrDefault();
                    if (updcontac.CONTACTO_1 ==null)
                    {
                        updcontac.CONTACTO_1 = result.VENDORID;
                    }
                    else
                    {
                        if (result.CONTACTO_2 == null)
                        {
                            updcontac.CONTACTO_2 = result.VENDORID;
                        }
                        else
                        {
                            if (result.CONTACTO_3 == null)
                            {
                                updcontac.CONTACTO_3 = result.VENDORID;
                            }
                            else
                            {
                                if (result.CONTACTO_4 == null)
                                {
                                    updcontac.CONTACTO_4 = result.VENDORID;
                                }
                            }
                        }

                    }
                }
                contex.SaveChanges();
                return 1;
            }
        }
    }
}
