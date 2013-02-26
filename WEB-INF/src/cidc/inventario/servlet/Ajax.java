package cidc.inventario.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;
import cidc.inventario.db.InventarioDB;
import cidc.inventario.obj.ParametrosOBJ;

public class Ajax extends ServletGeneral{


	public String[] operaciones(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		InventarioDB inventarioDB;
		String irA="";
		String mensaje="";
		try{
			irA="/gruposInventario/Ajax.jsp";
			HttpSession sesion = request.getSession();
			cursor=new CursorDB();
			Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
			inventarioDB=new InventarioDB(cursor,usuario.getPerfil());
			int para=0;
			if(request.getParameter("para")!=null)
				para=Integer.parseInt(request.getParameter("para"));
			String []datos=null;
			switch(para){
				case ParametrosOBJ.AjaxGrupos:
					datos=request.getParameterValues("dato");
					if(datos==null) break;
						sesion.setAttribute("ajaxGrupos",inventarioDB.AjaxGruposInvestigacion(Integer.parseInt(datos[0])));
				break;
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		retorno[0]="unir";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}

}
