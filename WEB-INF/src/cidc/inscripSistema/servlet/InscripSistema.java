package cidc.inscripSistema.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;
import cidc.inscripSistema.db.InscripcionSisDB;
import cidc.inscripSistema.obj.Persona;
import cidc.inscripSistema.obj.ParametrosOBJ;

public class InscripSistema extends ServletGeneral {

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
		cursor=new CursorDB();
		String irA="/InscripSis/ListaInscripciones.jsp";
		int accion=0;
		if(req.getParameter("accion")!=null)
			accion=Integer.parseInt(req.getParameter("accion"));
		HttpSession sesion=req.getSession();
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		mensaje="";
		InscripcionSisDB inscripcionSisDB=new InscripcionSisDB(cursor,usuario.getPerfil());
	//	System.out.println("entra al servlet de inscripción la sistema");
		switch(accion){
			case ParametrosOBJ.cmdInscripSistema:
				if(inscripcionSisDB.insertaPersonaIngreso((Persona)sesion.getAttribute("persona"))){
					req.setAttribute("ms","1");
				}else {
					req.setAttribute("ms","2");
				}
				irA="/InscripSis/IngresoSistema.jsp";
			break;
			case ParametrosOBJ.cmdAceptInscripSist:
				if(inscripcionSisDB.AceptaInscripcion(req.getParameter("id"),req.getParameter("caso"))){
					mensaje="Inscripcion Concluida Satisfactoriamente";
				}else {
					mensaje="La Inscripcion no pudo ser Concluida";
				}
				req.setAttribute("listaInscritos",inscripcionSisDB.getListaInscripciones());
			break;
			case ParametrosOBJ.cmdElimInscripSist:
				if(inscripcionSisDB.BorraInscripcion(null,req.getParameter("id"))){
					mensaje="Inscripcion Borrada Satisfactoriamente";
				}else {
					mensaje="La Inscripcion no pudo ser Borrada";
				}
				req.setAttribute("listaInscritos",inscripcionSisDB.getListaInscripciones());
			break;
			default:
				req.setAttribute("listaInscritos",inscripcionSisDB.getListaInscripciones());
			break;
		}
		accion=0;
		retorno[0]="desviar";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}
