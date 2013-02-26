package cidc.informes.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.convMovilidad.db.MovilidadDB;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;
import cidc.informes.db.InformesDB;
import cidc.informes.obj.Parametros;

public class Ajax extends ServletGeneral{
	
	public String[] operaciones(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		InformesDB informesDB=null;
		String irA="";
		String mensaje="";
		try{
			irA="/Informes/Ajax.jsp";
			HttpSession sesion = request.getSession();
			cursor=new CursorDB();
			Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
			informesDB=new InformesDB(cursor,usuario.getPerfil());
			int para=0;
			if(request.getParameter("accion")!=null)
				para=Integer.parseInt(request.getParameter("accion"));
			String []datos=null;
	
			switch(para){
				case Parametros.getTablas:
					sesion.setAttribute("ajaxTablas", informesDB.getTablasRelacionadas(request.getParameter("dato")));
					sesion.setAttribute("idCombo", request.getParameter("idCombo"));
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
