package cidc.docsIndicadores.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.docsIndicadores.db.DocsIndicadoresDB;
import cidc.docsIndicadores.obj.InfoConsultas;
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
public class AdminDocs extends ServletGeneral  {

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
		cursor=new CursorDB();
		HttpSession sesion=req.getSession();
		DocsIndicadoresDB objDB = null;
		InfoConsultas objInfo = null;
		objDB = new DocsIndicadoresDB(cursor, 2);
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		String irA="/Indicadores/docsIndicadores/InfoDoc.jsp";
		int bandera = 0;
		if(req.getParameter("accion")!= null)
			bandera = Integer.parseInt(req.getParameter("accion"));
		switch (bandera)
		{
		case 1:
	/*		usuario = new Usuario();
			usuario.setIdUsuario(1);
			usuario.setNombre("Felipe Mora");
			sesion.setAttribute("loginUsuario", usuario);*/
			irA = "/Indicadores/docsIndicadores/InfoDoc.jsp";
		break;
		case 2:
			irA = "/Indicadores/docsIndicadores/FiltroDocs.jsp";
			break;

		case 3:
			irA = "/Indicadores/docsIndicadores/ListaDocs.jsp";
			String tipo_busqueda = (String)req.getParameter("tipobusqueda");
			if(tipo_busqueda.equals("1"))
			{
				String tipo_archivo = req.getParameter("tipoarchivo");
				req.setAttribute("lista", objDB.consultatipo(Integer.parseInt(tipo_archivo)));
				//Metodo para buscar por tipo
			}
			if(tipo_busqueda.equals("2"))
			{
				String categoria = req.getParameter("categoria");
				String tipo = req.getParameter("tipo");
				if(tipo.equals("0"))
				{
					req.setAttribute("lista", objDB.consultacategoria(Integer.parseInt(categoria), "%"));
				}
				else
				{
					req.setAttribute("lista", objDB.consultacategoria(Integer.parseInt(categoria), tipo));
				}
				//Metodo para buscar por Categoria/Tipo
			}
			if(tipo_busqueda.equals("3"))
			{
				req.setAttribute("lista", objDB.consultaGeneral());
				//Metodo para buscar TODO
			}
			break;
		case 4:
			irA = "/Indicadores/docsIndicadores/EvalDocs.jsp";
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