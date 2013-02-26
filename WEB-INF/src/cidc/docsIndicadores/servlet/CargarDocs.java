package cidc.docsIndicadores.servlet;

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

import cidc.docsIndicadores.db.DocsIndicadoresDB;
import cidc.docsIndicadores.obj.InfoDocumentos;
import cidc.docsIndicadores.obj.InfoRAE;
import cidc.general.db.BaseDB;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.obj.CargarDocumento;
import cidc.general.servlet.ServletGeneral;

/**
 * Servlet Class
 *
 * @web.servlet              name="CargarDocs"
 *                           display-name="Name for CargarDocs"
 *                           description="Description for CargarDocs"
 * @web.servlet-mapping      url-pattern="/CargarDocs"
 * @web.servlet-init-param   name="A parameter"
 *                           value="A value"
 */
public class CargarDocs extends ServletGeneral
{

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		String irA="/Indicadores/doscIndicadores/AdminDocs.x";
		HttpSession sesion=req.getSession();
		cursor=new CursorDB();
		InfoDocumentos obj = (InfoDocumentos) sesion.getAttribute("informacion");
		InfoRAE objrae = (InfoRAE) sesion.getAttribute("rae");
		Usuario objusuario = (Usuario) sesion.getAttribute("loginUsuario");
		DocsIndicadoresDB obj1 = new DocsIndicadoresDB(cursor, 2);
        CargarDocumento cargarDocumento=new CargarDocumento();
        String nombre = "";
        String extension = "";
        DiskFileUpload fu = new DiskFileUpload();
		FileItem archivoAdj = null;
		FileItem imagenAdj = null;
		String itemDoc = null,idProp = null;
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
			            if(item.getFieldName().equals("archivo"))
			            {
			            	archivoAdj=item;
			            }
			            if(obj.getCategoria()==3)
			            {
			            	if(item.getFieldName().equals("imagen"))
				            {
				            	imagenAdj=item;
				            }
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

        String path=req.getRealPath(req.getContextPath()).substring(0,req.getRealPath(req.getContextPath()).lastIndexOf(sep));
		String nombreArchivo = null;
        String nombreImagen = null;
		irA="/Indicadores/docsIndicadores/InfoDoc.jsp";

		if(obj.getCategoria() == 1)
		{
			if(obj.getTipo()==1)
			{
				nombre = "Lib_Nal_";
			}
			if(obj.getTipo()==2)
			{
				nombre = "Lib_Internal_";
			}
		}
		if(obj.getCategoria()==2)
		{
			nombre = "Articulos_";
		}

		if(obj.getCategoria()==3)
		{
			nombre="Doc_";
			if(obj.getTipo()==1)
			{
				nombre = "Doc_Ent_";
			}
			if(obj.getTipo()==2)
			{
				nombre = "Doc_Pro_";
			}
			if(obj.getTipo()==3)
			{
				nombre = "Doc_Sal_";
			}
		}

		if(obj.getCategoria()==4)
		{
			if(obj.getTipo()==1)
			{
				nombre = "Pre_Plana_";
			}
			if(obj.getTipo()==2)
			{
				nombre = "Pre_AmChart_";
			}
		}

		if(obj.getCategoria()==5)
		{
			nombre = "Politica_";
		}

		if(obj.getCategoria()==6)
		{
			nombre = "Regla_";
		}

		if(obj.getCategoria()==7)
		{
			nombre = "Xmind_";
		}
		if(obj.getCategoria()==8)
		{
			nombre = "Borrador_";
		}
		try
		{
			nombreArchivo = cargarDocumento.cargarGenerico(path,archivoAdj,"/DocsIndicadores",nombre,obj1.ultimoDocumento());
			if(obj.getCategoria()==3)
            {
				nombreImagen = cargarDocumento.cargarGenerico(path,imagenAdj,"/DocsIndicadores","Imagen",obj1.ultimoDocumento());
				extension = (nombreImagen.substring(nombreImagen.lastIndexOf(".")+1,nombreImagen.length()));
				nombreImagen = "Imagen" + obj1.ultimoDocumento() + "." + extension;
			}

		}
		catch(Exception e)
		{
			baseDB=new BaseDB(cursor,1);
			baseDB.lanzaExcepcion(e);
			mensaje="No se pudo completar la carga del Documento \nFavor volver a intentar";
		}

		extension = (nombreArchivo.substring(nombreArchivo.lastIndexOf(".")+1,nombreArchivo.length()));
		int ext = 0;
		if(extension.equals("pdf"))
		{
			ext = 1;
		}
		if(extension.equals("xls") || extension.equals("xlsx"))
		{
			ext = 2;
		}
		if(extension.equals("ppt") || extension.equals("pptx"))
		{
			ext = 3;
		}
		if(extension.equals("doc") || extension.equals("docx"))
		{
			ext = 4;
		}
		if(extension.equals("xmind"))
		{
			ext = 5;
		}

		obj.setTipodoc(ext);
		obj.setNombre(nombreArchivo);
		obj.setImagen(nombreImagen);
		obj.setUsuario(objusuario.getIdUsuario());

		obj1.insertaDocumento(obj);

		int iddoc = obj1.consultaIddoc((String)obj.getNombre(), obj.getTipodoc());
		if(obj1.insertaRAE(objrae, iddoc) && obj1.enviarMail(obj, objusuario.getNombre()))
		{
			mensaje="Documento Cargado satisfactoriamente";
		}
		else
		{
			mensaje="No se pudo completar la carga del Documento \nFavor volver a intentar";
		}

	    sesion.removeAttribute("informacion");
	    sesion.removeAttribute("rae");
        retorno[0]="unir";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}