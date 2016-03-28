using BLL;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebApplication1.Controllers
{
    public class ContactosController : ApiController
    {
        ContactosBLL contacto = new ContactosBLL();
        // GET: api/Contactos
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/Contactos/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Contactos
        public int Post(ObjetContacto obj)
        {
            return contacto.Addcontacto(obj);
        }

        // PUT: api/Contactos/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Contactos/5
        public void Delete(int id)
        {
        }
    }
}
