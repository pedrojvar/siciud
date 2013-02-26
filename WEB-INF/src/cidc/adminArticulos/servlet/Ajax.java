package cidc.adminArticulos.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;
import cidc.inscripcionConv.db.InscripcionConvDB;
import cidc.adminArticulos.obj.Parametros;

public class Ajax extends ServletGeneral{


	public String[] operaciones(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		InscripcionConvDB inscripcionConvDB;
		String irA="";
		String mensaje="";
		try{
			irA="/adminArticulos/Ajax.jsp";
			HttpSession sesion = request.getSession();
			cursor=new CursorDB();
			Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
			inscripcionConvDB=new InscripcionConvDB(cursor,usuario.getPerfil());
			int para=0;
			if(request.getParameter("accion")!=null)
				para=Integer.parseInt(request.getParameter("accion"));
			String []datos=null;
			datos=request.getParameterValues("dato");
			switch(para){
				case Parametros.ajaxGrupos:
					if(datos==null || datos==null) break;
					sesion.setAttribute("ajaxGrupos",inscripcionConvDB.AjaxGruposInvestigacion(Integer.parseInt(datos[0]),Integer.parseInt(datos[1])));
					request.setAttribute("para",String.valueOf(Parametros.ajaxGrupos));
				break;
				case Parametros.ajaxInvestigador:
					sesion.setAttribute("ajaxInvestigador",inscripcionConvDB.AjaxInvestigadores(Integer.parseInt(datos[0])));
					request.setAttribute("para",String.valueOf(Parametros.ajaxInvestigador));
				break;
			}
		}catch(Exception e){e.printStackTrace();}

		retorno[0]="unir";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}

}
