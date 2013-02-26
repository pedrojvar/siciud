package cidc.inscripcionConv.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cidc.general.db.CursorDB;
import cidc.general.obj.Parametros;
import cidc.general.servlet.ServletGeneral;
import cidc.inscripcionConv.db.InscripcionConvDB;

public class Resumen extends ServletGeneral {
	
	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
	//	HttpSession sesion=req.getSession();
		cursor=new CursorDB();
		String irA="/InscripcionConv/Resumen.jsp";
		String mensaje="";
		String id=(String)req.getAttribute("idInsc");
		InscripcionConvDB inscripcionConvDB=new InscripcionConvDB(cursor,Parametros.userVisitante);
	//	req.setAttribute("resumen",inscripcionConvDB.getResumen(id));
	//	String claveIngreso=inscripcionConvDB.getClaveIngreso(Long.parseLong(id));
//		if(req.getAttribute("clave")==null)
		mensaje="La inscripción se almacenó correctamente \nFavor Imprimir y conservar este resumen de su inscripción";
		retorno[0]="unir";
		retorno[1]="www.google.com";
		retorno[2]=mensaje;
		return retorno;
	}
}
