package cidc.adminPropuestas.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.adminPropuestas.obj.Parametros;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;
import cidc.inscripcionConv.db.InscripcionConvDB;
import cidc.adminPropuestas.db.AdminPropuestaDB;


public class Ajax extends ServletGeneral{
	
	
	public String[] operaciones(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		AdminPropuestaDB adminPropuestaDB;
		String irA="";
		String mensaje="";
		try{
			HttpSession sesion = request.getSession();
			cursor=new CursorDB();
			Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
			adminPropuestaDB=new AdminPropuestaDB(cursor,usuario.getPerfil());
			int accion=Integer.parseInt(request.getParameter("accion"));
			String []datos=null;
//			System.out.println("llega al Ajax");						
			datos=request.getParameterValues("dato");
			irA="/adminPropuestas/Ajax.jsp";
	//		System.out.println("accion="+accion);
			switch (accion) {
				case Parametros.cmdAjaxNumeros:
					request.setAttribute("ajaxNumeros",adminPropuestaDB.ajaxNumConvocat(Integer.parseInt(datos[0])));
					request.setAttribute("para",""+Parametros.cmdAjaxNumeros);
				break;
				case Parametros.cmdAjaxProyCurri:
					InscripcionConvDB inscripcionConvDB=new InscripcionConvDB(cursor,usuario.getPerfil());
					request.setAttribute("ajaxProyCur",inscripcionConvDB.AjaxProyectoCur());
					request.setAttribute("para",""+Parametros.cmdAjaxProyCurri);
				break;
			}
			
		}catch(Exception e){e.printStackTrace();}	
		
		retorno[0]="unir";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
	
}
