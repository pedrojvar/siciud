package cidc.eventos.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.eventos.db.EventosDB;
import cidc.eventos.obj.ParametrosOBJ;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;


public class GestionEventos extends ServletGeneral {

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
		cursor=new CursorDB();
		HttpSession sesion=req.getSession();
		String irA="";
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		EventosDB eventoDB=new EventosDB(cursor,usuario.getPerfil());

		int accion=0;

		irA="/inscripEventos/inscripEvento.jsp";
		if(req.getParameter("accion")!=null)
			accion=Integer.parseInt(req.getParameter("accion"));

		retorno[0]="unir";

	//	System.out.println("usuario= "+usuario.getPerfil()+" accion= "+accion);

		switch(accion){
			case ParametrosOBJ.cmdInsertaInscripcio:
				if(eventoDB.insertaInscripcion(usuario.getIdUsuario()))
					mensaje="Inscripción realizada Satisfactoriamente";
				else
					mensaje="La inscripción no pudo ser realizada";
				req.setAttribute("estadoInscripcion", eventoDB.getEstadoInscripcion(usuario.getIdUsuario(),1));
			break;
			
			
			default:
				req.setAttribute("estadoInscripcion", eventoDB.getEstadoInscripcion(usuario.getIdUsuario(),1));
				mensaje="";
			break;
		}


		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}
