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

public class ArticulosInvest extends ServletGeneral {

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
		cursor=new CursorDB();
		HttpSession sesion=req.getSession();
		String irA="/grupos/investigador/InscripArticulo.jsp";
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		GestionInvestDB gestionInvestDB=new GestionInvestDB(cursor,usuario.getPerfil());
	//	AdminArticuloDB adminArticuloDB=new AdminArticuloDB(cursor,usuario.getPerfil());
		mensaje="";
		int accion=0;
		DiskFileUpload fu = new DiskFileUpload();
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(1024*1024);
		FileItem archivoAdj=null;
		boolean flag=false;
		if (ServletFileUpload.isMultipartContent(req)){
			Articulo articulo=new Articulo();
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
			            	if(accion==2){
			            		flag=true;
			            		break;
			            	}else{
			            	if(!item.getString().equals("")){
				            	if(item.getFieldName().equals("tema"))
				            		articulo.setTema(Integer.parseInt(item.getString()));
			            	}
			            	if(item.getFieldName().equals("titulo"))
			            		articulo.setTituloArticulo(item.getString());
			            	if(item.getFieldName().equals("presentador"))
			            		articulo.setPresentador(item.getString());
			            	if(item.getFieldName().equals("para"))
			            		articulo.setPara(Integer.parseInt(item.getString()));
			            	if(item.getFieldName().equals("tipoPre"))
			            		articulo.setTipoPre(Integer.parseInt(item.getString()));
			            	if(item.getFieldName().equals("autores"))
			            		articulo.setAutores(item.getString());
			            	if(item.getFieldName().equals("palabClaves"))
			            		articulo.setPalabClaves(item.getString());
			            	}
			            }else{
			            	archivoAdj=item;
			            }
			        }
			        if(flag){
			        	if(gestionInvestDB.participacion(usuario.getIdUsuario()))
			        		mensaje="Participación registrada satisfactoriamente";
					       else
					    	mensaje=""+gestionInvestDB.getMensaje();
			        }else{
				        String path=req.getRealPath(req.getContextPath()).substring(0,req.getRealPath(req.getContextPath()).lastIndexOf(sep));
				        long id=gestionInvestDB.getIdArchivo()+1;
				        CargarDocumento cargaDoc=new CargarDocumento();
				        articulo.setArchivo(cargaDoc.cargar(path,archivoAdj,id,"Articulos"+sep+"Evento","Articulo_"));
				       if(gestionInvestDB.nuevoArticulo(articulo))
				        	mensaje="Artículo almacenado correctamente";
				       else
				    	   mensaje="El artículo no pudo ser almacenado";
				    }
		        }
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				baseDB=new BaseDB(cursor,1);
				baseDB.lanzaExcepcion(e);
				mensaje="El artículo no pudo ser almacenado";
			} catch (Exception e) {
				baseDB=new BaseDB(cursor,1);
				baseDB.lanzaExcepcion(e);
				mensaje="El artículo no pudo ser almacenado";
			}
		}
		accion=0;
		retorno[0]="desviar";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}
