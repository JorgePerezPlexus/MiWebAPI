using ConectaDatos;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace MiWebAPI.Controllers
{
    public class UsuariosController : ApiController
    {
        private dboUsuariosEntities dbContext = new dboUsuariosEntities();

        //Visualiza todos los registros (api/usuarios)
        [HttpGet]
        public IEnumerable<Usuario> Get()
        {
            
             return dbContext.Usuarios.ToList();
        }

        //Visualiza solo un registro por su id
        [HttpGet]
        public Usuario Get(int id)
        {
            
             return dbContext.Usuarios.FirstOrDefault(x=> x.ID==id);
        }

        //Graba nuevos usuarios
        [HttpPost]
        public IHttpActionResult AgregaUsuario([FromBodyAttribute]Usuario u)
        {
            if (ModelState.IsValid)
            {
                dbContext.Usuarios.Add(u);
                dbContext.SaveChanges();
                return Ok(u);
            }
            else
            {
                return BadRequest();
            }
        }

        //Modifica un usuario
        [HttpPut]
        public IHttpActionResult ActualizarUsuario(int id, [FromBodyAttribute] Usuario u)
        {
            if (ModelState.IsValid)
            {
                var usuarioExiste = dbContext.Usuarios.Count(x => x.ID == id) > 0;

                if (usuarioExiste)
                {
                    dbContext.Entry(u).State = System.Data.Entity.EntityState.Modified;
                    dbContext.SaveChanges();

                    return Ok("Usuario modificado con éxito!");
                }
                else
                {
                    return NotFound();
                }
            }
            else
            {
                return BadRequest();
            }
        }

        //Borrar un usuario
        [HttpDelete]
        public IHttpActionResult ElminaUsuario(int id)
        {
            var usuario = dbContext.Usuarios.Find(id);
            if(usuario != null)
            {
                dbContext.Usuarios.Remove(usuario);
                dbContext.SaveChanges();

                return Ok(usuario);
            }
            else
            {
                return NotFound();
            }
        }
    }
}
