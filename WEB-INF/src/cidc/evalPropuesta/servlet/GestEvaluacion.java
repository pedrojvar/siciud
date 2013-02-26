package cidc.evalPropuesta.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.evalPropuesta.db.EvalPropuestaDB;
import cidc.evalPropuesta.obj.ParametrosOBJ;
import cidc.evalPropuesta.obj.CapturaEvalOBJ;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;
import cidc.general.obj.Parametros;

public class GestEvaluacion extends ServletGeneral {

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
		cursor=new CursorDB();
		HttpSession sesion=req.getSession();
		String irA="";
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		EvalPropuestaDB evalPropuestaDB=new EvalPropuestaDB(cursor,usuario.getPerfil());

		int accion=0;

		irA="/EvalPropuestas/ListaPropuestas.jsp";
		if(req.getParameter("accion")!=null)
			accion=Integer.parseInt(req.getParameter("accion"));

		retorno[0]="unir";

		//System.out.println("usuario= "+usuario.getPerfil()+" accion= "+accion);

		switch(usuario.getPerfil()){
			case Parametros.userFuncionarioA:
			case Parametros.userComite:
				switch(accion){
					case ParametrosOBJ.cmdVerEvaluacion:
						req.setAttribute("resultEvaluacion",evalPropuestaDB.getResultEval(req.getParameter("tipoEval"),req.getParameter("idProp")));
						irA="/EvalPropuestas/ResultEvaluacion.jsp";
					break;
					case ParametrosOBJ.cmdEvalVacia:
						irA="/EvalPropuestas/EvalComite.jsp";
						req.setAttribute("datos",evalPropuestaDB.getPorcentajes(req.getParameter("id")));
					break;
					case ParametrosOBJ.cmdDatosEvalTodos:
			//			System.out.println("Entra a eval datos");
						irA="/EvalPropuestas/CalculoEval.jsp";
						req.setAttribute("evalTodos",evalPropuestaDB.getEvaluacionTodos(req.getParameter("prop")));
						req.setAttribute("datosCalculo",evalPropuestaDB.getDatosCalculo(req.getParameter("prop")));
					break;
					case ParametrosOBJ.cmdEvalComite:
						CapturaEvalOBJ evaluacion=(CapturaEvalOBJ)sesion.getAttribute("capturaEval");
						if(evalPropuestaDB.insertaEvaluacion(evaluacion,usuario.getIdUsuario()))
							mensaje="Evaluación Insertada Correctamente";
						else
							mensaje="Ocurr� un fallo al almacenar la Evaluaci�n";
						req.setAttribute("propuestas",evalPropuestaDB.getPropuestas(usuario.getIdUsuario()));
						irA="/EvalPropuestas/ListaPropComite.jsp";
					break;
					case ParametrosOBJ.cmdPropAprobada:
						evalPropuestaDB.propuestaAprobada(req.getParameter("id"),req.getParameter("nota"));
						req.setAttribute("propuestas",evalPropuestaDB.getPropuestas(usuario.getIdUsuario()));
						irA="/adminPropuestas/ListaPropuesta.x";
						req.setAttribute("estado",evalPropuestaDB.getMensaje());
					break;
					default:
						req.setAttribute("propuestas",evalPropuestaDB.getPropuestas(usuario.getIdUsuario()));
						irA="/EvalPropuestas/ListaPropComite.jsp";
						mensaje="";
					break;
				}
			break;
			case Parametros.userIeie:
				switch(accion){
					case ParametrosOBJ.cmdVerEvaluacion:
						req.setAttribute("resultEvaluacion",evalPropuestaDB.getResultEval(req.getParameter("tipoEval"),req.getParameter("idProp")));
						irA="/EvalPropuestas/ResultEvaluacion.jsp";
					break;
					case ParametrosOBJ.cmdEvalVacia:
						irA="/EvalPropuestas/EvalComite.jsp";
						req.setAttribute("datos",evalPropuestaDB.getPorcentajes(req.getParameter("id")));
					break;
					case ParametrosOBJ.cmdDatosEvalTodos:
			//			System.out.println("Entra a eval datos");
						irA="/EvalPropuestas/CalculoEval.jsp";
						req.setAttribute("evalTodos",evalPropuestaDB.getEvaluacionTodos(req.getParameter("prop")));
						req.setAttribute("datosCalculo",evalPropuestaDB.getDatosCalculo(req.getParameter("prop")));
					break;
					case ParametrosOBJ.cmdEvalComite:
						CapturaEvalOBJ evaluacion=(CapturaEvalOBJ)sesion.getAttribute("capturaEval");
						if(evalPropuestaDB.insertaEvaluacion(evaluacion,usuario.getIdUsuario()))
							mensaje="Evaluación Insertada Correctamente";
						else
							mensaje="Ocurrió un fallo al almacenar la Evaluación";
						req.setAttribute("propuestas",evalPropuestaDB.getPropuestas(usuario.getIdUsuario()));
						irA="/EvalPropuestas/ListaPropComite.jsp";
					break;
					case ParametrosOBJ.cmdPropAprobada:
						evalPropuestaDB.propuestaAprobada(req.getParameter("id"),req.getParameter("nota"));
						req.setAttribute("propuestas",evalPropuestaDB.getPropuestas(usuario.getIdUsuario()));
						irA="/adminPropuestas/ListaPropuesta.x";
						req.setAttribute("estado",evalPropuestaDB.getMensaje());
					break;
					default:
						req.setAttribute("propuestas",evalPropuestaDB.getPropuestas(usuario.getIdUsuario()));
						irA="/EvalPropuestas/ListaPropComite.jsp";
						mensaje="";
					break;
				}
			break;
			default:
				switch(accion){
					case ParametrosOBJ.cmdEvalVacia:
						irA="/EvalPropuestas/loadEvaluacion.jsp";
						req.setAttribute("datos",evalPropuestaDB.getCritAspecto(req.getParameter("id")));
					break;
					case ParametrosOBJ.cmdEvalLlena:
						CapturaEvalOBJ evaluacion=(CapturaEvalOBJ)sesion.getAttribute("capturaEval");
						if(evalPropuestaDB.insertaEvaluacion(evaluacion,usuario.getIdUsuario()))
							mensaje="Evaluación Insertada Correctamente";
						else
							mensaje="Ocurrió un fallo al almacenar la Evaluación favor volver a intentarlo";
						req.setAttribute("propuestas",evalPropuestaDB.getPropuestas(usuario.getIdUsuario()));
					break;
					case ParametrosOBJ.cmdVerEvaluacion:
						req.setAttribute("resultEvaluacion",evalPropuestaDB.getResultEval(req.getParameter("tipoEval"),req.getParameter("idProp")));
						irA="/EvalPropuestas/ResultEvaluacion.jsp";
					break;
					default:
						req.setAttribute("propuestas",evalPropuestaDB.getPropuestas(usuario.getIdUsuario()));
					mensaje="";
					break;
				}
			break;
		}

		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}
