package cidc.adminEvaluador.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import cidc.adminEvaluador.db.*;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.obj.CargarDocumento;
import cidc.general.servlet.ServletGeneral;

public class CargaDocumentos extends ServletGeneral {

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		String irA="/adminEvaluador/CargarDocumentos.jsp";
        CargarDocumento cargarDocumento=new CargarDocumento();
        HttpSession sesion=req.getSession();
        /*
         *
         * Hay que crear dos servlet apra capturar los documentos
         *  proque no se como hacer para que se carguen
         *  los dos en un mismo servlet
         *
         *
         * */
        Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
        String nombre="Eval";
        cursor=new CursorDB();
  //  	nombre=nombre+" "+req.getParameter("id")+"-"+req.getParameter("doc");
   // 	System.out.println(nombre);
        if(cargarDocumento.cargar(req,nombre,"Evaluadores")){
        	EvaluadorDB evaluador=new EvaluadorDB(cursor,usuario.getPerfil());
        	String x=cargarDocumento.getNombreArchivo();
        	String ext=x.substring(x.lastIndexOf("."),x.length());
        	evaluador.insertaDocumentacion(nombre+ext,req.getParameter("doc"),
        			req.getParameter("id"),req.getParameter("estado"));
        	req.setAttribute("estado","Se han cargado el archivo "+cargarDocumento.getNombreArchivo()+"");
        }else{
        	req.setAttribute("estado","Falló la carga del archivo "+cargarDocumento.getNombreArchivo()+"");
        }

        retorno[0]="desviar";
		retorno[1]=irA;
		retorno[2]="";
		return retorno;
	}
}

