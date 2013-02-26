package cidc.adminGrupos.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cidc.adminGrupos.db.investigador.GestionInvestDB;
import cidc.adminGrupos.obj.Parametros;
import cidc.adminGrupos.obj.investigador.Articulo;
import cidc.general.db.BaseDB;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.obj.CargarDocumento;
import cidc.general.servlet.ServletGeneral;

public class ArticulosListaInvest extends ServletGeneral {

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
		cursor=new CursorDB();
		HttpSession sesion=req.getSession();
		String irA="/grupos/investigador/ListaArticInc.jsp";
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		GestionInvestDB gestionInvestDB=new GestionInvestDB(cursor,usuario.getPerfil());
		mensaje="";
		int accion=0;
		if(req.getParameter("accion")!=null)
			accion=Integer.parseInt(req.getParameter("accion"));
		switch (accion) {
			default:
				req.setAttribute("listaAticulos", gestionInvestDB.getListaArtic(usuario.getIdUsuario()));
				irA="/grupos/investigador/ListaArticInc.jsp";
			break;
		}
		accion=0;
		retorno[0]="desviar";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}
