package cidc.proyectos.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cidc.general.db.BaseDB;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.obj.CargarDocumento;
import cidc.general.servlet.ServletGeneral;
import cidc.proyectos.db.ProyectosDB;
import cidc.proyectos.obj.BalanceGeneral;
import cidc.proyectos.obj.Proyecto;
import cidc.proyectos.obj.Parametros;


/**
 * Servlet Class
 *
 * @web.servlet              name="ProyectosAntiguos"
 *                           display-name="Name for ProyectosAntiguos"
 *                           description="Description for ProyectosAntiguos"
 * @web.servlet-mapping      url-pattern="/ProyectosAntiguos"
 * @web.servlet-init-param   name="A parameter"
 *                           value="A value"
 */

public class GastosExcel extends ServletGeneral {

	       Usuario usuario = null;

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		String irA="/GestionProyectos/AdminProyectos.x?accion=13";
		HttpSession sesion=req.getSession();
		usuario=(Usuario)sesion.getAttribute("loginUsuario");
		ProyectosDB proyectosDB=new ProyectosDB(cursor,usuario.getPerfil());
		Proyecto proyecto =null;
		if(sesion.getAttribute("proyecto")!=null)
			proyecto = (Proyecto)sesion.getAttribute("proyecto");
        int accion=0;
        String rubro=null;
        DiskFileUpload fu = new DiskFileUpload();
		FileItem archivoAdj=null;
        cursor=new CursorDB();
        mensaje="";

		if (ServletFileUpload.isMultipartContent(req)){
			List items=new ArrayList();
			try {
				items = fu.parseRequest(req);
		        FileItem item=null;
		        if(items.size()>0){
			        Iterator iter = items.iterator();
			        while (iter.hasNext()) {
			            item = (FileItem) iter.next();
			            if (item.isFormField()) {
			            	if(item.getFieldName().equals("accion"))
			            		accion=Integer.parseInt(item.getString());
			            	if(item.getFieldName().equals("rubro"))
			            		rubro=item.getString();
			            }else{
			            	archivoAdj=item;
			            }
			        }
		        }
			}catch (FileUploadException e) {
				// TODO Auto-generated catch block
				baseDB=new BaseDB(cursor,1);
				baseDB.lanzaExcepcion(e);
			} catch (Exception e) {
				baseDB=new BaseDB(cursor,1);
				baseDB.lanzaExcepcion(e);
			}
        }else{
        	accion=Integer.parseInt(req.getParameter("accion"));
        }
		switch(accion){
			case Parametros.cmdLecturaExcel:
				if(archivoAdj!=null){
				 try {
					  sesion.setAttribute("listaGastoLeidos", proyectosDB.leerGastosExcel(rubro,archivoAdj.getInputStream()));
			     } catch (Exception e) {
					// TODO Auto-generated catch block
					baseDB=new BaseDB(cursor,1);
					baseDB.lanzaExcepcion(e);
					mensaje="No se pudo completar la lectura del archivo \n"+proyectosDB.getMensaje();
				}
				}
				irA="/adminProyectos/ListaGastosExcel.jsp";
			break;
		}

		retorno[0]="desviar";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
		}
}

