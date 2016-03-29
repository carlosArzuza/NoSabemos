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
    public class OrdercompraController : ApiController
    {
        OrdenCompraBLL ord = new OrdenCompraBLL();
        // GET: api/Ordercompra
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/Ordercompra/5
        public List<OrdcompraEntitty> Get(string id)
        {
            return ord.GetOrdercompra(id);
        }

        [HttpGet]
        [Route("~/api/Ordercompra/ejecutado/{ofm}")]
        public List<OrdcompraEntitty> GetEjecutado(string ofm)
        {
            return ord.GetEjecutado(ofm);
        }

        [HttpGet]
        [Route("~/api/Ordercompra/afe/{id}")]
        public string GetAfe(int id)
        {
            return ord.Proyectoproceso(id);
        }

        // POST: api/Ordercompra
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Ordercompra/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Ordercompra/5
        public void Delete(int id)
        {
        }
    }
}
