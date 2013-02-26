package cidc.proyectosAntiguos.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


import cidc.general.db.BaseDB;
import cidc.general.db.CursorDB;
import cidc.general.servlet.ServletGeneral;
import cidc.general.obj.CargarDocumento;
import cidc.proyectosAntiguos.db.ProyectosAntiguosDB;
import cidc.proyectosAntiguos.obj.DocumentosOBJ;
import cidc.proyectosAntiguos.obj.ParametrosOBJ;
import cidc.proyectosAntiguos.obj.ProyectoAntiguoOBJ;

public class ArchivoServlet extends ServletGeneral {

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		String irA="/proyectosAntiguos/ArchivosProyectoAntiguo.jsp";
        CargarDocumento cargarDocumento=new CargarDocumento();
        HttpSession sesion=req.getSession();
        ProyectoAntiguoOBJ objProyecto=(ProyectoAntiguoOBJ)sesion.getAttribute("proyectos");
        DocumentosOBJ obj_docs = new DocumentosOBJ();
        String nombre;
        String nom_doc;
        DiskFileUpload fu = new DiskFileUpload();
		FileItem archivoAdj=null;
		int idProy = objProyecto.getId();
        cursor=new CursorDB();
        mensaje="";
        if(objProyecto!=null){
        	ProyectosAntiguosDB proyectoAntiguoDB = new ProyectosAntiguosDB(cursor,2);

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
				            	if(item.getFieldName().equals("tipo"))//para cada campo de los formularos, todos los 5 campos y los asigno al obj de documentos obj_docs.setNom_propuesta(nombreArchivo);
				            		obj_docs.setTipo(item.getString());
				            	if(item.getFieldName().equals("fecha"))
				            		obj_docs.setFecha(item.getString());
				            	if(item.getFieldName().equals("numero"))
				            		obj_docs.setNumero(Integer.parseInt(item.getString()));
				            	if(item.getFieldName().equals("observacion"))
				            		obj_docs.setObservacion(item.getString());
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

			}
			if(obj_docs.getTipo()!=null){
				String path=req.getRealPath(req.getContextPath()).substring(0,req.getRealPath(req.getContextPath()).lastIndexOf(sep));
				String nombreArchivo=null;
				switch(Integer.parseInt(obj_docs.getTipo())){
					case ParametrosOBJ.ArchivoPropuesta:
						 irA="/proyectosAntiguos/ArchivosProyectoAntiguo.jsp";
						 nombre="Propuesta_";
						 nom_doc = nombre+objProyecto.getId()+".pdf";
						 obj_docs.setNombre(nom_doc);
						 try {
							  nombreArchivo=cargarDocumento.cargarGenerico(path,archivoAdj,"ProyectosAntiguos/Propuestas",nombre,objProyecto.getId()); //asignarlo de una vez al nombre del archivo de la propuesta del objeto de documentos
							  if(proyectoAntiguoDB.almacenarDatosArchivo(idProy, obj_docs))//envio todos los datos de guardar la propuesta
			        			mensaje="Documento Cargado satisfactoriamente";
					          else
					        	mensaje="No se pudo completar la carga del Documento \nFavor volver a intentar";
					     } catch (Exception e) {
							// TODO Auto-generated catch block
							baseDB=new BaseDB(cursor,1);
							baseDB.lanzaExcepcion(e);
							mensaje="No se pudo completar la carga del Documento \nFavor volver a intentar";
						}
				       // req.setAttribute("archivos",inscripcionConvDB.getInfoArchivos(""+idProp));
					break;
					case ParametrosOBJ.ArchivoActaInicio:
						 irA="/proyectosAntiguos/ArchivosProyectoAntiguo.jsp";
						 nombre="ActaInicio_";
						 nom_doc = nombre+objProyecto.getId()+".pdf";
						 obj_docs.setNombre(nom_doc);
						 try {
							  nombreArchivo=cargarDocumento.cargarGenerico(path,archivoAdj,"ProyectosAntiguos/Actas",nombre,objProyecto.getId());
							  if(proyectoAntiguoDB.almacenarDatosArchivo(idProy, obj_docs))
			        			mensaje="Documento Cargado satisfactoriamente";
					          else
					        	mensaje="No se pudo completar la carga del Documento \nFavor volver a intentar";
					     } catch (Exception e) {
							// TODO Auto-generated catch block
							baseDB=new BaseDB(cursor,1);
							baseDB.lanzaExcepcion(e);
							mensaje="No se pudo completar la carga del Documento \nFavor volver a intentar";
						}
					break;
					case ParametrosOBJ.ArchivoContrato:
						 irA="/proyectosAntiguos/ArchivosProyectoAntiguo.jsp";
						 nombre="Contrato_";
						 nom_doc = nombre+objProyecto.getId()+".pdf";
						 obj_docs.setNombre(nom_doc);
						 try {
							  nombreArchivo=cargarDocumento.cargarGenerico(path,archivoAdj,"ProyectosAntiguos/Contratos",nombre,objProyecto.getId());
							  if(proyectoAntiguoDB.almacenarDatosArchivo(idProy, obj_docs))
			        			mensaje="Documento Cargado satisfactoriamente";
					          else
					        	mensaje="No se pudo completar la carga del Documento \nFavor volver a intentar";
					     } catch (Exception e) {
							// TODO Auto-generated catch block
							baseDB=new BaseDB(cursor,1);
							baseDB.lanzaExcepcion(e);
							mensaje="No se pudo completar la carga del Documento \nFavor volver a intentar";
						}
					break;
					case ParametrosOBJ.ArchivoInformeFinal:
						 irA="/proyectosAntiguos/ArchivosProyectoAntiguo.jsp";
						 nombre="InfoFinal_";
						 nom_doc = nombre+objProyecto.getId()+".pdf";
						 obj_docs.setNombre(nom_doc);
						 try {
							  nombreArchivo=cargarDocumento.cargarGenerico(path,archivoAdj,"ProyectosAntiguos/Otros",nombre,objProyecto.getId());
							  if(proyectoAntiguoDB.almacenarDatosArchivo(idProy, obj_docs))
			        			mensaje="Documento Cargado satisfactoriamente";
					          else
					        	mensaje="No se pudo completar la carga del Documento \nFavor volver a intentar";
					     } catch (Exception e) {
							// TODO Auto-generated catch block
							baseDB=new BaseDB(cursor,1);
							baseDB.lanzaExcepcion(e);
							mensaje="No se pudo completar la carga del Documento \nFavor volver a intentar";
						}
					break;
					case ParametrosOBJ.ArchivoActaFinal:
						 irA="/proyectosAntiguos/ArchivosProyectoAntiguo.jsp";
						 nombre="ActaFinal_";
						 nom_doc = nombre+objProyecto.getId()+".pdf";
						 obj_docs.setNombre(nom_doc);
						 try {
							  nombreArchivo=cargarDocumento.cargarGenerico(path,archivoAdj,"ProyectosAntiguos/ActasFinales",nombre,objProyecto.getId());
							  if(proyectoAntiguoDB.almacenarDatosArchivo(idProy, obj_docs))
			        			mensaje="Documento Cargado satisfactoriamente";
					          else
					        	mensaje="No se pudo completar la carga del Documento \nFavor volver a intentar";
					     } catch (Exception e) {
							// TODO Auto-generated catch block
							baseDB=new BaseDB(cursor,1);
							baseDB.lanzaExcepcion(e);
							mensaje="No se pudo completar la carga del Documento \nFavor volver a intentar";
						}
					break;
					case ParametrosOBJ.ArchivoAnexos:
						 irA="/proyectosAntiguos/ArchivosProyectoAntiguo.jsp";
						 nombre="Anexos_";
						 try {
							  nombreArchivo=cargarDocumento.cargarGenerico(path,archivoAdj,"ProyectosAntiguos/Anexos",nombre,objProyecto.getId());
							  obj_docs.setNombre(nombreArchivo);
							  if(proyectoAntiguoDB.almacenarDatosArchivo(idProy, obj_docs))
			        			mensaje="Documento Cargado satisfactoriamente";
					          else
					        	mensaje="No se pudo completar la carga del Documento \nFavor volver a intentar";
					     } catch (Exception e) {
							// TODO Auto-generated catch block
							baseDB=new BaseDB(cursor,1);
							baseDB.lanzaExcepcion(e);
							mensaje="No se pudo completar la carga del Documento \nFavor volver a intentar";
						}
					break;
					default: sesion.setAttribute("proyectos", proyectoAntiguoDB.consultarNombresArchivos(idProy,objProyecto));
					break;
				}
				sesion.setAttribute("proyectos", proyectoAntiguoDB.consultarNombresArchivos(idProy, objProyecto));//metodo para consultar archivos
			}
        }else{
        	//req.setAttribute("estado","Debe realizar una inscripci�n");
        	mensaje="No se pudo completar la inscripci�n.. \nPor favor vuelva a intentarlo";
        }
        //sesion.removeAttribute("inscripcionConvOBJ");
       // req.removeAttribute("listaRubrosOBJ");
       // req.removeAttribute("listaRubrosOBJ1");
        retorno[0]="unir";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}



