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
    public class AseguradorasController : ApiController
    {
        AseguradorasBLL asg = new AseguradorasBLL();
        // GET: api/Aseguradoras
        public IEnumerable<AseguradorasEntity> Get()
        {
            return asg.GestAseguradora();

        }

        // GET: api/Aseguradoras/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Aseguradoras
        public void Post(Aseguradoras a)
        {
            asg.AddAseguradora(a);
        }

        // PUT: api/Aseguradoras/5
        public void Put(int id, Aseguradoras a)
        {
            asg.UpdateAseguradora(id, a);
        }

        // DELETE: api/Aseguradoras/5
        public void Delete(int id)
        {
        }
    }
}
