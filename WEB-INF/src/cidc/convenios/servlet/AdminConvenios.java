package cidc.convenios.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.convenios.db.AdminConvenioDB;
import cidc.convenios.obj.Convenio;
import cidc.convenios.obj.Parametros;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;

public class AdminConvenios extends ServletGeneral {

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
		cursor=new CursorDB();
		HttpSession sesion=req.getSession();
		String irA="/adminConvenio/NuevoConvenio.jsp";
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		AdminConvenioDB adminConv= new AdminConvenioDB(cursor,usuario.getPerfil());
		mensaje="";
		int accion=0;
		if(req.getParameter("accion")!=null)
			accion=Integer.parseInt(req.getParameter("accion"));
		switch(accion){
			case Parametros.cmdInsertaConvenio:
				if(adminConv.nuevoConvenio((Convenio)sesion.getAttribute("nuevoConvenio")))
					mensaje="Resgistro insertado correctamente";
				else
					mensaje="El resgistro no pudo ser insertado correctamente";
				sesion.removeAttribute("nuevoConvenio");
				irA="/adminConvenio/NuevoConvenio.jsp";
			break;
			case Parametros.cmdListaConvenio:
				req.setAttribute("listaConvenios", adminConv.listaConvenio());
				irA="/adminConvenio/ListaConvenios.jsp";
			break;
			case Parametros.cmdGetConvenio:
				req.setAttribute("datoConvenio", adminConv.getConvenio(req.getParameter("idConv")));
				req.setAttribute("accion","4");
				irA="/adminConvenio/NuevoConvenio.jsp";
			break;
			case Parametros.cmdUpdateConvenio:
				if(adminConv.actualizaConvenio((Convenio)sesion.getAttribute("nuevoConvenio")))
					mensaje="Resgistro actualizado correctamente";
				else
					mensaje="El resgistro no pudo ser actualizado correctamente";
				req.setAttribute("datoConvenio", adminConv.getConvenio(req.getParameter("idConvenio")));
				req.setAttribute("accion","4");
				irA="/adminConvenio/NuevoConvenio.jsp";
			break;
			default:
				irA="/adminConvenio/NuevoConvenio.jsp";
			break;
		}

		accion=0;
		retorno[0]="desviar";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}
