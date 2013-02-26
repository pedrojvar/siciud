package cidc.evalPrueba.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.evalPropuesta.db.EvalPropuestaDB;
import cidc.evalPropuesta.obj.ParametrosOBJ;
import cidc.evalPropuesta.obj.CapturaEvalOBJ;
import cidc.evalPrueba.db.EvalPruebaDB;
import cidc.evalPrueba.obj.Formulario;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;


public class GestEvalArticPrueba extends ServletGeneral {

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
		cursor=new CursorDB();
		HttpSession sesion=req.getSession();
		String irA="";
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		EvalPruebaDB pruebaDB=new EvalPruebaDB(cursor,usuario.getPerfil());

		int accion=0;

		irA="/evalArticPrueba/ListaArticulosEval.jsp";
		if(req.getParameter("accion")!=null)
			accion=Integer.parseInt(req.getParameter("accion"));

		retorno[0]="unir";

	//	System.out.println("usuario= "+usuario.getPerfil()+" accion= "+accion);

		switch(accion){
			case ParametrosOBJ.cmdEvalVacia:
	//			System.out.println("password="+req.getParameter("psw"));
				if(pruebaDB.isPswCorrecta(req.getParameter("id"),req.getParameter("idEval"),req.getParameter("psw"))){
	//				System.out.println("clave super");
					irA="/evalArticPrueba/EvalArtic.jsp";
					req.setAttribute("datos",pruebaDB.getDatosArticulo(req.getParameter("idEval"),req.getParameter("id")));
				}else{
	//				System.out.println("clave incorrecta");
					irA="/evalArticPrueba/ListaArticulosEval.jsp";
					mensaje="la clave digitada no corresponde a esta propuesta de investigación";
					req.setAttribute("articulos",pruebaDB.getProductosAsignados(usuario.getIdUsuario()));
				}
			break;
			case ParametrosOBJ.cmdEvalLlena:
				Formulario evaluacion=(Formulario)sesion.getAttribute("evaluacPrueba");
				if(pruebaDB.insertaEvaluacion(evaluacion))
					mensaje="Evaluación Insertada Correctamente";
				else
					mensaje="Ocurrió un fallo al almacenar la Evaluación favor volver a intentarlo";
				req.setAttribute("articulos",pruebaDB.getProductosAsignados(usuario.getIdUsuario()));
				sesion.removeAttribute("evaluacPrueba");
			break;
			//**********************no se ha hecho nada de esto
			case ParametrosOBJ.cmdVerEvaluacion:
	//			req.setAttribute("resultEvaluacion",evalPropuestaDB.getResultEval(req.getParameter("tipoEval"),req.getParameter("idProp")));
				irA="/EvalPropuestas/ResultEvaluacion.jsp";
			break;
			//*************************************************************
			default:
				req.setAttribute("articulos",pruebaDB.getProductosAsignados(usuario.getIdUsuario()));
			mensaje="";
			break;
		}


		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}
