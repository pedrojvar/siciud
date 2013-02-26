package cidc.adminPropuestas.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.adminArticulos.db.AdminArticuloDB;
import cidc.adminPropuestas.db.AdminPropuestaDB;
import cidc.adminPropuestas.obj.FiltroEvaluadorOBJ;
import cidc.adminPropuestas.obj.Parametros;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;

public class AsignaEvaluador extends ServletGeneral {

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
		cursor=new CursorDB();
		HttpSession sesion=req.getSession();
		String irA="/adminPropuestas/AsignaEvaluador.jsp";
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		AdminPropuestaDB adminPropuestaDB=new AdminPropuestaDB(cursor,usuario.getPerfil());
		mensaje="";
		int accion=0;
		if(req.getParameter("accion")!=null)
			accion=Integer.parseInt(req.getParameter("accion"));
		req.setAttribute("prop",req.getParameter("prop"));
		retorno[0]="unir";
		switch(accion){
			case Parametros.cmdFiltraEval:
				FiltroEvaluadorOBJ filtro=(FiltroEvaluadorOBJ)sesion.getAttribute("filtroEval");
				filtro.setTipEval(Integer.parseInt(""+sesion.getAttribute("tipEval")));
				req.setAttribute("listaEvalOpcion",adminPropuestaDB.filtraEvaluador(filtro));
				sesion.removeAttribute("filtroEval");
			break;
			case Parametros.cmdAsignaEval:
			/*	System.out.println("pro= "+sesion.getAttribute("idProp"));
				System.out.println("tipeval= "+sesion.getAttribute("tipEval"));*/
				if(adminPropuestaDB.asignaEvaluador(""+sesion.getAttribute("prop"),req.getParameter("codEval"),""+sesion.getAttribute("tipEval"))){
					retorno[0]="desviar";
					irA="/adminPropuestas/EstadoPropuesta.x";
					req.setAttribute("devolver","Evaluador Asignado Correctamente");
				}else
					mensaje=adminPropuestaDB.getMensaje();

			break;
			case Parametros.cmdVerEval:
				req.setAttribute("datEvaluador",adminPropuestaDB.getDatosEvaluador(req.getParameter("codEval"), Integer.parseInt(req.getParameter("tipEval"))));
				irA="/adminPropuestas/VerEvaluador.jsp";
			break;
			default:
				irA="/adminPropuestas/EstadoPropuesta.x";
			break;
		}

		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}
