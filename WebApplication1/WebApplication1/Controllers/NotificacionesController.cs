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
    public class NotificacionesController : ApiController
    {
        PolizasBLL poliza = new PolizasBLL();

        // GET api/notificaciones
        public IList<PolizaEntity> Get()
        {
            return poliza.GetAll();
        }

        // GET api/notificaciones/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/notificaciones
        public void Post([FromBody]string value)
        {
        }

        // PUT api/notificaciones/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/notificaciones/5
        public void Delete(int id)
        {
        }
    }
}
