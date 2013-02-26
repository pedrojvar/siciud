package cidc.convMovilidad.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.articulos_Conv.db.ArticuloConvBD;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;
import cidc.inventario.db.InventarioDB;
import cidc.convMovilidad.obj.ParametrosOBJ;

public class Ajax extends ServletGeneral{
	
	public String[] operaciones(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		System.out.println("Ingreso al Ajax");
		ArticuloConvBD articulosDB;
		String irA="";
		String mensaje="";
		try{
			irA="/convMovilidad/Ajax.jsp";
			HttpSession sesion = request.getSession();
			cursor=new CursorDB();
			Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
			articulosDB=new ArticuloConvBD(cursor,usuario.getPerfil());
			int para=0;
			if(request.getParameter("para")!=null)
				para=Integer.parseInt(request.getParameter("para"));
			String []datos=null;
			System.out.println("Ingresa al Ajax con case=="+para);
			switch(para){
				case ParametrosOBJ.AjaxProyectos:
					datos=request.getParameterValues("dato");
					System.out.println("El id del grupo es*********** "+Integer.parseInt(datos[0]));
					if(datos==null) break;
						sesion.setAttribute("ajaxProyectos",articulosDB.AjaxProyectosInvestigacion(Integer.parseInt(datos[0])));						
					System.out.println("Dentro del case");
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
