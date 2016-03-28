using Dal;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class AspirantesBLL
    {
        public void AddAspirante(List<Aspirantes> a)
        {
            using (var contex = new ModelContex())
            {
                foreach (var item in a)
                {
                    var dto = contex.Aspirantes.Where(t => t.NIT_CEDULA == item.NIT_CEDULA).FirstOrDefault();
                    if (dto != null)
                    {
                        dto.NOM_RAZONSOCIAL = item.NOM_RAZONSOCIAL;
                        dto.TELEFONO = item.TELEFONO;
                        dto.DEPARTAMENTO = item.DEPARTAMENTO;
                        dto.CUIDAD = item.CUIDAD;
                        dto.CORREO = item.CORREO;
                        dto.DIRECCION = item.DIRECCION;
                        dto.CONTACTO_1 = item.CONTACTO_1;
                        dto.CONTACTO_2 = item.CONTACTO_2;
                        dto.CONTACTO_3 = item.CONTACTO_3;
                        dto.CONTACTO_4 = item.CONTACTO_4;
                    }
                    else
                    {
                        Aspirantes asp = new Aspirantes();
                        asp.NIT_CEDULA = item.NIT_CEDULA;
                        asp.NOM_RAZONSOCIAL = item.NOM_RAZONSOCIAL;
                        asp.TELEFONO = item.TELEFONO;
                        asp.CUIDAD = item.CUIDAD;
                        asp.DEPARTAMENTO = item.DEPARTAMENTO;
                        asp.CORREO = item.CORREO;
                        asp.DIRECCION = item.DIRECCION;
                        asp.CONTACTO_1 = item.CONTACTO_1;
                        asp.CONTACTO_2 = item.CONTACTO_2;
                        asp.CONTACTO_3 = item.CONTACTO_3;
                        asp.CONTACTO_4 = item.CONTACTO_4;
                        contex.Aspirantes.Add(asp);
                    }
                }
                contex.SaveChanges();
            }
        }

        public List<AspirantesEntity> GetAllAspirantes()
        {
            using (var contex = new ModelContex())
            {
                var dto = contex.Aspirantes.Where(c => c.CONTACTO_1 == null && c.CONTACTO_2 == null && c.CONTACTO_3 == null && c.CONTACTO_4 == null).ToList();
                List<AspirantesEntity> LisAsp = new List<AspirantesEntity>();

                if (dto != null)
                {
                    foreach (var item in dto)
                    {
                        AspirantesEntity aspirante = new AspirantesEntity();
                        aspirante.ASPIRANTE_ID= item.ASPIRANTE_ID;
                        aspirante.NIT_CEDULA = item.NIT_CEDULA;
                        aspirante.NOM_RAZONSOCIAL = item.NOM_RAZONSOCIAL;
                        aspirante.CORREO = item.CORREO;
                        aspirante.DIRECCION = item.DIRECCION;
                        aspirante.CUIDAD = item.CUIDAD;
                        aspirante.DEPARTAMENTO = item.DEPARTAMENTO;
                        aspirante.TELEFONO = item.TELEFONO;
                        LisAsp.Add(aspirante);
                    }
                    return LisAsp;
                }

                return LisAsp;
            }
        }

        public List<AspirantesEntity> GetAllContactos(int aspirantes)
        {
            using (var contex = new ModelContex())
            {
                var result = contex.Aspirantes.Where(a => a.ASPIRANTE_ID == aspirantes).FirstOrDefault();
                string dato =result.NIT_CEDULA;
                var dto = contex.Aspirantes.Where(c => c.CONTACTO_1 == dato || c.CONTACTO_2 == dato
                  || c.CONTACTO_3 == dato || c.CONTACTO_4 == dato).ToList();
                List<AspirantesEntity> LisAsp = new List<AspirantesEntity>();

                if (dto != null)
                {
                    foreach (var item in dto)
                    {
                        AspirantesEntity aspirante = new AspirantesEntity();
                        aspirante.ASPIRANTE_ID = item.ASPIRANTE_ID;
                        aspirante.NIT_CEDULA = item.NIT_CEDULA;
                        aspirante.NOM_RAZONSOCIAL = item.NOM_RAZONSOCIAL;
                        aspirante.CORREO = item.CORREO;
                        aspirante.DIRECCION = item.DIRECCION;
                        aspirante.CUIDAD = item.CUIDAD;
                        aspirante.DEPARTAMENTO = item.DEPARTAMENTO;
                        aspirante.TELEFONO = item.TELEFONO;
                        LisAsp.Add(aspirante);
                    }
                    return LisAsp;
                }

                return LisAsp;
            }
        }


    }
}
