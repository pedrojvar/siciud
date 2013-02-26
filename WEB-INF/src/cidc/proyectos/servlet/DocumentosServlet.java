package cidc.proyectos.servlet;

import javax.servlet.http.HttpServlet;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;
import cidc.proyectos.db.ProyectosDB;
import cidc.proyectos.obj.FiltroProyecto;
import cidc.proyectos.obj.Parametros;
import cidc.proyectos.obj.Proyecto;

/**
 * Servlet Class
 *
 * @web.servlet              name="Documentos"
 *                           display-name="Name for Documentos"
 *                           description="Description for Documentos"
 * @web.servlet-mapping      url-pattern="/Documentos"
 * @web.servlet-init-param   name="A parameter"
 *                           value="A value"
 */
public class DocumentosServlet extends ServletGeneral {
	public CursorDB cursor;
	public static char sep=java.io.File.separatorChar;

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		cursor=new CursorDB();
		String irA="";
		HttpSession sesion=req.getSession();
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		ProyectosDB proyectosDB=new ProyectosDB(cursor,usuario.getPerfil());
		Proyecto proyecto=(Proyecto)sesion.getAttribute("proyecto");
		String path=req.getRealPath(req.getContextPath()).substring(0,req.getRealPath(req.getContextPath()).lastIndexOf(sep));
		int caso=0;
		if(req.getAttribute("accion")!=null)
			caso=Integer.parseInt((String)req.getAttribute("accion"));
		else{
			if(sesion.getAttribute("accion")!=null)
				caso=Integer.parseInt((String)sesion.getAttribute("accion"));
		//uso esto para el caso en que vaya a imprimir el contrato
			else
				caso=Integer.parseInt(req.getParameter("accion"));
		}
		switch(caso){
			case Parametros.cmdActaInicio:
				irA="/adminProyectos/Acta.jsp";
			break;
			case Parametros.cmdActaInicioPdf:
				proyecto.setPrincipal(Integer.parseInt(""+sesion.getAttribute("prin")));
				proyecto.setPapel((String [])sesion.getAttribute("papel"));
				proyecto.setFecActaInicio((String)sesion.getAttribute("fecActa"));
			//	sesion.setAttribute("proyecto",proyectosDB.crearActaInicio(proyecto,path));
				irA="/GestionProyectos/AdminProyectos.x?accion=13";
				sesion.removeAttribute("accion");
			break;
			case Parametros.cmdContrato:
				irA="/adminProyectos/Contrato.jsp";
			break;
			case Parametros.cmdContratoPdf:
				req.getParameterValues("tipo");
				if(sesion.getAttribute("proyecto")!=null && sesion.getAttribute("fecha")!=null && sesion.getAttribute("prin")!=null && sesion.getAttribute("papel")!=null){
					proyecto.setFecAprobacion(""+sesion.getAttribute("fecha"));
					proyecto.setPrincipal(Integer.parseInt(""+sesion.getAttribute("prin")));
					proyecto.setPapel((String [])sesion.getAttribute("papel"));
					//sesion.setAttribute("proyecto", proyectosDB.crearContrato(proyecto,path));
				}else
				System.out.println("alguna de esas cosas es falsa");
				sesion.removeAttribute("accion");
				sesion.removeAttribute("fecha");
				sesion.removeAttribute("prin");
				sesion.removeAttribute("papel");
				irA="/GestionProyectos/AdminProyectos.x?accion=13";

			break;
			case Parametros.cmdActaFinalizacion:

			break;
	}

	caso=0;
	retorno[0]="desviar";
	retorno[1]=irA;
	retorno[2]=mensaje;
	return retorno;
	}
}
