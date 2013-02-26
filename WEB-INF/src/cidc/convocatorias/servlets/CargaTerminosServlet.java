package cidc.convocatorias.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import cidc.convocatorias.db.ConvocatoriasDB;
import cidc.convocatorias.obj.ConvocatoriaOBJ;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.obj.CargarDocumento;
import cidc.general.servlet.ServletGeneral;

public class CargaTerminosServlet extends ServletGeneral {
	
	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		String irA="/Convocatoria/Cargar.jsp";
        CargarDocumento cargarDocumento=new CargarDocumento();
        HttpSession sesion=req.getSession();
        Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		ConvocatoriaOBJ convocatoriaOBJ=(ConvocatoriaOBJ)sesion.getAttribute("convocatoriaOBJ");
        String nombre="Convocatoria";
        cursor=new CursorDB();
        if(convocatoriaOBJ!=null){
        	nombre=nombre+" "+convocatoriaOBJ.getConvAno()+"-"+convocatoriaOBJ.getConvNumero();
	        if(cargarDocumento.cargar(req,nombre,"Convocatorias")){
	        	ConvocatoriasDB convocatoriasDB=new ConvocatoriasDB(cursor,usuario.getPerfil());
	        	String x=cargarDocumento.getNombreArchivo();
	        	String ext=x.substring(x.lastIndexOf("."),x.length());
	        	convocatoriasDB.setTerminos(convocatoriaOBJ.getConvId(),nombre+ext);
	        	req.setAttribute("estado","Se han cargado el archivo "+cargarDocumento.getNombreArchivo()+"");
	        }else{
	        	req.setAttribute("estado","Falló la carga del archivo "+cargarDocumento.getNombreArchivo()+"");
	        }
        }else{
        	req.setAttribute("estado","Debe Seleccionar una Convocatoria");
        }

        retorno[0]="unir";
		retorno[1]=irA;
		retorno[2]="";
		return retorno;
	}
}

