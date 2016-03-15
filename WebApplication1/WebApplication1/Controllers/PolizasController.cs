using BLL;
using Dal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebApplication1.Controllers
{
    public class PolizasController : ApiController
    {
        PolizasBLL pol = new PolizasBLL();
        // GET: api/Polizas
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/Polizas/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Polizas
        public void Post(List<Polizas> pl)
        {
            
        }

        // PUT: api/Polizas/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Polizas/5
        public void Delete(int id)
        {
        }
    }
}
