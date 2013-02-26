package cidc.indicadores.bancoVariables.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.indicadores.bancoVariables.db.BancoVariablesDB;
import cidc.indicadores.bancoVariables.obj.FiltroVariables;
import cidc.indicadores.bancoVariables.obj.InfoVariables;
import cidc.indicadores.fichasIndicadores.db.FichaIndicadoresDB;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
//import cidc.general.pdf.FichaIndicadoresPDF;
import cidc.general.servlet.ServletGeneral;

/**
 * Servlet Class
 *
 * @web.servlet              name="AdminIndicadores"
 *                           display-name="Name for AdminIndicadores"
 *                           description="Description for AdminIndicadores"
 * @web.servlet-mapping      url-pattern="/AdminIndicadores"
 * @web.servlet-init-param   name="A parameter"
 *                           value="A value"
 */
public class AdminVariables extends ServletGeneral  {

    public static char sep = java.io.File.separatorChar;

    public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
        context=config.getServletContext();
        cursor=new CursorDB();
        HttpSession sesion=req.getSession();
        Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
        BancoVariablesDB objVariableDB = new BancoVariablesDB(cursor, 2);
        int bandera = 0;
        mensaje = "";
        String irA = "";
        if(req.getParameter("accion")!= null)
            bandera = Integer.parseInt(req.getParameter("accion"));
        switch (bandera)
        {
            case 1:
            	//Crear Variable
            	InfoVariables objVariables = (InfoVariables)sesion.getAttribute("variable");
                objVariables.setCreador(usuario.getIdUsuario());

                if(objVariableDB.consultaIdVariable(objVariables.getIdentificador()))
                {
                	String tipografica = null;
                    for (int i = 0; i< objVariables.getTipografica().length; i++)
                    {
                        if (tipografica == null)
                        {
                            tipografica = objVariables.getTipografica()[i];
                        }
                        else
                        {
                            tipografica = tipografica + "," + objVariables.getTipografica()[i];
                        }
                    }

                    objVariables.setTipograficatexto(tipografica);

                    if(objVariableDB.crearVariable(objVariables) == true)
                    {
                        mensaje = "Variable creada correctamente";
                        sesion.removeAttribute("variable");
                        if(req.getParameter("bandera").equals("1"))
                        {
                        	req.setAttribute("lista", objVariableDB.consultaListaVariables());
                            irA = "/FichasIndicadores/VariablesFicha.jsp";
                        }
                        if(req.getParameter("bandera").equals("2"))
                        {
                        	irA = "/BancoVariables/CrearVariable.jsp";
                        }
                    }
                    else
                    {
                        mensaje = "Ha ocurrido un error, por favor, intente de nuevo, si el problema persiste, por favor notificar via correo electronico. Gracias";
                        if(req.getParameter("bandera").equals("1"))
                        {
                        	req.setAttribute("lista", objVariableDB.consultaListaVariables());
                            irA = "/FichasIndicadores/VariablesFicha.jsp";
                        }
                        if(req.getParameter("bandera").equals("2"))
                        {
                        	irA = "/BancoVariables/CrearVariable.jsp";
                        }
                    }
                }
                else
                {
                    mensaje = "Ya existe una variable con el identificador que acaba de digitar\n No se pueden crear 2 variables con el mismo identificador";
                    if(req.getParameter("bandera").equals("1"))
                    {
                    	 req.setAttribute("lista", objVariableDB.consultaListaVariables());
                         irA = "/FichasIndicadores/VariablesFicha.jsp";
                    }
                    if(req.getParameter("bandera").equals("2"))
                    {
                    	irA = "/BancoVariables/CrearVariable.jsp";
                    }
                }
            break;

            case 2:
            	FiltroVariables objFiltro = (FiltroVariables)sesion.getAttribute("variableFiltro");
            	if(objVariableDB.filtroVariables(objFiltro).size() == 0)
            		{
            			mensaje = "No se encuentran variables con las especificaciones seleccionadas";
            		}
            	if(req.getParameter("bandera").equals("1"))
            	{
            		sesion.setAttribute("listaFiltro", objVariableDB.filtroVariables(objFiltro));
            		irA = "/BancoVariables/ListaVariables.jsp";
            	}
            	if(req.getParameter("bandera").equals("2"))
            	{
            		sesion.setAttribute("listaFiltro", objVariableDB.filtroVariables(objFiltro));
            		irA = "/FichasIndicadores/VariablesFicha.jsp";
            	}
            	if(req.getParameter("bandera").equals("3"))
            	{
            		sesion.setAttribute("listaFiltro1", objVariableDB.filtroVariables(objFiltro));
            		irA = "/FichasIndicadores/ModificarVariablesFicha.jsp";
            	}
            	sesion.removeAttribute("variableFiltro");
            break;

            case 3:
            	// Consultar Info Variable
            	String idind = req.getParameter("idind");
            	sesion.setAttribute("variable", objVariableDB.consultaInfoVariableModificar(idind));
            	irA = "/BancoVariables/ModificarVariable.jsp";
            break;

            case 4:
            	// Modificar Variable
            	objVariables = (InfoVariables)sesion.getAttribute("variable");
                objVariables.setModificador(usuario.getIdUsuario());
                String tipografica = null;
                for (int i = 0; i< objVariables.getTipografica().length; i++)
                {
                    if (tipografica == null)
                    {
                        tipografica = objVariables.getTipografica()[i];
                    }
                    else
                    {
                        tipografica = tipografica + "," + objVariables.getTipografica()[i];
                    }
                    objVariables.setTipograficatexto(tipografica);
                }
                if(objVariableDB.actualizarInfoVariable(objVariables))
                {
                    mensaje = "Variable modificada Correctamente";
                }
                else
                {
                    mensaje = "La variable no se pudo modificar, por favor vuelva a intentar";
                }
                req.setAttribute("lista", objVariableDB.consultaListaVariables());
                irA = "/BancoVariables/ListaVariables.jsp";

            break;

            case 5:
            	// Eliminar Variable
            	List respuesta = objVariableDB.consultaVariableEnFicha(req.getParameter("idVariable"));
            	if(respuesta.size() != 0)
            	{
            		mensaje = "No se puede eliminar la variable ya que se encuenta involucrada en las siguientes fichas: \n" + respuesta;
            	}
            	else
            	{
            		if(objVariableDB.eliminaVariable(req.getParameter("idVariable")))
                	{
                		mensaje = "Variable Eliminada correctamente";
                	}
                	else
                	{
                		mensaje = "Ocurrio un error al momento de eliminar la Variable, \n Por favor vuelva a intentar";
                	}
            	}
            	req.setAttribute("lista", objVariableDB.consultaListaVariables());
                irA = "/BancoVariables/ListaVariables.jsp";

            break;

            case 6:
            	req.setAttribute("lista", objVariableDB.consultaMisVariables(usuario.getPerfil()));
                irA = "/BancoVariables/IngresarInformacion.jsp";

            break;

            case 7:
                String idvar = (String)req.getParameter("idvariable");
                Long valorvar = Long.parseLong(req.getParameter("valorvariable"));

                if(objVariableDB.actualizarVariable(idvar, valorvar))
                {
                    mensaje="Dato actualizado correctamente";
                    req.setAttribute("lista", objVariableDB.consultaMisVariables(usuario.getPerfil()));
                    irA = "/BancoVariables/IngresarInformacion.jsp";
                }
                else
                {
                    mensaje="El dato no se pudo actualizar, por favor vuelva a intentar";
                    req.setAttribute("lista", objVariableDB.consultaMisVariables(usuario.getPerfil()));
                    irA = "/BancoVariables/IngresarInformacion.jsp";
                }

            break;

            default:
            	irA="/FichasIndicadores/CrearFicha.jsp";
            break;
        }

        retorno[0]="desviar";
        retorno[1]=irA;
        retorno[2]=mensaje;
        return retorno;
    }
}