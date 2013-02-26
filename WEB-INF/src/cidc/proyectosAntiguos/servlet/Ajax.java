package cidc.proyectosAntiguos.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.general.db.CursorDB;
import cidc.general.servlet.ServletGeneral;
import cidc.proyectosAntiguos.db.ProyectosAntiguosDB;
import cidc.proyectosAntiguos.obj.ParametrosOBJ;

public class Ajax extends ServletGeneral{


	public String[] operaciones(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String irA="";
		String mensaje="";
		try{
			irA="/proyectosAntiguos/Ajax.jsp";
			HttpSession sesion = request.getSession();
			cursor=new CursorDB();
			ProyectosAntiguosDB proyAntiguosDB = new ProyectosAntiguosDB(cursor, 2);
			int para=0;
			if(request.getParameter("para")!=null)
				para=Integer.parseInt(request.getParameter("para"));
			String []datos=null;
			switch(para){
				case ParametrosOBJ.AjaxGrupos:
					 datos=request.getParameterValues("dato");
					 if(datos==null) break;
					 irA="/proyectosAntiguos/Ajax.jsp";
                     sesion.setAttribute("ajaxGrupos",proyAntiguosDB.consultarGrupos(Integer.parseInt(datos[0])));
					 request.setAttribute("para",String.valueOf(ParametrosOBJ.AjaxGrupos));
                     break;
				case ParametrosOBJ.AjaxInvestigadores:
					 datos=request.getParameterValues("dato");
					 if(datos==null) break;
					 irA="/proyectosAntiguos/Ajax.jsp";
					 sesion.setAttribute("ajaxInvest",proyAntiguosDB.consultarInvestigadores(Integer.parseInt(datos[0])));
					 request.setAttribute("para",String.valueOf(ParametrosOBJ.AjaxInvestigadores));
			         break;
			}
		}catch(Exception e){e.printStackTrace();}

		retorno[0]="unir";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}
