package cidc.indicadores.fichasIndicadores.servlet;

import javax.servlet.http.HttpServlet;

import java.io.IOException;
import java.util.ResourceBundle;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
//import cidc.general.pdf.FichaIndicadoresPDF;
import cidc.indicadores.bancoVariables.db.BancoVariablesDB;
import cidc.indicadores.fichasIndicadores.db.FichaIndicadoresDB;

/**
 * Servlet Class
 *
 * @web.servlet              name="GeneraPDF"
 *                           display-name="Name for GeneraPDF"
 *                           description="Description for GeneraPDF"
 * @web.servlet-mapping      url-pattern="/GeneraPDF"
 * @web.servlet-init-param   name="A parameter"
 *                           value="A value"
 */
public class GeneraPDF extends HttpServlet
{
	public static ResourceBundle rb=null;

	public ServletContext context=null;
	public ServletConfig config=null;
	public static char sep = java.io.File.separatorChar;

	public GeneraPDF()
	{
		// TODO Auto-generated constructor stub
		rb=ResourceBundle.getBundle("cidc.general.conect");
		rb=ResourceBundle.getBundle("cidc.general.pdf.pdfFichaIndicadores");

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{

	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)	throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		CursorDB cursor=new CursorDB();
        FichaIndicadoresDB objFichaDB = new FichaIndicadoresDB(cursor, 2);
        int bandera = 0;
        String mensaje = "";

        if(req.getParameter("accion")!= null)
            bandera = Integer.parseInt(req.getParameter("accion"));
        switch (bandera)
        {
            case 1:
/*            	FichaIndicadoresPDF objPDF = new FichaIndicadoresPDF();
                String path=req.getRealPath(req.getContextPath()).substring(0,req.getRealPath(req.getContextPath()).lastIndexOf(sep));
                if(objPDF.GenerarFicha(objFichaDB.consultaInfoFicha(req.getParameter("idind")), path, resp))
                {
                    mensaje = "Indicado creado Correctamente";
                }
                else
                {
                    mensaje = "El Indicador no se pudo crear, por favor vuelva a intentar";
                }*/
            break;
        }
	}
}
