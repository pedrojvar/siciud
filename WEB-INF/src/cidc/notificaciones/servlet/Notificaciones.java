package cidc.notificaciones.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.notificaciones.obj.FiltroPersona;
import cidc.notificaciones.obj.Parametros;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;
import cidc.inscripSistema.obj.Persona;
import cidc.inscripSistema.obj.ParametrosOBJ;
import cidc.notificaciones.db.NotificacionesDB;

public class Notificaciones extends ServletGeneral {

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
		cursor=new CursorDB();
		String irA="/Notificaciones/ListaNotificaciones.jsp";
		int accion=0;
		if(req.getParameter("accion")!=null)
			accion=Integer.parseInt(req.getParameter("accion"));
		HttpSession sesion=req.getSession();
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		mensaje="";

		NotificacionesDB notificacionDB=new NotificacionesDB(cursor,usuario.getPerfil());
	//	System.out.println("entra al servlet de inscripción la sistema");
		switch(accion){
			case Parametros.cmdInicio:
				req.setAttribute("listaPerfiles",notificacionDB.getListaPerfiles());
				irA="/Notificaciones/NuevaNotificacion.jsp";
			break;
			case Parametros.cmdBuscarPersona:
				req.setAttribute("listaFiltroPersona",notificacionDB.getBuscarPersonas((FiltroPersona)sesion.getAttribute("filtroNotifPersona")));
				req.setAttribute("listaPerfiles",notificacionDB.getListaPerfiles());
				irA="/Notificaciones/NuevaNotificacion.jsp";

			break;
			case Parametros.cmdCambiaEstado:
				if(notificacionDB.cambiaEstado(req.getParameter("idNotifi"),req.getParameter("valor"),usuario.getIdUsuario()))
					mensaje="Accion ejecutada Satisfactoriamente";
				else
					mensaje="La accion ejecutada no pudo ser ejecutada";
				req.setAttribute("listaNotificaciones",notificacionDB.getListaNotificaciones(usuario));
			break;
			case Parametros.cmdEnviarNotifiacion:
				if(notificacionDB.insertaNotificacion((FiltroPersona)sesion.getAttribute("filtroNotifPersona"),usuario.getIdUsuario()))
					mensaje="Notificación almacenada Correctamente";
				else
					mensaje="La Notificación no pudo ser almacenada";
				irA="/Notificaciones/NuevaNotificacion.jsp";
				sesion.removeAttribute("filtroNotifPersona");
			break;
			default:
				req.setAttribute("listaNotificaciones",notificacionDB.getListaNotificaciones(usuario));
			break;
		}
		accion=0;
		retorno[0]="desviar";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}
