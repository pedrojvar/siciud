package cidc.general.obj;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;

public class CargarDocumento1 {

	private String nombreArchivo;
	private String extension;
	private int cantidadArchivos;

	public boolean cargar(HttpServletRequest req, String nombre, String carpeta){
		boolean retorno=true;
		try {
			DiskFileUpload fu = new DiskFileUpload();

	        // TAMAÑO MÁXIMO QUE SE PERMITE CARGAR AL PORTAL 10485 K o 10 M
	        fu.setSizeMax(10240*1024);
	        fu.setSizeThreshold(1024*512);
	        String sitio=req.getRealPath(req.getContextPath()).substring(0,req.getRealPath(req.getContextPath()).lastIndexOf("\\"));
	     // String sitio="/usr/local/jboss/server/default/deploy/siciud.war";


	        sitio=sitio+"\\Documentos\\"+carpeta+"\\";
	     //   sitio=sitio+"/Documentos/"+carpeta+"/";
	        fu.setRepositoryPath(sitio);

	        List fileItems = fu.parseRequest(req);

	        if(fileItems == null || fileItems.size()==0)
	        {
	        	System.out.println("no Se encontraron archivos para cargar");
	        	retorno=false;
	        }
	        else{
		        cantidadArchivos= fileItems.size();
		        Iterator i = fileItems.iterator();
		        FileItem actual = null;


		        while (i.hasNext())
		        {
		            actual = (FileItem)i.next();
		            nombreArchivo = actual.getName();
		            File fichero = new File(nombreArchivo);
		            nombreArchivo=nombre+nombreArchivo.substring(nombreArchivo.lastIndexOf("."),nombreArchivo.length());
		  //          System.out.println(nombreArchivo.substring(nombreArchivo.lastIndexOf(".")));
		            fichero = new  File(sitio + nombreArchivo);
		            // escribimos el fichero en el disco duro del servidor
		            actual.write(fichero);
		 //           System.out.println("Carga completa del Archivo --------->"+nombreArchivo);
		            break;
		        }
	        }
	    }
	    catch(Exception e){
	    	System.out.println("Falla la carga del Archivo");
	        e.printStackTrace();
	        retorno=false;
	    }
	    return retorno;
    }

	public String getNombreArchivo() {
		return nombreArchivo;
	}
	public void setNombreArchivo(String nombreArchivo) {
		this.nombreArchivo = nombreArchivo;
	}
}
