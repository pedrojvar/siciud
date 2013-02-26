package cidc.encuestas.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.docsIndicadores.db.DocsIndicadoresDB;
import cidc.docsIndicadores.obj.InfoConsultas;
import cidc.docsIndicadores.obj.InfoRAE;
import cidc.encuestas.db.EncuestaDB;
import cidc.encuestas.obj.InfoEncuesta;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;

/**
 * Servlet Class
 *
 * @web.servlet              name="AdminEncuesta"
 *                           display-name="Name for AdminEncuesta"
 *                           description="Description for AdminEncuesta"
 * @web.servlet-mapping      url-pattern="/AdminEncuesta"
 * @web.servlet-init-param   name="A parameter"
 *                           value="A value"
 */
public class AdminEncuesta extends ServletGeneral  {

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
		cursor=new CursorDB();
		HttpSession sesion=req.getSession();
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		String irA="/Encuesta/nuevaEncuesta.jsp";
		EncuestaDB objDB = new EncuestaDB(cursor, 2);
		mensaje = "";
		int bandera = 0;
		if(req.getParameter("accion")!= null)
			bandera = Integer.parseInt(req.getParameter("accion"));
		switch (bandera)
		{
		case 1:
			irA = "/Encuesta/nuevaEncuesta.jsp";
		break;
		case 2:

			InfoEncuesta objencuesta = (InfoEncuesta)sesion.getAttribute("encuesta");
			objencuesta.setIddoc(usuario.getIdUsuario());
			if(objDB.insertaEncuesta(objencuesta) == true)
			{
				mensaje = "Encuesta digitalizada correctamente, los datos digitalizados los podrá encontrar a continuación";
				int consecutivo = objDB.ultimaEncuesta();
				List lista = objDB.consultaEncuesta(consecutivo);
				sesion.removeAttribute("encuesta");
				req.setAttribute("lista", lista);
				irA = "/Encuesta/detallesEncuesta.jsp";
			}
			else
			{
				mensaje = "Ha ocurrido un error, por favor, intente de nuevo, si el problema persiste, por favor notificar via correo electronico. Gracias";
				irA = "/Encuesta/nuevaEncuesta.jsp";
			}
			break;

			case 3:
				req.setAttribute("numEncuestador", objDB.numEncuestador(usuario.getIdUsuario()));
				req.setAttribute("numGeneral", objDB.numGeneral());
				/*req.setAttribute("estCiencias", objDB.consultaEncuesta(2, 1));
				req.setAttribute("proCiencias", objDB.consultaEncuesta(1, 1));
				req.setAttribute("adminCiencias", objDB.consultaEncuesta(4, 1));
				req.setAttribute("estIng", objDB.consultaEncuesta(2, 2));
				req.setAttribute("proIng", objDB.consultaEncuesta(1, 2));
				req.setAttribute("adminIng", objDB.consultaEncuesta(4, 2));
				req.setAttribute("estMedio", objDB.consultaEncuesta(2, 3));
				req.setAttribute("proMedio", objDB.consultaEncuesta(1, 3));
				req.setAttribute("adminMedio", objDB.consultaEncuesta(4, 3));
				req.setAttribute("estTecno", objDB.consultaEncuesta(2, 4));
				req.setAttribute("proTecno", objDB.consultaEncuesta(1, 4));
				req.setAttribute("adminTecno", objDB.consultaEncuesta(4, 4));
				req.setAttribute("estArtes", objDB.consultaEncuesta(2, 5));
				req.setAttribute("proArtes", objDB.consultaEncuesta(1, 5));
				req.setAttribute("adminArtes", objDB.consultaEncuesta(4, 5));*/
				irA = "/Encuesta/estadisticaEncuesta.jsp";
			break;

			default:
			irA="/Encuesta/nuevaEncuesta.jsp";
			break;
		}
		retorno[0]="desviar";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}