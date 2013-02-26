package cidc.proyectosGeneral.servlet;

import javax.servlet.http.HttpServlet;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;
import cidc.proyectos.obj.BalanceGeneral;
import cidc.proyectosGeneral.db.ProyectosGeneralDB;
import cidc.proyectosGeneral.obj.FiltroGeneralProyecto;
import cidc.proyectosGeneral.obj.ParametrosOBJ;
import cidc.proyectosGeneral.obj.Proyecto;

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
		ProyectosGeneralDB proyectosGeneralDB=new ProyectosGeneralDB(cursor,usuario.getPerfil());
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
		sesion.removeAttribute("accion");
	//	System.out.println("-llega al servlet documentos-> "+caso);
		switch(caso){
			case ParametrosOBJ.cmdActaInicio:
				irA="/adminProyectos/Acta.jsp";
			break;
			case ParametrosOBJ.cmdActaInicioPdf:
				//proyecto.setPrincipal(Integer.parseInt(""+sesion.getAttribute("prin")));
				//proyecto.setPapel((String [])sesion.getAttribute("papel"));
				proyecto.setFecActaInicio((String)sesion.getAttribute("fecActa"));
				proyecto.setListaCoInvestigadores(proyectosGeneralDB.getListaCoInvestigadorescontrato(proyecto.getIdPropuesta(),""+proyecto.getClaseProyecto()));
				sesion.setAttribute("proyecto",proyectosGeneralDB.crearActaInicio(proyecto, path));
				sesion.setAttribute("proyectocurricular",proyectosGeneralDB.AjaxProyectoCur());				
				irA="/GestionGeneralProyectos/AdminGeneralProyectos.x?accion=6";
			break;
			case ParametrosOBJ.cmdContrato:
				sesion.setAttribute("proyectocurricular",proyectosGeneralDB.AjaxProyectoCur());
				proyecto.setListaCoInvestigadores(proyectosGeneralDB.getListaCoInvestigadorescontrato(proyecto.getIdPropuesta(),""+proyecto.getClaseProyecto()));
				
				irA="/adminProyectos/Contrato.jsp";
			break;
			case ParametrosOBJ.cmdContratoPdf:
				req.getParameterValues("tipo");
					if(sesion.getAttribute("proyecto")!=null && sesion.getAttribute("fecha")!=null){
						proyecto.setFecAprobacion(""+sesion.getAttribute("fecha"));
						sesion.setAttribute("proyecto", proyectosGeneralDB.crearContrato(proyecto,path));
						sesion.setAttribute("proyectocurricular",proyectosGeneralDB.AjaxProyectoCur());
					}else
						System.out.println("alguno de los datos solicitados es nulo");
				sesion.removeAttribute("fecha");
				irA="/GestionGeneralProyectos/AdminGeneralProyectos.x?accion=6";

			break;
	}
	
		
	caso=0;
	retorno[0]="desviar";
	retorno[1]=irA;
	retorno[2]=mensaje;
	return retorno;
	}
}
