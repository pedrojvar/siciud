package cidc.adminServicios.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import cidc.adminServicios.db.AdminServiciosDB;
import cidc.adminServicios.obj.Parametros;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;



public class Ajax extends ServletGeneral{


	public String[] operaciones(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		AdminServiciosDB adminServiciosDB;
		String irA="";
		String mensaje="";
		try{
			HttpSession sesion = request.getSession();
			cursor=new CursorDB();
			Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
			adminServiciosDB=new AdminServiciosDB(cursor,usuario.getPerfil());
			int accion=Integer.parseInt(request.getParameter("accion"));
			String []datos=null;
//			System.out.println("llega al Ajax");
			datos=request.getParameterValues("dato");
			irA="/AdminServicios/Ajax.jsp";
//			System.out.println("datos="+datos.length +"----"+datos[0]);
			switch (accion) {
				case Parametros.ajaxServicios:
					request.setAttribute("ajaxServicios",adminServiciosDB.ajaxServicios(Integer.parseInt(datos[0])));
					request.setAttribute("para",""+Parametros.ajaxServicios);
				break;
				case Parametros.ajaxPerfiles:
					request.setAttribute("ajaxPerfiles",adminServiciosDB.ajaxPerfilServicio(Integer.parseInt(datos[0])));
					request.setAttribute("para",""+Parametros.ajaxPerfiles);
				break;
			}

		}catch(Exception e){e.printStackTrace();}

		retorno[0]="unir";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}

}
