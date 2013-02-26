package cidc.inscripcionConv.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.convMovilidad.db.MovilidadDB;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;
import cidc.inscripcionConv.db.InscripcionConvDB;
import cidc.inscripcionConv.obj.ParametrosOBJ;
import cidc.convMovilidad.db.*;

public class Ajax extends ServletGeneral{


	public String[] operaciones(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		InscripcionConvDB inscripcionConvDB;
		String irA="";
		String mensaje="";
		MovilidadDB movilidadDB;
		try{
			irA="/InscripcionConv/Ajax.jsp";
			HttpSession sesion = request.getSession();
			cursor=new CursorDB();
			Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
			movilidadDB=new MovilidadDB(cursor,usuario.getPerfil());			
			inscripcionConvDB=new InscripcionConvDB(cursor,usuario.getPerfil());
		//	int acci�n=Integer.parseInt(request.getParameter("accion"));
			int para=0;
			if(request.getParameter("para")!=null)
				para=Integer.parseInt(request.getParameter("para"));
			String []datos=null;
			switch(para){
				case ParametrosOBJ.AjaxGrupos:
						datos=request.getParameterValues("dato");
						if(datos==null || datos==null) break;
						if(datos[2].equals("2")){
							irA="/InscripSis/Ajax.jsp";
							sesion.setAttribute("ajaxGrupos",inscripcionConvDB.AjaxGruposInvestigacion(Integer.parseInt(datos[0]),Integer.parseInt(datos[1])));
							request.setAttribute("grupo","1");
						}else{
							irA="/InscripcionConv/Ajax.jsp";
							sesion.setAttribute("ajaxGrupo",inscripcionConvDB.AjaxGruposInvestigacion(Integer.parseInt(datos[0]),1));
							request.setAttribute("grupo","0");
						}
						request.setAttribute("para",String.valueOf(ParametrosOBJ.AjaxGrupos));

				break;
				case ParametrosOBJ.AjaxDirector:
						irA="/InscripSis/Ajax.jsp";
						datos=request.getParameterValues("dato");
						if(datos==null  || datos==null) break;
						sesion.setAttribute("ajaxDirector",inscripcionConvDB.AjaxDirector(Integer.parseInt(datos[0])));
						request.setAttribute("para",String.valueOf(ParametrosOBJ.AjaxDirector));
				break;
				case ParametrosOBJ.AjaxInvestig:
						irA="/InscripSis/Ajax.jsp";
						if(usuario.getPerfil()==13)
							irA="/InscripcionConv/Ajax.jsp";
						datos=request.getParameterValues("dato");
						if(datos==null  || datos==null) break;
						sesion.setAttribute("ajaxInvest",inscripcionConvDB.AjaxInvestigadores(Integer.parseInt(datos[0])));
						request.setAttribute("para",String.valueOf(ParametrosOBJ.AjaxInvestig));
				break;
				case ParametrosOBJ.AjaxProfesor:
					System.out.println("Ingreso al Para 9 es decir a buscar la info de los profesores");
					//irA="/InscripSis/Ajax.jsp";
					irA="/InscripcionConv/Ajax.jsp";
					if(usuario.getPerfil()==13)
						irA="/InscripcionConv/Ajax.jsp";
					datos=request.getParameterValues("dato");
					System.out.println("Valor del dato... id grupo:   "+Integer.parseInt(datos[0]));
					if(datos==null) break;
					sesion.setAttribute("ajaxProfDir",inscripcionConvDB.AjaxProfesores(Integer.parseInt(datos[0])));
					sesion.setAttribute("ajaxProyectos",movilidadDB.AjaxProyectosInvestigacion(Integer.parseInt(datos[0])));
					request.setAttribute("para",String.valueOf(ParametrosOBJ.AjaxProfesor));
					System.out.println("antes de retornar VALOR DE PARA ---> "+ParametrosOBJ.AjaxProfesor);
					System.out.println("Se dirige a esta pagina ---> "+irA);
				break;
				
			}
		}catch(Exception e){e.printStackTrace();}

		retorno[0]="unir";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}

}
