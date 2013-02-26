package cidc.adminEvaluador.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.adminEvaluador.obj.Parametros;
import cidc.adminEvaluador.db.EvaluadorDB;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;
import cidc.inscripcionConv.db.InscripcionConvDB;



public class Ajax extends ServletGeneral{
	
	
	public String[] operaciones(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		EvaluadorDB evaluadorDB=null;
		String irA="";
		String mensaje="";
		try{
			HttpSession session = request.getSession();
			cursor=new CursorDB();
			HttpSession sesion=request.getSession();
			Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
			evaluadorDB=new EvaluadorDB(cursor,usuario.getPerfil());
			InscripcionConvDB InscripcionConvDB=new InscripcionConvDB(cursor,usuario.getPerfil());
			int accion=Integer.parseInt(request.getParameter("accion"));
			String []datos=null;
//			System.out.println("llega al Ajax");						
			datos=request.getParameterValues("dato");
			irA="/adminEvaluador/Ajax.jsp";
	//		System.out.println("accion="+accion);
			switch (accion) {
				case Parametros.ajaxAreas:
					request.setAttribute("ajaxAreas",evaluadorDB.ajaxtAreas(Integer.parseInt(datos[0])));
					request.setAttribute("para",""+Parametros.ajaxAreas);
				break;
				case Parametros.ajaxGrupos:
					request.setAttribute("ajaxGrupos",InscripcionConvDB.AjaxGruposInvestigacion(Integer.parseInt(datos[0]),0 ));
					request.setAttribute("ajaxPersonas",InscripcionConvDB.AjaxInvestigadores(Integer.parseInt(datos[0])));
					request.setAttribute("para",""+Parametros.ajaxGrupos);
				break;
				case Parametros.ajaxPersonas:
					request.setAttribute("ajaxPersonas",InscripcionConvDB.AjaxInvestigadores(Integer.parseInt(datos[0])));
					request.setAttribute("para",""+Parametros.ajaxPersonas);
				break;
			}
			
		}catch(Exception e){e.printStackTrace();}	
		
		retorno[0]="unir";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
	
}
