package cidc.unidadInvestigacion.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.adminGrupos.db.AdminGruposDB;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;
import cidc.unidadInvestigacion.db.AdminUnidadDB;
import cidc.unidadInvestigacion.obj.FiltroProyecto;
import cidc.unidadInvestigacion.obj.Parametros;

public class AdminUnidad extends ServletGeneral {

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
		cursor=new CursorDB();
		String irA="/unidadInvest/ListaProyectos.jsp";
		int accion=0,corte=0;
		if(req.getParameter("accion")!=null)
			accion=Integer.parseInt(req.getParameter("accion"));
		HttpSession sesion=req.getSession();
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		mensaje="";
		AdminUnidadDB unidadDB=new AdminUnidadDB(cursor,usuario.getPerfil());
		AdminGruposDB adminGruposDB=new AdminGruposDB(cursor,usuario.getPerfil());

		switch(accion){
			case Parametros.cmdFiltroProyectos:
				if((sesion.getAttribute("listaProyCurr")==null) || (sesion.getAttribute("listaGrupos")==null)){
					if(usuario.isPerfil("43")){
						sesion.setAttribute("listaGrupos", unidadDB.listaGrupos(1,"%"));
						sesion.setAttribute("listaProyCurr", unidadDB.listaProyectoCur(1));
					}
					if(usuario.isPerfil("44")){
						sesion.setAttribute("listaGrupos", unidadDB.listaGrupos(2,"%"));
						sesion.setAttribute("listaProyCurr", unidadDB.listaProyectoCur(2));
					}
					if(usuario.isPerfil("45")){
						sesion.setAttribute("listaGrupos", unidadDB.listaGrupos(3,"%"));
						sesion.setAttribute("listaProyCurr", unidadDB.listaProyectoCur(3));
					}
					if(usuario.isPerfil("46")){
						sesion.setAttribute("listaGrupos", unidadDB.listaGrupos(4,"%"));
						sesion.setAttribute("listaProyCurr", unidadDB.listaProyectoCur(4));
					}
					if(usuario.isPerfil("47")){
						sesion.setAttribute("listaGrupos", unidadDB.listaGrupos(5,"%"));
						sesion.setAttribute("listaProyCurr", unidadDB.listaProyectoCur(5));
					}
				}
				irA="/unidadInvest/ListaProyectos.jsp";
			break;
			case Parametros.cmdListarProyectos:
				irA="/unidadInvest/ListaProyectos.jsp";
				if(usuario.isPerfil("43")){
					sesion.setAttribute("listaProyectosUnidad", unidadDB.listaProyectos(1,(FiltroProyecto)sesion.getAttribute("filtroProyFacultad")));
				}
				if(usuario.isPerfil("44")){
					sesion.setAttribute("listaProyectosUnidad", unidadDB.listaProyectos(2,(FiltroProyecto)sesion.getAttribute("filtroProyFacultad")));
				}
				if(usuario.isPerfil("45")){
					sesion.setAttribute("listaProyectosUnidad", unidadDB.listaProyectos(3,(FiltroProyecto)sesion.getAttribute("filtroProyFacultad")));
				}
				if(usuario.isPerfil("46")){
					sesion.setAttribute("listaProyectosUnidad", unidadDB.listaProyectos(4,(FiltroProyecto)sesion.getAttribute("filtroProyFacultad")));
				}
				if(usuario.isPerfil("47")){
					sesion.setAttribute("listaProyectosUnidad", unidadDB.listaProyectos(5,(FiltroProyecto)sesion.getAttribute("filtroProyFacultad")));
				}
			break;
			case Parametros.cmdVerProyectos:
				sesion.setAttribute("proyectoFacultad", unidadDB.consultarProyecto(req.getParameter("id"),req.getParameter("tipo")));
				irA="/unidadInvest/VerProyecto.jsp";
			break;
			case Parametros.cmdListarGrupos:
				if(usuario.isPerfil("43"))
					sesion.setAttribute("listaGruposUnidad", unidadDB.listaGrupos(1,req.getParameter("tipo")));
				if(usuario.isPerfil("44"))
					sesion.setAttribute("listaGruposUnidad", unidadDB.listaGrupos(2,req.getParameter("tipo")));
				if(usuario.isPerfil("45"))
					sesion.setAttribute("listaGruposUnidad", unidadDB.listaGrupos(3,req.getParameter("tipo")));
				if(usuario.isPerfil("46"))
					sesion.setAttribute("listaGruposUnidad", unidadDB.listaGrupos(4,req.getParameter("tipo")));
				if(usuario.isPerfil("47"))
					sesion.setAttribute("listaGruposUnidad", unidadDB.listaGrupos(5,req.getParameter("tipo")));
				irA="/unidadInvest/ListaGrupos.jsp";
				req.setAttribute("tipo", req.getParameter("tipo"));
			break;
			case Parametros.cmdVerGrupo:
				sesion.setAttribute("grupo", adminGruposDB.getVerGrupo(req.getParameter("id")));
				irA="/unidadInvest/VerGrupo.jsp";
				req.setAttribute("idGrupo",req.getParameter("id"));
			break;
			case Parametros.cmdVerListaIntegrantes:
				req.setAttribute("listaIntegrantes",adminGruposDB.buscaIntegrantesGrupo(Long.parseLong(req.getParameter("idGrupo"))));
				irA="/unidadInvest/ListaIntegrantes.jsp";
			break;
			case Parametros.cmdVerIntegrante:
				if(usuario.isPerfil("43"))
					req.setAttribute("ajaxProyCur",adminGruposDB.AjaxProyectoCur(1));
				if(usuario.isPerfil("44"))
					req.setAttribute("ajaxProyCur",adminGruposDB.AjaxProyectoCur(2));
				if(usuario.isPerfil("45"))
					req.setAttribute("ajaxProyCur",adminGruposDB.AjaxProyectoCur(3));
				if(usuario.isPerfil("46"))
					req.setAttribute("ajaxProyCur",adminGruposDB.AjaxProyectoCur(4));
				if(usuario.isPerfil("47"))
					req.setAttribute("ajaxProyCur",adminGruposDB.AjaxProyectoCur(5));

				sesion.setAttribute("integrante",adminGruposDB.verIntegranteGrupo(req.getParameter("codigo")));
				irA="/unidadInvest/VerIntegrante.jsp";
			break;
			default:
				irA="/unidadInvest/ListaProyectos.jsp";
			break;
		}
		accion=0;
		retorno[0]="desviar";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}
