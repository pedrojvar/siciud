package cidc.indicadores.fichasIndicadores.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.indicadores.bancoVariables.db.BancoVariablesDB;
import cidc.indicadores.bancoVariables.obj.FiltroVariables;
import cidc.indicadores.fichasIndicadores.db.FichaIndicadoresDB;
import cidc.indicadores.fichasIndicadores.obj.FichaIndicadores;
import cidc.indicadores.fichasIndicadores.obj.FiltroFichas;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
//import cidc.general.pdf.FichaIndicadoresPDF;
import cidc.general.servlet.ServletGeneral;

/**
 * Servlet Class
 *
 * @web.servlet              name="AdminFichas"
 *                           display-name="Name for AdminFichas"
 *                           description="Description for AdminFichas"
 * @web.servlet-mapping      url-pattern="/AdminFichas"
 * @web.servlet-init-param   name="A parameter"
 *                           value="A value"
 */
public class AdminFichas extends ServletGeneral  {

    public static char sep = java.io.File.separatorChar;

    public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
        context=config.getServletContext();
        cursor=new CursorDB();
        HttpSession sesion=req.getSession();
        FichaIndicadoresDB objFichaDB = new FichaIndicadoresDB(cursor, 2);
        BancoVariablesDB objVariableDB = new BancoVariablesDB(cursor, 2);
        Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
        int bandera = 0;
        mensaje = "";
        String irA="/FichasIndicadores/CrearFicha.jsp";

        if(req.getParameter("accion")!= null)
            bandera = Integer.parseInt(req.getParameter("accion"));
        switch (bandera)
        {
            case 1:
                irA="/FichasIndicadores/CrearFicha.jsp";
            break;

            case 2:
            	// Filtro de Fichas
            	FiltroFichas objFiltro = (FiltroFichas)sesion.getAttribute("fichaFiltro");
            	if(objFichaDB.filtroFichas(objFiltro).size() == 0)
        		{
        			mensaje = "No se encuentran fichas de Indicadores con las especificaciones seleccionadas";
        		}

	        	sesion.removeAttribute("fichaFiltro");

	        	if(req.getParameter("bandera").equals("1"))
	        	{
	        		sesion.setAttribute("listaFiltroFicha", objFichaDB.filtroFichas(objFiltro));
	        		irA = "/FichasIndicadores/ListaFichas.jsp";
	        	}
	        	if(req.getParameter("bandera").equals("2"))
	        	{
	        		sesion.setAttribute("listaFiltroFicha", objFichaDB.filtroFichas(objFiltro));
	        		irA = "/ReportesIndicadores/ListaFichasReporte.jsp";
	        	}
	        	if(req.getParameter("bandera").equals("3"))
	        	{
	        		sesion.setAttribute("listaFiltroFicha1", objFichaDB.filtroFichas(objFiltro));
	        		irA = "/FichasIndicadores/ModificarVariablesFicha.jsp";
	        	}
            break;

            //// EL CASE 3 ESTA VACIO .......... //////////

            case 4:
                req.setAttribute("lista", objVariableDB.consultaListaVariables());
                irA = "/FichasIndicadores/VariablesFicha.jsp";
            break;

            case 5:
                FichaIndicadores objFicha = (FichaIndicadores)sesion.getAttribute("ficha");
                String variables = null;
                String tipografica = null;
                for (int i = 0; i< objFicha.getTipografica().length; i++)
                {
                    if (tipografica == null)
                    {
                        tipografica = objFicha.getTipografica()[i];
                    }
                    else
                    {
                        tipografica = tipografica + "," + objFicha.getTipografica()[i];
                    }
                }

                for (int i = 0; i< objFicha.getVariables().length; i++)
                {
                    if (variables == null)
                    {
                        variables = objFicha.getVariables()[i];
                    }
                    else
                    {
                        variables = variables +  "," + objFicha.getVariables()[i];
                    }

                }

                int idFicha = objFichaDB.consultaIdFicha();
                objFicha.setIdentificador(objFicha.getIdentificador() + (idFicha+1));
                objFicha.setVariablestexto(variables);
                objFicha.setTipograficatexto(tipografica);
                objFicha.setCreador(usuario.getIdUsuario());

                if(objFichaDB.crearFicha(objFicha))
                {
                    mensaje = "Ficha de Indicador creada Correctamente";
                }
                else
                {
                    mensaje = "La Ficha de Indicador no se pudo crear, por favor vuelva a intentar";
                }
                irA="/FichasIndicadores/CrearFicha.jsp";
            break;

            case 6:
            	// Generar Archivo PDF
/*            	FichaIndicadoresPDF objPDF = new FichaIndicadoresPDF();
                String path=req.getRealPath(req.getContextPath()).substring(0,req.getRealPath(req.getContextPath()).lastIndexOf(sep));
                if(objPDF.GenerarFicha(objFichaDB.consultaInfoFicha(req.getParameter("idind")), path, resp))
                {
                    mensaje = "Ficha de Indicador creada Correctamente";
                }
                else
                {
                    mensaje = "La Ficha de Indicador no se pudo crear, por favor vuelva a intentar";
                }*/
            break;

            case 7:
            	// Modificar Fichas
            	String modificar = req.getParameter("idind");
            	sesion.setAttribute("ficha", objFichaDB.consultaInfoFicha(modificar));
            	irA="/FichasIndicadores/ModificarFicha.jsp";
            break;

            case 8:
            	String banderaModificar = req.getParameter("banderaFormula");
            	objFicha = (FichaIndicadores)sesion.getAttribute("ficha");
            	objFicha.setModificador(usuario.getIdUsuario());
            	if(banderaModificar.equals("1"))
            	{
            		// Modifico Info
            		tipografica = null;
                    for (int i = 0; i< objFicha.getTipografica().length; i++)
                    {
                        if (tipografica == null)
                        {
                            tipografica = objFicha.getTipografica()[i];
                        }
                        else
                        {
                            tipografica = tipografica + "," + objFicha.getTipografica()[i];
                        }
                        objFicha.setTipograficatexto(tipografica);
                    }
                    objFicha.setVariables(objFicha.getVariablestexto().split(","));
            	}
            	if(banderaModificar.equals("2"))
            	{
            		// Modificar Variables
            		objFicha.setVariables(req.getParameterValues("variables"));
            		variables = null;
            		for (int i = 0; i< objFicha.getVariables().length; i++)
                    {
                        if (variables == null)
                        {
                            variables = objFicha.getVariables()[i];
                        }
                        else
                        {
                            variables = variables +  "," + objFicha.getVariables()[i];
                        }

                    }
            		objFicha.setVariablestexto(variables);
            	}
            	if(banderaModificar.equals("3"))
            	{
            		// Modificar F�rmula

            	}

                if(objFichaDB.actualizarInfoFicha(objFicha))
                {
                    mensaje = "Ficha de Indicador modificada Correctamente";
                }
                else
                {
                    mensaje = "La Ficha de Indicador no se pudo modificar, por favor vuelva a intentar";
                }
                req.setAttribute("lista", objFichaDB.consultaListaFichas());
                irA = "/FichasIndicadores/ListaFichas.jsp";
            break;

            case 9:
            	// Eliminar Ficha
            	if(objFichaDB.eliminaFicha(req.getParameter("idind")))
            	{
            		mensaje = "Ficha Eliminada correctamente";
            	}
            	else
            	{
            		mensaje = "Ocurrio un error al momento de eliminar la ficha, \n Por favor vuelva a intentar";
            	}
            	req.setAttribute("lista", objFichaDB.consultaListaFichas());
                irA = "/FichasIndicadores/ListaFichas.jsp";
            break;

            default:
                irA="/Indicadores/docsIndicadores/InfoDoc.jsp";
            break;
        }

        retorno[0]="desviar";
        retorno[1]=irA;
        retorno[2]=mensaje;
        return retorno;
    }
}