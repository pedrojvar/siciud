package cidc.adminGrupos.servlet;

import java.io.IOException;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.adminGrupos.db.AdminGruposDB;
import cidc.adminGrupos.db.grupo.GruposGestionDB;
import cidc.adminGrupos.db.investigador.GestionInvestDB;
import cidc.adminGrupos.obj.FiltroPersona;
import cidc.adminGrupos.obj.Integrante;
import cidc.adminGrupos.obj.Parametros;
import cidc.adminGrupos.obj.GrupoInvestigacion;
import cidc.evalPropuesta.db.EvalPropuestaDB;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;

public class InvestigServlet extends ServletGeneral {

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
		cursor=new CursorDB();
		HttpSession sesion=req.getSession();
		String irA="/grupos/VerGrupo.jsp";
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		GestionInvestDB gestInvestig=new GestionInvestDB(cursor,usuario.getPerfil());
		AdminGruposDB adminGruposDB=new AdminGruposDB(cursor,usuario.getPerfil());
		GruposGestionDB gruposGestionDB=new GruposGestionDB(cursor,usuario.getPerfil());
		GrupoInvestigacion grupo=(GrupoInvestigacion)sesion.getAttribute("grupo");;
		EvalPropuestaDB evalPropuestaDB=null;
		mensaje="";
		int accion=0;
		if(req.getParameter("accion")!=null)
			accion=Integer.parseInt(req.getParameter("accion"));
		retorno[0]="unir";
		switch(accion){
			case Parametros.VerGrupo:
				sesion.removeAttribute("grupo");
				sesion.setAttribute("grupo", adminGruposDB.getVerGrupo(req.getParameter("id")));
				irA="/adminGrupos/VerGrupo.jsp";
			break;
			case Parametros.actualizaIntegranteGrupo:
				req.setAttribute("st", ""+Parametros.actualizaIntegranteGrupo);
				Integrante in=(Integrante)sesion.getAttribute("integrante");
				if(gruposGestionDB.actualizaDatosIntegrante(in)){
					mensaje="El registro fué modificado Satisfactoriamente";
				}else{
					mensaje="No se pudo actualizar el integrante";
				}
				sesion.setAttribute("integrante",gruposGestionDB.verIntegranteGrupo(""+in.getId()));
				irA="/grupos/investigador/Integrante.jsp";
			break;
			case Parametros.verListaPropuestas:
				req.setAttribute("listaProp", gestInvestig.getListaProp(usuario.getIdUsuario()));
				irA="/grupos/investigador/ListaPropuestas.jsp";
			break;
			case Parametros.verResultEvaluacion:
				evalPropuestaDB=new EvalPropuestaDB(cursor,usuario.getPerfil());
				req.setAttribute("evalTodos",evalPropuestaDB.getEvaluacionTodos(req.getParameter("prop")));
				req.setAttribute("datosCalculo",evalPropuestaDB.getDatosCalculo(req.getParameter("prop")));
				req.setAttribute("prop",req.getParameter("prop"));
				irA="/grupos/investigador/CalculoEval.jsp";
			break;
			case Parametros.VerEvaluacion:
				evalPropuestaDB=new EvalPropuestaDB(cursor,usuario.getPerfil());
				req.setAttribute("resultEvaluacion",evalPropuestaDB.getResultEval(req.getParameter("tipoEval"),req.getParameter("prop")));
				req.setAttribute("prop",req.getParameter("prop"));
				irA="/grupos/investigador/ResultEvaluacion.jsp";
			break;
		}

		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}
