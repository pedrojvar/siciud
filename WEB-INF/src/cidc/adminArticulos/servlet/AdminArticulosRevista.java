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
import cidc.adminArticulos.db.AdminArticuloRevistaDB;
import cidc.adminArticulos.obj.ArticRevista;
import cidc.adminArticulos.obj.Articulo;
import cidc.adminArticulos.obj.FiltroArticulo;
import cidc.adminPropuestas.db.AdminPropuestaDB;
import cidc.adminArticulos.obj.Parametros;
import cidc.general.db.BaseDB;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.obj.CargarDocumento;
import cidc.general.servlet.ServletGeneral;

public class AdminArticulosRevista extends ServletGeneral {

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
		cursor=new CursorDB();
		HttpSession sesion=req.getSession();
		String irA="/adminArticulos/NuevoArticulo.jsp";
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		AdminArticuloRevistaDB articuloRevistaDB=new AdminArticuloRevistaDB(cursor,usuario.getPerfil());
		mensaje="";
		int accion=0;
		FiltroArticulo filtro=null;
		DiskFileUpload fu = new DiskFileUpload();
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(1024*1024);
		FileItem archivoAdj=null;
		if (ServletFileUpload.isMultipartContent(req)){
			ArticRevista articulo=(ArticRevista)sesion.getAttribute("datoArticulo");
			List items=new ArrayList();
			try {
				items = fu.parseRequest(req);
		        FileItem item=null;
		        if(items.size()>0){
			        Iterator iter = items.iterator();
			        while (iter.hasNext()) {
			        	item = (FileItem) iter.next();
			        	if (!item.isFormField())
			        		archivoAdj=item;
			            break;
			        }
			        String path=req.getRealPath(req.getContextPath()).substring(0,req.getRealPath(req.getContextPath()).lastIndexOf(sep));
			        long id=articuloRevistaDB.getIdArchivo()+1;
			        CargarDocumento cargaDoc=new CargarDocumento();
			        articulo.setArchivo(cargaDoc.cargar(path,archivoAdj,id,"Articulos"+sep+"Revista","Articulo_"));
			     //   String nombre="Articulo"+id+archivoAdj.getName().substring(archivoAdj.getName().lastIndexOf("."),archivoAdj.getName().length());
			       if(articuloRevistaDB.nuevoArticuloRevista(articulo))
			        	mensaje="Artículo almacenado correctamente";
			       	 else
			    	    mensaje="El artículo no pudo ser almacenado";
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
		if(req.getParameter("accion")!=null)
			accion=Integer.parseInt(req.getParameter("accion"));
		filtro=(FiltroArticulo)sesion.getAttribute("filArticulo");
		ArticRevista art=(ArticRevista)sesion.getAttribute("datosArticulo");
		switch(accion){
			case Parametros.cmdNuevoArticulo:
				irA="/adminArticulos/NuevoArticulo.jsp";
				sesion.removeAttribute("ajaxGrupos");
				sesion.removeAttribute("ajaxInvestigador");
			break;
			case Parametros.cmdBuscarArticulos:
				switch(filtro.getTipo()){
					case Parametros.cmdBuscaRevista:
						req.setAttribute("listaArtic", articuloRevistaDB.getListaArticulosRevista(filtro));
						req.setAttribute("tipo",""+Parametros.cmdBuscaRevista);
						irA="/adminArticulos/ListaArticRevista.jsp";
					break;
					case Parametros.cmdBuscaEventos:
						switch(filtro.getEvento()){
						case Parametros.cmdEvenIberdiscap:
							req.setAttribute("listaArtic", articuloRevistaDB.getListaArticEvenIberdiscap());
							irA="/adminArticulos/ListaArticEvento.jsp";
						break;
						case Parametros.cmdEvenGruposSemilleros:
							req.setAttribute("listaArtic", articuloRevistaDB.getListaArticEvenGrupos());
							irA="/adminArticulos/ListaArticEvento.jsp";
						break;
						}
						req.setAttribute("tipo",""+Parametros.cmdBuscaEventos);
					break;
				}
			break;
			//estoy pendiente en la cosulta del estado del artículo dependiendo de el tipo de evento o revista
			case Parametros.cmdEstadoArticulo:

				//System.out.println("Evento ="+filtro.getTipo());
				sesion.setAttribute("datosArticulo",articuloRevistaDB.getInfoArticulo(req.getParameter("art"),filtro.getTipo(),filtro.getEvento(),filtro.getInterno()));
		//		System.out.println("/adminArticulos/EstadoArticulo"+filtro.getTipo()+".jsp");
				irA="/adminArticulos/EstadoArticulo"+filtro.getTipo()+".jsp";
			break;
			case Parametros.cmdAsignaEvaluador:
				if(articuloRevistaDB.asignaEvaluador(req.getParameter("idArtic"), req.getParameter("codEval"),1))
					mensaje="Evaluador asignado correctamente";
				else
					mensaje=articuloRevistaDB.getMensaje();
			//	sesion.setAttribute("datosArticulo",articuloRevistaDB.getInfoArticulo(req.getParameter("idArtic")));
				irA="/adminArticulos/EstadoArticulo.jsp";
			break;
			case Parametros.cmdBuscaEvaluador:
				irA="/adminArticulos/AsignaEvaluador.jsp";
			break;
			case Parametros.cmdRespuestaEval:
				if(articuloRevistaDB.asignaRespuesta(""+art.getIdArticulo(),req.getParameter("resp"), req.getParameter("codEval")))
					mensaje="Resgistro modificado correctamente";
				else
					mensaje="El resgistro no pudo ser actualizado correctamente";
				sesion.setAttribute("datosArticulo",articuloRevistaDB.getInfoArticulo(""+art.getIdArticulo(),filtro.getTipo(),filtro.getEvento(),filtro.getInterno()));
				irA="/adminArticulos/EstadoArticulo1.jsp";
			break;
			case Parametros.cmdCancelaEval:
				if(articuloRevistaDB.cancelaEval(""+art.getIdArticulo(), req.getParameter("codEval")))
					mensaje="Resgistro modificado correctamente";
				else
					mensaje="El resgistro no pudo ser actualizado correctamente";
				sesion.setAttribute("datosArticulo",articuloRevistaDB.getInfoArticulo(""+art.getIdArticulo(),filtro.getTipo(),filtro.getEvento(),filtro.getInterno()));
				irA="/adminArticulos/EstadoArticulo1.jsp";
			break;
			case Parametros.cmdEntregaDocs:
				if(articuloRevistaDB.entregaDocs(""+art.getIdArticulo()))
					mensaje="Resgistro modificado correctamente";
				else
					mensaje="El resgistro no pudo ser actualizado correctamente";
				sesion.setAttribute("datosArticulo",articuloRevistaDB.getInfoArticulo(""+art.getIdArticulo(),filtro.getTipo(),filtro.getEvento(),filtro.getInterno()));
				irA="/adminArticulos/EstadoArticulo1.jsp";
			break;
			default:
				irA="/adminArticulos/ListaArticRevista.jsp";
			break;
		}
		accion=0;
		retorno[0]="desviar";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}
