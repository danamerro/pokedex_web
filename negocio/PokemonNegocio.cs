

using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using dominio;

namespace negocio
{
    //clase acceso a datos
     public class PokemonNegocio
    {
        //se declara la clase PokemonNegocio
        public List<Pokemon> listar() {

            List<Pokemon> lista = new List<Pokemon>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT Numero, Nombre, P.Descripcion, UrlImagen, " +
                                    "E.Descripcion Tipo, D.Descripcion Debilidad, " +
                                    "P.IdTipo, P.IdDebilidad, P.Id " +
                                    "FROM POKEMONS P, ELEMENTOS E, ELEMENTOS D " +
                                    "WHERE E.Id = P.IdTipo " +
                                    "AND D.Id = P.IdDebilidad " +
                                    "AND P.Activo = 1");

                datos.ejecutarLectura();
                while (datos.Lector.Read()){ 
                    Pokemon aux = new Pokemon();

                    aux.Id = (int)datos.Lector["Id"];
                    aux.Numero = (int)datos.Lector["Numero"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];

                    if (!(datos.Lector["UrlImagen"] is DBNull))
                        aux.UrlImagen = (string)datos.Lector["UrlImagen"];

                    aux.Tipo = new Elemento();
                    aux.Tipo.Id = (int)datos.Lector["IdTipo"];
                    aux.Tipo.Descripcion = (string)datos.Lector["Tipo"];

                    aux.Debilidad = new Elemento();
                    aux.Debilidad.Id = (int)datos.Lector["IdDebilidad"];
                    aux.Debilidad.Descripcion = (string)datos.Lector["Debilidad"];

                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex) {
                throw ex;
            }
            finally{
                datos.cerrarConexion();
            }
            
        }

        public void agregar(Pokemon nuevo) {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                //una de las formas de setear la consulta
                datos.setearConsulta("insert into POKEMONS (Numero, Nombre, Descripcion, Activo, IdTipo, IdDebilidad,UrlImagen)values(" + nuevo.Numero + ",'" + nuevo.Nombre + "','" + nuevo.Descripcion + "',1, @idTipo, @idDebilidad,@urlImagen)");
                datos.setearParametro("@idTipo",nuevo.Tipo.Id);
                datos.setearParametro("@idDebilidad", nuevo.Debilidad.Id);
                datos.setearParametro("@urlImagen", nuevo.UrlImagen);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally { 
                datos.cerrarConexion();
            }

        }

        public void modificar(Pokemon poke) {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("update POKEMONS set Numero = @numero, Nombre = @nombre, Descripcion = @desc, UrlImagen = @img , IdTipo = @idTipo, IdDebilidad = @idDebilidad where Id = @id");
                datos.setearParametro("@numero", poke.Numero);
                datos.setearParametro("@nombre", poke.Nombre);
                datos.setearParametro("@desc", poke.Descripcion);
                datos.setearParametro("@img", poke.UrlImagen);
                datos.setearParametro("@idTipo", poke.Tipo.Id);
                datos.setearParametro("@idDebilidad", poke.Debilidad.Id);
                datos.setearParametro("@Id", poke.Id);

                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw;
            }
            finally {
                datos.cerrarConexion();
            }
        
        }

        public void eliminar(int id) {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.setearConsulta("delete from POKEMONS where id = @id");
                datos.setearParametro("@id",id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void eliminarLogico(int id)  {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.setearConsulta("update POKEMONS set Activo = 0 where id = @id");
                datos.setearParametro("@id", id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
