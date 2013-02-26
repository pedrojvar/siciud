package cidc.adminArticulos.servlet;

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

import cidc.adminArticulos.db.AdminArticuloDB;
import cidc.adminArticulos.obj.Articulo;
import cidc.adminArticulos.obj.FiltroArticulo;
import cidc.adminPropuestas.db.AdminPropuestaDB;
import cidc.adminArticulos.obj.Parametros;
import cidc.general.db.BaseDB;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.obj.CargarDocumento;
import cidc.general.servlet.ServletGeneral;

public class AdminArticulos extends ServletGeneral {

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
		cursor=new CursorDB();
		HttpSession sesion=req.getSession();
		String irA="/adminArticulos/NuevoArticulo.jsp";
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		AdminPropuestaDB adminPropuestaDB=new AdminPropuestaDB(cursor,usuario.getPerfil());
		AdminArticuloDB adminArticuloDB=new AdminArticuloDB(cursor,usuario.getPerfil());
		mensaje="";
		int accion=0;

		DiskFileUpload fu = new DiskFileUpload();
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(1024*1024);
		FileItem archivoAdj=null;
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
			            	if(item.getFieldName().equals("tipo"))
			            		articulo.setTipo(Integer.parseInt(item.getString()));
			            	if(!item.getString().equals("")){
				            	if(item.getFieldName().equals("facultad"))
				            		articulo.setFacultad(Integer.parseInt(item.getString()));
				            	if(item.getFieldName().equals("proyCur"))
				            		articulo.setProyCurr(Integer.parseInt(item.getString()));
				            	if(item.getFieldName().equals("grupo"))
				            		articulo.setGrupoInvest(Integer.parseInt(item.getString()));
			            	}
			            	if(item.getFieldName().equals("tituloArticulo"))
			            		articulo.setTituloArticulo(item.getString());
			            	if(item.getFieldName().equals("presentador"))
			            		articulo.setPresentador(item.getString());
			            	if(item.getFieldName().equals("autores"))
			            		articulo.setAutores(item.getString());
			            	if(item.getFieldName().equals("direccionPostal"))
			            		articulo.setDireccionPostal(item.getString());
			            	if(item.getFieldName().equals("direccionElect"))
			            		articulo.setDireccionElect(item.getString());
			            	if(item.getFieldName().equals("palabClaves"))
			            		articulo.setPalabClaves(item.getString());
			            	if(item.getFieldName().equals("temaInteres"))
			            		articulo.setTemaInteres(item.getString());
			            	if(item.getFieldName().equals("tipoPresentacion"))
			            		articulo.setTipoPresentacion(Integer.parseInt(item.getString()));
			            	if(item.getFieldName().equals("universidad"))
			            		articulo.setUniversidad(item.getString());
			            	if(item.getFieldName().equals("resumen"))
			            		articulo.setResumen(item.getString());
			            }else{
			            	archivoAdj=item;
			            }
			        }
			        String path=req.getRealPath(req.getContextPath()).substring(0,req.getRealPath(req.getContextPath()).lastIndexOf(sep));
			        long id=adminArticuloDB.getIdArchivo()+1;
			        CargarDocumento cargaDoc=new CargarDocumento();
			        articulo.setArchivo(cargaDoc.cargar(path,archivoAdj,id,"Articulos","Articulo_"));
			        String nombre="Articulo"+id+archivoAdj.getName().substring(archivoAdj.getName().lastIndexOf("."),archivoAdj.getName().length());
			       if(adminArticuloDB.nuevoArticulo(articulo))
			        	mensaje="Art�culo almacenado correctamente";
			       else
			    	   mensaje="El art�culo no pudo ser almacenado";
		        }
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				baseDB=new BaseDB(cursor,1);
				baseDB.lanzaExcepcion(e);
				mensaje="El art�culo no pudo ser almacenado";
			} catch (Exception e) {
				baseDB=new BaseDB(cursor,1);
				baseDB.lanzaExcepcion(e);
				mensaje="El art�culo no pudo ser almacenado";
			}
		}else{
	//		System.out.println("entra al else valor="+req.getParameter("accion"));
			if(req.getParameter("accion")!=null)
				accion=Integer.parseInt(req.getParameter("accion"));
			switch(accion){
				case Parametros.cmdBuscarArticulos:
					irA="/adminArticulos/ListaArticulos.jsp";
				break;
				case Parametros.cmdFiltrarArticulos:
					FiltroArticulo filtro=(FiltroArticulo)sesion.getAttribute("filArticulo");
					req.setAttribute("listaAticulos",adminArticuloDB.getListaArticulos(filtro));
					req.setAttribute("tipo",""+filtro.getTipo());
					sesion.removeAttribute("filArticulo");
					irA="/adminArticulos/ListaArticulos.jsp";
				break;
				case Parametros.cmdEstadoArticulo:
					sesion.setAttribute("datosArticulo",adminArticuloDB.getInfoArticulo(req.getParameter("art")));
					irA="/adminArticulos/EstadoArticulo.jsp";
				break;
				case Parametros.cmdBuscaEvaluador:
					sesion.setAttribute("tipEval","5");
					irA="/adminPropuestas/AsignaEvaluador.jsp";
				break;
				case Parametros.cmdAsignaEvaluador:
					if(adminArticuloDB.asignaEvaluador(req.getParameter("idArtic"), req.getParameter("codEval"),2))
						mensaje="Evaluador asignado correctamente";
					else
						mensaje=adminArticuloDB.getMensaje();
					sesion.setAttribute("datosArticulo",adminArticuloDB.getInfoArticulo(req.getParameter("idArtic")));
					irA="/adminArticulos/EstadoArticulo.jsp";
				break;
				case Parametros.cmdRespuestaEval:
					if(adminArticuloDB.asignaRespuesta(req.getParameter("idArtic"),req.getParameter("resp"), req.getParameter("codEval")))
						mensaje="Resgistro modificado correctamente";
					else
						mensaje="El resgistro no pudo ser actualizado correctamente";
					sesion.setAttribute("datosArticulo",adminArticuloDB.getInfoArticulo(req.getParameter("idArtic")));
					irA="/adminArticulos/EstadoArticulo.jsp";
				break;
				case Parametros.cmdCancelaEval:
					if(adminArticuloDB.cancelaEval(req.getParameter("idArtic"), req.getParameter("codEval")))
						mensaje="Resgistro modificado correctamente";
					else
						mensaje="El resgistro no pudo ser actualizado correctamente";
					sesion.setAttribute("datosArticulo",adminArticuloDB.getInfoArticulo(req.getParameter("idArtic")));
					irA="/adminArticulos/EstadoArticulo.jsp";
				break;
				case Parametros.cmdMailPsw:
					if(adminArticuloDB.crearLoginPsw(req.getParameter("idArtic")))
						mensaje="Resgistro modificado correctamente";
					else
						mensaje="El resgistro no pudo ser actualizado correctamente";
					sesion.setAttribute("datosArticulo",adminArticuloDB.getInfoArticulo(req.getParameter("idArtic")));
					irA="/adminArticulos/EstadoArticulo.jsp";
				break;
				case Parametros.cmdEntregaDocs:
					System.out.println("aa");
					if(adminArticuloDB.entregaDocs(req.getParameter("idArtic")))
						mensaje="Resgistro modificado correctamente";
					else
						mensaje="El resgistro no pudo ser actualizado correctamente";
					sesion.setAttribute("datosArticulo",adminArticuloDB.getInfoArticulo(req.getParameter("idArtic")));
					irA="/adminArticulos/EstadoArticulo.jsp";
				break;
			}
		}
		switch(accion){
			case Parametros.cmdNuevoArticulo:
				irA="/adminArticulos/NuevoArticulo.jsp";
				sesion.removeAttribute("ajaxGrupos");
				sesion.removeAttribute("ajaxProyCur");
			break;
		}
		accion=0;
		retorno[0]="desviar";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}
