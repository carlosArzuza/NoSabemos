using BLL;
using Dal;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebApplication1.Controllers
{
    public class AmparosController : ApiController
    {
        AmparosBLL ap = new AmparosBLL();

        // GET: api/Amparos
        public IEnumerable<AmparosEntity> Get()
        {
            return ap.GestAmparos();
        }

        // GET: api/Amparos/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Amparos
        public void Post(Amparos_Polizas a)
        {
            ap.AddAmparo(a);
        }

        // PUT: api/Amparos/5
        public void Put(int id, Amparos_Polizas a)
        {
            ap.UpdateAmparos(id, a);
        }

        // DELETE: api/Amparos/5
        public void Delete(int id)
        {
        }
    }
}
