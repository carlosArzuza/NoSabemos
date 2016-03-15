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
                        dto.CORREO = item.CORREO;
                        dto.DIRECCION = item.DIRECCION;

                    }
                    else
                    {
                        Aspirantes asp = new Aspirantes();
                        asp.NIT_CEDULA = item.NIT_CEDULA;
                        asp.NOM_RAZONSOCIAL = item.NOM_RAZONSOCIAL;
                        asp.TELEFONO = item.TELEFONO;
                        asp.DEPARTAMENTO = item.DEPARTAMENTO;
                        asp.CORREO = item.CORREO;
                        asp.DIRECCION = item.DIRECCION;
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
                var dto = contex.Aspirantes.ToList();
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
                        aspirante.CIUDAD = item.CIUDAD;
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
