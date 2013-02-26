package cidc.evalArticulo.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.evalArticulo.db.EvalArticuloDB;
import cidc.evalArticulo.obj.Parametros;
import cidc.evalArticulo.obj.Evaluacion;
import cidc.evalArticulo.obj.Filtro;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;


public class EvalArticServlet extends ServletGeneral {

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
		cursor=new CursorDB();
		HttpSession sesion=req.getSession();
		String irA="";
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		EvalArticuloDB articuloDB=new EvalArticuloDB(cursor,usuario.getPerfil());

		int accion=-1;

		irA="/evalArticulos/ListaArticulosEval.jsp";
		if(req.getParameter("accion")!=null)
			accion=Integer.parseInt(req.getParameter("accion"));

		retorno[0]="unir";
		mensaje="";
		switch(accion){
			case 0:
				irA="/evalArticulos/ListaArticulosEval.jsp";
				if(sesion.getAttribute("filEvalArtic")!=null)
					req.setAttribute("listaArticulos",articuloDB.getListaArticulos((Filtro)sesion.getAttribute("filEvalArtic")));
			break;
			case Parametros.cmdFiltrar:
				req.setAttribute("listaArticulos",articuloDB.getListaArticulos((Filtro)sesion.getAttribute("filEvalArtic")));
				irA="/evalArticulos/ListaArticulosEval.jsp";
			break;
			case Parametros.cmdBuscar:
				req.setAttribute("datosArticulo",articuloDB.getInfoArticulos(req.getParameter("id")));
				irA="/evalArticulos/EvaluarArticulo.jsp";
			break;
			case Parametros.cmdEvaluar:
			//	System.out.println("entra case");
				if(articuloDB.insertaEvaluacion((Evaluacion)sesion.getAttribute("evaluacionArtic")))
					mensaje="Evaluación Insertada Correctamente";
				else
					mensaje="Ocurrió un fallo al almacenar la Evaluación, favor volver a intentarlo";
			//	req.setAttribute("listaArticulos",articuloDB.getListaArticulos((Filtro)sesion.getAttribute("filEvalArtic")));
				sesion.removeAttribute("evaluacionArtic");
				irA="/evalArticulos/FiltroArticulosEval.jsp";
			break;
			case Parametros.cmdEstado:
				if(articuloDB.cambiaEstadoArticulo(req.getParameter("id"),req.getParameter("estado")))
					mensaje="Registro Modificado Correctamente";
				else
					mensaje="Ocurrió un fallo al modificar el registro, favor volver a intentarlo";
				irA="/evalArticulos/FiltroArticulosEval.jsp";
			break;
			default:
				irA="/evalArticulos/FiltroArticulosEval.jsp";
			mensaje="";
			break;
		}

		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}
