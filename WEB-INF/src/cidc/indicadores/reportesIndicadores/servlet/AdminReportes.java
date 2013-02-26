package cidc.indicadores.reportesIndicadores.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.indicadores.bancoVariables.db.BancoVariablesDB;
import cidc.indicadores.fichasIndicadores.db.FichaIndicadoresDB;
import cidc.indicadores.fichasIndicadores.obj.FichaIndicadores;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.obj.Calculadora;
import cidc.general.obj.Graficas;
//import cidc.general.pdf.FichaIndicadoresPDF;
import cidc.general.servlet.ServletGeneral;

/**
 * Servlet Class
 *
 * @web.servlet              name="AdminReportes"
 *                           display-name="Name for AdminReportes"
 *                           description="Description for AdminReportes"
 * @web.servlet-mapping      url-pattern="/AdminReportes"
 * @web.servlet-init-param   name="A parameter"
 *                           value="A value"
 */
public class AdminReportes extends ServletGeneral  {

    public static char sep = java.io.File.separatorChar;

    public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
        context=config.getServletContext();
        cursor=new CursorDB();
        HttpSession sesion=req.getSession();
        FichaIndicadoresDB objFichaDB = new FichaIndicadoresDB(cursor, 2);
        BancoVariablesDB objVariableDB = new BancoVariablesDB(cursor, 2);
        Calculadora objCalculadora = new Calculadora();
        Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
        int bandera = 0;
        mensaje = "";
        String irA="/GestionIndicadores/CrearFicha.jsp";

        if(req.getParameter("accion")!= null)
            bandera = Integer.parseInt(req.getParameter("accion"));
        switch (bandera)
        {
            case 1:
                req.setAttribute("listaFiltroFicha", objFichaDB.consultaListaFichas());
                irA = "/ReportesIndicadores/ListaFichasReporte.jsp";

            break;

            case 2:
                String idreporte = req.getParameter("idind");
                String grafica = req.getParameter("grafica");
                Graficas objGrafico = new Graficas();
                FichaIndicadores objFichaReporte = (FichaIndicadores) objFichaDB.variablesReporte(idreporte);
                String v[];
                String tg[];
                v = objFichaReporte.getVariablestexto().split(",");
                tg = objFichaReporte.getTipograficatexto().split(",");
                String datos[] = objVariableDB.llenarVariables(v);

                String path_tortas=req.getRealPath(req.getContextPath()).substring(0,req.getRealPath(req.getContextPath()).lastIndexOf(sep));
                path_tortas = path_tortas+sep+"ReportesIndicadores"+ sep + "GraficosTortas" + sep + "Datos";

                String path_donuts=req.getRealPath(req.getContextPath()).substring(0,req.getRealPath(req.getContextPath()).lastIndexOf(sep));
                path_donuts = path_donuts+sep+"ReportesIndicadores"+ sep + "GraficosDonuts" + sep + "Datos";

                String path_columnas=req.getRealPath(req.getContextPath()).substring(0,req.getRealPath(req.getContextPath()).lastIndexOf(sep));
                path_columnas = path_columnas+sep+"ReportesIndicadores"+ sep + "GraficosColumnas" + sep + "Datos";

                objGrafico.tortas(v, datos, path_tortas , grafica);
                objGrafico.donuts(v, datos, path_donuts, grafica);
                objGrafico.columnas(v, datos, path_columnas, grafica);

                sesion.setAttribute("nombreGrafica", grafica + ".xml");
                sesion.setAttribute("lista", objVariableDB.llenarDatosReporte(v));

                objFichaReporte = objFichaDB.consultaInfoFicha(idreporte);
                sesion.setAttribute("info", objFichaReporte);

                String respuesta = objCalculadora.operarFormula(objFichaReporte.getFormula());
                if(respuesta.equals("error"))
                {
                	mensaje = "Existe un error de sintaxis en la f�rmula, no se puede operar.";
                	sesion.setAttribute("respuesta", "ERROR DE SINTAXIS");
                }
                else
                {
                	sesion.setAttribute("respuesta", objCalculadora.operarFormula(objFichaReporte.getFormula()));
                }


                irA="/ReportesIndicadores/ReporteColumnasH.jsp";

            break;

            default:

                irA="/Indicadores/docsIndicadores/InfoDoc.jsp";
            break;
        }

        retorno[0]="desviar";
        retorno[1]=irA;
        retorno[2]=mensaje;
        return retorno;
    }
}