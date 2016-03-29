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
                    var dto = contex.Aspirantes.Where(t => t.VENDORID == item.VENDORID).FirstOrDefault();
                    if (dto != null)
                    {
                        dto.EMPRESA = item.EMPRESA;
                        dto.TELEFONO = item.TELEFONO;
                        dto.DEPARTAMENTO = item.DEPARTAMENTO;
                        dto.CIUDAD = item.CIUDAD;
                        dto.CORREO = item.CORREO;
                        dto.CELULAR = item.CELULAR;
                        dto.DIRECCION = item.DIRECCION;
                        dto.CONTACTO_1 = item.CONTACTO_1;
                        dto.CONTACTO_2 = item.CONTACTO_2;
                        dto.CONTACTO_3 = item.CONTACTO_3;
                        dto.CONTACTO_4 = item.CONTACTO_4;
                    }
                    else
                    {
                        Aspirantes asp = new Aspirantes();
                        asp.VENDORID = item.VENDORID;
                        asp.EMPRESA = item.EMPRESA;
                        asp.TELEFONO = item.TELEFONO;
                        asp.CIUDAD = item.CIUDAD;
                        asp.DEPARTAMENTO = item.DEPARTAMENTO;
                        asp.CORREO = item.CORREO;
                        asp.CELULAR = item.CELULAR;
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
                        aspirante.VENDORID = item.VENDORID;
                        aspirante.EMPRESA = item.EMPRESA;
                        aspirante.CORREO = item.CORREO;
                        aspirante.DIRECCION = item.DIRECCION;
                        aspirante.CIUDAD = item.CIUDAD;
                        aspirante.DEPARTAMENTO = item.DEPARTAMENTO;
                        aspirante.TELEFONO = item.TELEFONO;
                        aspirante.CELULAR = item.CELULAR;
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
                string dato =result.VENDORID;
                var dto = contex.Aspirantes.Where(c => c.CONTACTO_1 == dato || c.CONTACTO_2 == dato
                  || c.CONTACTO_3 == dato || c.CONTACTO_4 == dato).ToList();
                List<AspirantesEntity> LisAsp = new List<AspirantesEntity>();

                if (dto != null)
                {
                    foreach (var item in dto)
                    {
                        AspirantesEntity aspirante = new AspirantesEntity();
                        aspirante.ASPIRANTE_ID = item.ASPIRANTE_ID;
                        aspirante.VENDORID = item.VENDORID;
                        aspirante.EMPRESA = item.EMPRESA;
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
