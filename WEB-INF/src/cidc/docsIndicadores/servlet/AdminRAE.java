package cidc.docsIndicadores.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.docsIndicadores.db.DocsIndicadoresDB;
import cidc.docsIndicadores.obj.InfoRAE;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;

/**
 * Servlet Class
 *
 * @web.servlet              name="CargarDocs"
 *                           display-name="Name for CargarDocs"
 *                           description="Description for CargarDocs"
 * @web.servlet-mapping      url-pattern="/CargarDocs"
 * @web.servlet-init-param   name="A parameter"
 *                           value="A value"
 */
public class AdminRAE extends ServletGeneral
{
	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
		cursor = new CursorDB();
		HttpSession sesion = req.getSession();
		DocsIndicadoresDB objDB = null;
		InfoRAE objrae = null;
		String irA = "/Indicadores/docsIndicadores/InfoDoc.jsp";
		objDB = new DocsIndicadoresDB(cursor, 2);
		mensaje = "";

		int bandera = 0;
		if(req.getParameter("accion")!= null)
			bandera = Integer.parseInt(req.getParameter("accion"));
		switch (bandera)
		{
		case 1:
			objrae = (InfoRAE) sesion.getAttribute("rae");
			if(objDB.actualizaRAE(objrae))
			{
				irA = "/Indicadores/docsIndicadores/FiltroDocs.jsp";
				mensaje = "RAE actualizada correctamente";
			}
			else
			{
				irA = "/Indicadores/docsIndicadores/EditarRAE.jsp";
				mensaje = "No se pudo completar la actualización de RAE";
			}

		break;
		case 2:
			String idbuscar = req.getParameter("idrae");
			objrae = objDB.consultaDetalladaRAE(idbuscar);
			if(objrae != null)
			{
				sesion.setAttribute("obj", objrae);
				irA = "/Indicadores/docsIndicadores/DetallesRAE.jsp";
			}
			else
			{
				mensaje = "No se han encontrado registros para esta consulta";
				irA = "/Indicadores/docsIndicadores/DetallesRAE.jsp";
			}
		break;
		default:
			irA="/Indicadores/docsIndicadores/FiltroDocs.jsp";
			break;
		}

		retorno[0]="desviar";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}