package cidc.adminInformes.servlet;

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

import com.sun.org.apache.bcel.internal.generic.DCONST;

import cidc.adminInformes.db.AdminInformesDB;
import cidc.adminInformes.obj.ExtraDocProyecto;
import cidc.adminInformes.obj.InformeProyecto;
import cidc.adminInformes.obj.Parametros;
import cidc.general.db.BaseDB;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.obj.CargarDocumento;
import cidc.general.servlet.ServletGeneral;
import cidc.proyectosGeneral.db.ProyectosGeneralDB;
import cidc.proyectosGeneral.obj.Proyecto;


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

public class CargaInforme extends ServletGeneral {

	Usuario usuario = null;
	CargarDocumento cargarDocumento=new CargarDocumento();
	AdminInformesDB adminInformeDB = null;

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		String irA="/GestionProyectos/AdminProyectos.x?accion=13";
		HttpSession sesion=req.getSession();
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		Proyecto proyecto =null;
		ExtraDocProyecto docNuevo=null;
		if(sesion.getAttribute("proyecto")!=null)
			proyecto = (Proyecto)sesion.getAttribute("proyecto");
        InformeProyecto  informe=null;
        
        int accion=0;
        String nombre;
        String nom_doc;
        DiskFileUpload fu = new DiskFileUpload();
		FileItem archivoAdj=null;
        cursor=new CursorDB();
        adminInformeDB=new AdminInformesDB(cursor,2);
        ProyectosGeneralDB proyectosDB=new ProyectosGeneralDB(cursor,usuario.getPerfil());
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
			            	if(item.getFieldName().equals("accion")){
			            		accion=Integer.parseInt(item.getString());
			            		if(accion==1 || accion==2)
			            			informe=new InformeProyecto();
			            		if(accion==3|| accion==4 || accion==5)
				            		docNuevo=new ExtraDocProyecto();
			            	}
			            	if(accion==1 || accion==2){			            		
				            	informe.setIdProyecto(proyecto.getId());
				            	if(item.getFieldName().equals("fecha")){
				            		informe.setFechaEntrega(item.getString());
				            	}
				            	if(item.getFieldName().equals("estado")){
				            		informe.setEstado(Integer.parseInt(item.getString()));
				            	}
				            	if(item.getFieldName().equals("tipo")){
				            		informe.setTipo(Integer.parseInt(item.getString()));
				            	}
				            	if(item.getFieldName().equals("observaciones"))
				            		informe.setObservaciones(item.getString());
			            	}
			            	if(accion==3 || accion==4 || accion==5){
			            		docNuevo.setIdProyecto(proyecto.getId());
			            		if(item.getFieldName().equals("nombre"))
			            			docNuevo.setNombreDocumento(item.getString());
			            		if(item.getFieldName().equals("observaciones"))
			            			docNuevo.setObservaciones(item.getString());
			            		if(item.getFieldName().equals("fecha"))
			            			docNuevo.setFechaDoc(item.getString());
			            	}
			            }else{
			            	archivoAdj=item;
			            }
			        }
		        }
			}catch (FileUploadException e) {
				baseDB=new BaseDB(cursor,1);
				baseDB.lanzaExcepcion(e);
			} catch (Exception e) {
				baseDB=new BaseDB(cursor,1);
				baseDB.lanzaExcepcion(e);
			}
        }else{
        	accion=Integer.parseInt(req.getParameter("accion"));
        }
		
		String path=req.getRealPath(req.getContextPath()).substring(0,req.getRealPath(req.getContextPath()).lastIndexOf(sep));
		irA="/GestionProyectos/AdminProyectos.x?accion=13";
		switch(accion){
			case Parametros.insertaInformeProyecto:
				if(informe!=null){
				 nombre="Informe_"+proyecto.getId()+"_";
				 
				 try {
					 informe.setNombreArchivo(cargarDocumento.cargarGenerico(path,archivoAdj,"Proyectos/Informes",nombre,adminInformeDB.getIdNuevoDoc(1,proyecto.getClaseProyecto())));
					  adminInformeDB.nuevoInformeProyecto(informe);
					  mensaje="Informe Cargado Satisfactoriamente";
			     } catch (Exception e) {
					// TODO Auto-generated catch block
					baseDB=new BaseDB(cursor,1);
					baseDB.lanzaExcepcion(e);
					mensaje="No se pudo completar la carga del informe \nFavor volver a intentar";
				}
		       // req.setAttribute("archivos",inscripcionConvDB.getInfoArchivos(""+idProp));
				}
			break;
			case Parametros.actualizaEstadoInforme:
				adminInformeDB.actualizaEstadoInforme(req.getParameter("idInforme"),req.getParameter("estado"));
			break;
			case Parametros.insertarDocumentoActaFinalizacion:
				nombre="ActaFin_"+proyecto.getId()+"_";
				adminInformeDB.insertaActaCierre(cargaDocumento(path,nombre, "Proyectos/Actas",archivoAdj,docNuevo,Parametros.insertarDocumentoActaFinalizacion,proyecto),3,usuario.getIdUsuario(),proyecto.getClaseProyecto());
				sesion.setAttribute("proyecto",proyectosDB.buscarProyecto(""+proyecto.getId(),""+proyecto.getClaseProyecto()));
			break;
			case Parametros.insertarDocumentoActaCancelacion:
				nombre="ActaCancel_"+proyecto.getId()+"_";
				adminInformeDB.insertaActaCierre(cargaDocumento(path,nombre, "Proyectos/Actas",archivoAdj,docNuevo,Parametros.insertarDocumentoActaCancelacion,proyecto),4,usuario.getIdUsuario(),proyecto.getClaseProyecto());
				sesion.setAttribute("proyecto",proyectosDB.buscarProyecto(""+proyecto.getId(),""+proyecto.getClaseProyecto()));
			break;
			case Parametros.insertarDocumentoExterno:
				nombre="DocAnexo__"+proyecto.getId()+"_";
				adminInformeDB.nuevoDocExternoProyecto(cargaDocumento(path,nombre, "Proyectos/Otros",archivoAdj,docNuevo,Parametros.insertarDocumentoExterno,proyecto),usuario.getIdUsuario(),proyecto.getClaseProyecto());
			break;			
		}

		retorno[0]="desviar";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
		}
	
	public ExtraDocProyecto cargaDocumento(String path, String nombre,String carpeta,FileItem archivoAdj, ExtraDocProyecto documento, int tipo, Proyecto proyecto){ 
		cursor=new CursorDB();
		adminInformeDB=new AdminInformesDB(cursor,2);
		if(documento!=null){			
			 try {
				 documento.setNombreArchivo(cargarDocumento.cargarGenerico(path,archivoAdj,carpeta,nombre,adminInformeDB.getIdNuevoDoc(tipo,proyecto.getClaseProyecto())));
				  mensaje="Documento Cargado Satisfactoriamente";
		     } catch (Exception e) {
				// TODO Auto-generated catch block
				baseDB=new BaseDB(cursor,1);
				baseDB.lanzaExcepcion(e);
				mensaje="No se pudo completar la carga del documento\nFavor volver a intentar";
			}
	       // req.setAttribute("archivos",inscripcionConvDB.getInfoArchivos(""+idProp));		        
		}
		return documento;
	}
	
	
}
