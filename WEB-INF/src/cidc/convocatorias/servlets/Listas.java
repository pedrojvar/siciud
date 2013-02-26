package cidc.convocatorias.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.convocatorias.db.ConvocatoriasDB;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;

public class Listas extends ServletGeneral {

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
		cursor=new CursorDB();
		HttpSession sesion=req.getSession();
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
	//	ConvocatoriaOBJ convocatoriaOBJ=(ConvocatoriaOBJ)sesion.getAttribute("editConv");
		ConvocatoriasDB convocatoriasDB=new ConvocatoriasDB(cursor,usuario.getPerfil());
		String irA="/Convocatoria/ListaConvocatoria.jsp";
		int ver=0;
		if(req.getParameter("ver")!=null)
			ver=Integer.parseInt(req.getParameter("ver"));
		switch(ver){
			case 1:
		//		System.out.println("entra al case");
				if(req.getParameter("cod")!=null && !req.getParameter("cod").equals("")){
		//		System.out.println("entra al if");
					long cod=Integer.parseInt(req.getParameter("cod"));
					sesion.setAttribute("convocatoriaOBJ",convocatoriasDB.getConvocatoria(cod));
					req.setAttribute("selec",""+cod);
				}
				ver=0;
			//	irA="/Convocatoria/Parametrizar.jsp";
			break;
			case 2:
		//		System.out.println("entra al case del 2");
				if(req.getParameter("cod")!=null && !req.getParameter("cod").equals("")){
		//		System.out.println("entra al if");
					long cod=Integer.parseInt(req.getParameter("cod"));
					convocatoriasDB.quitarConvocatoria(cod);
				}
				ver=0;
			//	irA="/Convocatoria/Parametrizar.jsp";
			break;
		}
		sesion.setAttribute("listaConvOBJ",convocatoriasDB.listaConvocatorias(0));
	//	System.out.println("irA="+irA);
		retorno[0]="unir";
		retorno[1]=irA;
		retorno[2]="";
		return retorno;
	}
}
