package cidc.adminGrupos.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.adminGrupos.db.AdminGruposDB;
import cidc.adminGrupos.obj.Parametros;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;


public class Ajax extends ServletGeneral{


	public String[] operaciones(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		AdminGruposDB admingrupos=null;
		String irA="";
		String mensaje="";
		try{
			irA="/adminGrupos/adminIntegrantes/Ajax.jsp";
			HttpSession sesion = request.getSession();
			cursor=new CursorDB();
			Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
			admingrupos=new AdminGruposDB(cursor,usuario.getPerfil());

			if(usuario.getPerfil()==4)
				irA="/adminGrupos/adminIntegrantes/Ajax.jsp";
			else
				irA="/adminGrupos/adminIntegrantes/Ajax.jsp";

			int para=0;
			if(request.getParameter("para")!=null)
				para=Integer.parseInt(request.getParameter("para"));
			String []datos=null;
			switch(para){
				case Parametros.AjaxProy:
						datos=request.getParameterValues("dato");
						if(datos==null || datos==null) break;
						sesion.setAttribute("ajaxProyCur",admingrupos.AjaxProyectoCur(Integer.parseInt(datos[0])));						
						request.setAttribute("para",String.valueOf(Parametros.AjaxProy));

				break;
			}
		}catch(Exception e){e.printStackTrace();}

		retorno[0]="unir";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}

}
