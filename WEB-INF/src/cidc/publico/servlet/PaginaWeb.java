package cidc.publico.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.adminGrupos.db.AdminGruposDB;
import cidc.adminGrupos.obj.FiltroPagWebGrupo;
import cidc.adminGrupos.obj.FiltroPagWebSemillero;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;
import cidc.publico.db.PagWebProyectosDB;
import cidc.publico.obj.FiltroPagWebProyectos;

public class PaginaWeb extends ServletGeneral {

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
		cursor=new CursorDB();
		HttpSession sesion=req.getSession();
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		AdminGruposDB adminGrupoDB=new AdminGruposDB(cursor, usuario.getPerfil());
		PagWebProyectosDB proyectosWebDB = new PagWebProyectosDB(cursor, usuario.getPerfil());
		String irA="/PaginaWeb/ListaGrupos.jsp";
		int accion=0;
		if(req.getParameter("accion")!=null)
			accion=Integer.parseInt(req.getParameter("accion"));
		
		mensaje="";
	//	System.out.println("antes del switch");
		switch(accion)
		{
			//// GRUPOS DE INVESTIGACIÓN
			case 0:
				sesion.removeAttribute("listaGruposWeb");
				sesion.removeAttribute("filtroWebGrupos");
				irA="/PagWeb/ListaGrupos.jsp";
			break;
			case 1:
				sesion.removeAttribute("listaGruposWeb");
				List grupos = adminGrupoDB.getListaGruposParaWeb((FiltroPagWebGrupo)sesion.getAttribute("filtroWebGrupos"));
				if (grupos.size()> 0)
				{
					sesion.setAttribute("listaGruposWeb", grupos);
				}
				else
				{
					mensaje = "Esta consulta no arroja resultados";
				}
				sesion.removeAttribute("filtroWebGrupos");
				irA="/PagWeb/ListaGrupos.jsp";
			break;
			case 2:
				sesion.removeAttribute("infoGrupo");
				sesion.setAttribute("infoGrupo", adminGrupoDB.infoGrupoWeb(req.getParameter("idGrupo")));
				irA="/PagWeb/InfoGrupo.jsp";
			break;
			
			//// SEMILLEROS DE INVESTIGACIÓN
			case 3:
				sesion.removeAttribute("listaSemillerosWeb");
				sesion.removeAttribute("filtroWebSemilleros");
				irA="/PagWeb/ListaSemilleros.jsp";
			break;	
			case 4:
				sesion.removeAttribute("listaSemillerosWeb");
				List semilleros = adminGrupoDB.getListaSemillerosParaWeb((FiltroPagWebSemillero)sesion.getAttribute("filtroWebSemilleros"));
				if (semilleros.size()> 0){
					sesion.setAttribute("listaSemillerosWeb", semilleros);
				}
				else{
					mensaje = "Esta consulta no arroja resultados";
				} 
				sesion.removeAttribute("filtroWebSemilleros");
				irA="/PagWeb/ListaSemilleros.jsp";
			break;
			case 5: 
				sesion.removeAttribute("infoSemillero");
				sesion.setAttribute("infoSemillero", adminGrupoDB.infoSemilleroWeb(req.getParameter("idSemillero")));
				irA="/PagWeb/InfoSemillero.jsp";
			break;
			
			/// PROYECTOS DE INVESTIGACIÓN
			
			case 6:
				sesion.removeAttribute("listaProyectosWeb");
				sesion.removeAttribute("filtroWebProyectos");
				irA="/PagWeb/ListaProyectos.jsp";
			break;	
			
			
			case 7:
				sesion.removeAttribute("listaGruposSWeb");
				
				List proyectos = proyectosWebDB.getListaProyectosParaWeb((FiltroPagWebProyectos)sesion.getAttribute("filtroWebProyectos"));
				if(proyectos.size()>0)
				{
					sesion.setAttribute("listaProyectosWeb", proyectos);
				}
				else
				{
					mensaje = "Esta consulta no arroja resultados";
				}
				
				sesion.removeAttribute("filtroWebProyectos");
				irA="/PagWeb/ListaProyectos.jsp";
			break;
			case 8: 
				sesion.removeAttribute("infoProyecto");
				if(req.getParameter("tipoProyecto").equals("1"))
				{
					sesion.setAttribute("infoProyecto", proyectosWebDB.infoProyectoNuevoWeb(Integer.parseInt(req.getParameter("idProyecto"))));
				}
				if(req.getParameter("tipoProyecto").equals("2"))
				{
					sesion.setAttribute("infoProyecto", proyectosWebDB.infoProyectoAntiguoWeb(Integer.parseInt(req.getParameter("idProyecto"))));
				}
				
				irA="/PagWeb/InfoProyecto.jsp";
			break;
			
		}
		accion=0;
		retorno[0]="desviar";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}
