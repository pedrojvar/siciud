package cidc.inscripcionConv.servlet;

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


import cidc.inscripcionConv.obj.InscripcionConvOBJ;
import cidc.inscripcionConv.obj.ParametrosOBJ;
import cidc.inscripcionConv.db.InscripcionConvDB;
import cidc.convocatorias.obj.ConvocatoriaOBJ;
import cidc.general.db.BaseDB;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.obj.CargarDocumento;
import cidc.general.servlet.ServletGeneral;

public class ArchivoServlet extends ServletGeneral {

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		String irA="/inscripcionConv/ListaConvocatoria.x";
        CargarDocumento cargarDocumento=new CargarDocumento();
        HttpSession sesion=req.getSession();
        Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");

        ConvocatoriaOBJ convocatoriaOBJ=(ConvocatoriaOBJ)sesion.getAttribute("datosConv");
        String nombre;
        DiskFileUpload fu = new DiskFileUpload();
		FileItem archivoAdj=null;
		String itemDoc=null,idProp=null;
        cursor=new CursorDB();
        mensaje="";
        if(convocatoriaOBJ!=null){
        	InscripcionConvDB inscripcionConvDB=new InscripcionConvDB(cursor,usuario.getPerfil());
        	/*long id=0;
			try {
				id = inscripcionConvDB.getMaxId(null)+1;
			//	System.out.println("**********id="+id);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/

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
				            	if(item.getFieldName().equals("id"))
				            		itemDoc=item.getString();
				            	if(item.getFieldName().equals("idProp"))
				            		idProp=item.getString();
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
			if(itemDoc!=null){
				String path=req.getRealPath(req.getContextPath()).substring(0,req.getRealPath(req.getContextPath()).lastIndexOf(sep));
				String nombreArchivo=null;
				switch(Integer.parseInt(itemDoc)){
					case ParametrosOBJ.ArchivoCompleto:
						irA="/InscripcionConv/Cargar.jsp";
						nombre="Archivo"+"-"+"1-"+convocatoriaOBJ.getConvAno()+"-"+convocatoriaOBJ.getConvNumero()+"-"+"1";
						try {
							nombreArchivo=cargarDocumento.cargarGenerico(path,archivoAdj,"Propuestas",nombre,Long.parseLong(idProp));
							if(inscripcionConvDB.actArchivo(1,Long.parseLong(idProp),nombreArchivo))
			        			mensaje="Documento Cargado satisfactoriamente";
					        else
					        	mensaje="No se pudo completar la carga del Documento \nFavor volver a intentar";
					     } catch (Exception e) {
							// TODO Auto-generated catch block
							baseDB=new BaseDB(cursor,1);
							baseDB.lanzaExcepcion(e);
							mensaje="No se pudo completar la carga del Documento \nFavor volver a intentar";
						}
				        req.setAttribute("archivos",inscripcionConvDB.getInfoArchivos(""+idProp));
					break;
					case ParametrosOBJ.ArchivoAnexos:
						irA="/InscripcionConv/Cargar.jsp";
						nombre="Archivo"+"-"+"2-"+convocatoriaOBJ.getConvAno()+"-"+convocatoriaOBJ.getConvNumero()+"-"+"2";
						try {
							nombreArchivo=cargarDocumento.cargarGenerico(path,archivoAdj,"Propuestas",nombre,Long.parseLong(idProp));
							if(inscripcionConvDB.actArchivo(2,Long.parseLong(idProp),nombreArchivo))
			        			mensaje="Documento Cargado satisfactoriamente";
							else
					        	mensaje="No se pudo completar la carga del Documento \nFavor volver a intentar";

						} catch (Exception e) {
							// TODO Auto-generated catch block
							baseDB=new BaseDB(cursor,1);
							baseDB.lanzaExcepcion(e);
							mensaje="No se pudo completar la carga del Documento \nFavor volver a intentar";
						}
				        req.setAttribute("archivos",inscripcionConvDB.getInfoArchivos(""+idProp));
					break;
					//aval director
					case ParametrosOBJ.ArchivoAvalGrupo:
						irA="/InscripcionConv/Cargar.jsp";
						nombre="Archivo"+"-"+"3-"+convocatoriaOBJ.getConvAno()+"-"+convocatoriaOBJ.getConvNumero()+"-"+"3";
						try {
							nombreArchivo=cargarDocumento.cargarGenerico(path,archivoAdj,"Propuestas",nombre,Long.parseLong(idProp));
							if(inscripcionConvDB.actArchivo(3,Long.parseLong(idProp),nombreArchivo))
			        			mensaje="Documento Cargado satisfactoriamente";
							else
					        	mensaje="No se pudo completar la carga del Documento \nFavor volver a intentar";

						} catch (Exception e) {
							// TODO Auto-generated catch block
							baseDB=new BaseDB(cursor,1);
							baseDB.lanzaExcepcion(e);
							mensaje="No se pudo completar la carga del Documento \nFavor volver a intentar";
						}
				        req.setAttribute("archivos",inscripcionConvDB.getInfoArchivos(""+idProp));
					break;
					//aval director 
					case ParametrosOBJ.ArchivoDirector:
						irA="/InscripcionConv/Cargar.jsp";
						nombre="Archivo"+"-"+"4-"+convocatoriaOBJ.getConvAno()+"-"+convocatoriaOBJ.getConvNumero()+"-"+"4";
						try {
							nombreArchivo=cargarDocumento.cargarGenerico(path,archivoAdj,"Propuestas",nombre,Long.parseLong(idProp));
							if(inscripcionConvDB.actArchivo(4,Long.parseLong(idProp),nombreArchivo))
			        			mensaje="Documento Cargado satisfactoriamente";
							else
					        	mensaje="No se pudo completar la carga del Documento \nFavor volver a intentar";

						} catch (Exception e) {
							// TODO Auto-generated catch block
							baseDB=new BaseDB(cursor,1);
							baseDB.lanzaExcepcion(e);
							mensaje="No se pudo completar la carga del Documento \nFavor volver a intentar";
						}
				        req.setAttribute("archivos",inscripcionConvDB.getInfoArchivos(""+idProp));
					break;
					//aval curricular
					case ParametrosOBJ.ArchivoCurricular:
						irA="/InscripcionConv/Cargar.jsp";
						nombre="Archivo"+"-"+"5-"+convocatoriaOBJ.getConvAno()+"-"+convocatoriaOBJ.getConvNumero()+"-"+"5";
						try {
							nombreArchivo=cargarDocumento.cargarGenerico(path,archivoAdj,"Propuestas",nombre,Long.parseLong(idProp));
							if(inscripcionConvDB.actArchivo(5,Long.parseLong(idProp),nombreArchivo))
			        			mensaje="Documento Cargado satisfactoriamente";
							else
					        	mensaje="No se pudo completar la carga del Documento \nFavor volver a intentar";

						} catch (Exception e) {
							// TODO Auto-generated catch block
							baseDB=new BaseDB(cursor,1);
							baseDB.lanzaExcepcion(e);
							mensaje="No se pudo completar la carga del Documento \nFavor volver a intentar";
						}
				        req.setAttribute("archivos",inscripcionConvDB.getInfoArchivos(""+idProp));
					break;
				}
			}

        }else{
        	req.setAttribute("estado","Debe realizar una inscripción");
        	mensaje="No se pudo completar la inscripción.. \nPor favor vuelva a intentarlo";
        }
        sesion.removeAttribute("inscripcionConvOBJ");
        req.removeAttribute("listaRubrosOBJ");
        req.removeAttribute("listaRubrosOBJ1");
        retorno[0]="unir";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}



