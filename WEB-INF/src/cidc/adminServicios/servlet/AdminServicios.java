package cidc.adminServicios.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.adminServicios.db.AdminServiciosDB;
import cidc.adminServicios.obj.Objeto;
import cidc.adminServicios.obj.Parametros;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;

public class AdminServicios extends ServletGeneral {

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
		cursor=new CursorDB();
		HttpSession sesion=req.getSession();
		String irA="/AdminServicios/servicios.jsp";
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		AdminServiciosDB adminServiciosDB=new AdminServiciosDB(cursor,usuario.getPerfil());
		mensaje="";
		int accion=0;
		if(req.getParameter("accion")!=null)
			accion=Integer.parseInt(req.getParameter("accion"));
		req.setAttribute("prop",req.getParameter("prop"));
		retorno[0]="unir";
		switch(accion){
		case Parametros.cmdCambioRecuroPerfil:
				Objeto obj=(Objeto)sesion.getAttribute("perfiles2");
				if(adminServiciosDB.setPerfilServicio(obj))
					mensaje="Perfil de Servicio modificado correctamente";
				else
					mensaje="No pudo ser modificado el perfil del servicio";
				req.setAttribute("listaCategoria",adminServiciosDB.getCategorias());
			break;
			default:
				req.setAttribute("listaCategoria",adminServiciosDB.getCategorias());
			break;

		}
		req.setAttribute("listaPerfiles",adminServiciosDB.getListaPerfiles());

		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}
