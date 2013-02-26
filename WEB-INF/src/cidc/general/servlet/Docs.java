package cidc.general.servlet;

import javax.servlet.http.HttpServlet;

import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Class
 *
 * @web.servlet              name="Docs"
 *                           display-name="Name for Docs"
 *                           description="Description for Docs"
 * @web.servlet-mapping      url-pattern="/Docs"
 * @web.servlet-init-param   name="A parameter"
 *                           value="A value"
 */
public class Docs extends HttpServlet {
	String nombreDoc="";
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException,
		IOException {
		try
		{
			char sep=java.io.File.separatorChar;
			String url = request.getParameter("ruta");
			String path=request.getRealPath(request.getContextPath()).substring(0,request.getRealPath(request.getContextPath()).lastIndexOf(sep));
			if(url==null ||url.trim().equals("")){
		    	response.sendRedirect("Documentos.jsp");
		    }else{
				url=url.replace("/",""+sep);
			    int tipo=Integer.parseInt(request.getParameter("tipo"));
			    FileInputStream archivo = new FileInputStream(path+url);
			    int longitud = archivo.available();
			    byte[] datos = new byte[longitud];
			    archivo.read(datos);
			    nombreDoc=url.substring(url.lastIndexOf(sep)+1,url.length());
			    response.setHeader("Content-Disposition","attachment;filename="+nombreDoc);
			    switch(tipo){
				case 1: response.setContentType("application/word");break;
				case 2: response.setContentType("application/excel");break;
				case 3: response.setContentType("application/pdf");break;
				}

			//	response.flushBuffer();
				response.getOutputStream().write(datos);
				response.getOutputStream().flush();
				archivo.close();
//				pw.print(datos);
//				pw.flush();
//				pw.close();
//			    ServletOutputStream ouputStream = response.getOutputStream();
//			    ouputStream.write(datos);
//			    ouputStream.flush();
//			    ouputStream.close();


		    }
		}
		catch(Exception e)
		{e.printStackTrace();}
	}

}
