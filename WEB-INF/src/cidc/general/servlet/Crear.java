package cidc.general.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.convocatorias.db.ConvocatoriasDB;
import cidc.convocatorias.obj.ConvocatoriaOBJ;
import cidc.convocatorias.obj.ParametrosOBJ;
import cidc.general.db.CursorDB;
import cidc.general.db.UsuarioDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;

public class Crear extends ServletGeneral {
		
	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
		cursor=new CursorDB();
		String irA="/Convocatoria/Convocatoria.jsp";
		String mensaje="";
		int accion=Integer.parseInt(req.getParameter("accion"));
		HttpSession sesion=req.getSession();
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		ConvocatoriasDB convocatoriasDB=new ConvocatoriasDB(cursor,usuario.getPerfil());
		ConvocatoriaOBJ convocatoriaOBJ=(ConvocatoriaOBJ)sesion.getAttribute("convocatoriaOBJ");
		switch(accion){
		case ParametrosOBJ.Guardar:
		//	System.out.println("entra al case de insertar");
			irA="/Convocatoria/Parametrizar.jsp";
				if(convocatoriaOBJ!=null){
					if(convocatoriasDB.insertaConvocatoria(convocatoriaOBJ)){
						mensaje="Convocatoria Insertada";
					}else{
						mensaje="La convocatoria no pudo ser insertada \n"+convocatoriasDB.getMensaje();
						irA="/Convocatoria/Convocatoria.jsp";
					}
				}
		break;
		case ParametrosOBJ.modificar:
			irA="/Convocatoria/ModificarConv.jsp";
				if(convocatoriaOBJ!=null){
					if(convocatoriasDB.modificarConvocatoria(convocatoriaOBJ)){
						mensaje="Convocatoria Modificada";
					}else{
						mensaje="La convocatoria no pudo ser modificada  \n"+convocatoriasDB.getMensaje();
					}
				}
		break;
		}
		
		req.removeAttribute("accion");
		retorno[0]="desviar";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}
