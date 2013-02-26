package cidc.informes.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.evalPropuesta.db.EvalPropuestaDB;
import cidc.evalPropuesta.obj.ParametrosOBJ;
import cidc.evalPropuesta.obj.CapturaEvalOBJ;
import cidc.evalPrueba.db.EvalPruebaDB;
import cidc.evalPrueba.obj.Formulario;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;
import cidc.informes.db.InformesDB;
import cidc.informes.obj.CampoObj;
import cidc.informes.obj.ParametrosInformeObj;
import cidc.informes.obj.SQLObj;


public class AdminInformes extends ServletGeneral { 

	InformesDB informesDB=null;
	ParametrosInformeObj parametros=null;
	HttpSession sesion=null;
	
	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
		cursor=new CursorDB();
		sesion=req.getSession();
		String irA="";
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		informesDB=new InformesDB(cursor,usuario.getPerfil());
		parametros=new ParametrosInformeObj();
		int accion=0;

		irA="/Informes/ConfiguracionInforme.jsp";
		if(req.getParameter("accion")!=null)
			accion=Integer.parseInt(req.getParameter("accion"));

		retorno[0]="unir"; 
		switch(accion){
			case 1:/****** case encargado de validar las entidades seleccionadas y crear un String[] para pegarlo en el objeto ParametrosInforme*/				
				String tmpTablas="";
				if(req.getParameter("entidad1")!=null)
					tmpTablas=req.getParameter("entidad1");
				if(req.getParameter("entidad2")!=null)
					if(!tmpTablas.contains(req.getParameter("entidad2"))&& !req.getParameter("entidad2").equals("0"))
						tmpTablas+=","+req.getParameter("entidad2");
				if(req.getParameter("entidad3")!=null)
					if(!tmpTablas.contains(req.getParameter("entidad3"))&& !req.getParameter("entidad3").equals("0"))
						tmpTablas+=","+req.getParameter("entidad3");
				if(req.getParameter("entidad4")!=null)
					if(!tmpTablas.contains(req.getParameter("entidad4"))&& !req.getParameter("entidad4").equals("0"))
						tmpTablas+=","+req.getParameter("entidad4");
				if(tmpTablas.contains(","))
					parametros.setTablasSeleccionadas(tmpTablas.split(","));
				else if(tmpTablas.length()>0)
					parametros.setTablasSeleccionadas(new String[]{tmpTablas});
				
				if(parametros.getTablasSeleccionadas()!=null){
					sesion.setAttribute("parametrosInf", parametros);
					sesion.setAttribute("lstCamposTablas",informesDB.verCampos(parametros));
				}
			break;
			case 2:/******** Case encargado de enviar los datos cargados en los combos, cajas y check del formulario *****/
				sesion.removeAttribute("resultadoInforme");
				sesion.setAttribute("parametrosInf", informesDB.getNewObjParametros((ParametrosInformeObj)sesion.getAttribute("parametrosInf"),
								(List<CampoObj>)sesion.getAttribute("lstCamposTablas")));
				
				parametros=(ParametrosInformeObj)sesion.getAttribute("parametrosInf");
				informesDB.CrearSql(parametros);
				sesion.setAttribute("resultadoInforme", informesDB.getInforme(parametros));
				sesion.removeAttribute("sql");
				irA="/Informes/ResultadoConsulta.jsp";
			break;
			case 3: /** case para cuando se desee ejecutar una SQL nueva digitada desde la interfase****/
				consultasPersonalizadas(req.getParameter("sql"));
				req.setAttribute("msmExcepcion", informesDB.getMensaje());
				req.setAttribute("sql", req.getParameter("sql"));
				
				irA="/Informes/ResultadoConsulta.jsp";
			break;
			case 4:
				if(informesDB.insertaSQL((SQLObj)sesion.getAttribute("sentenciaSql")))
					mensaje="Sentencia SQL almacenada Satisfactoriamente";
				else
					mensaje="La sentencia no ha sido almacenada satisfactoriamente";
				irA="/Informes/ResultadoConsulta.jsp";
			break;
			case 5:
				sesion.setAttribute("listaInformes", informesDB.consultaInformesSQL());
				irA="/Informes/ConsultaPersonalizada.jsp";
			break;
			case 6:
				consultasPersonalizadas(informesDB.getSql(req.getParameter("idInforme")));
				
				req.setAttribute("msmExcepcion", informesDB.getMensaje());
				irA="/Informes/ResultadoConsulta.jsp";
			break;
			/****enviar el listado de las tablas existentes en la base de datos (solo las asociadas al negocio) ***/
			default:
				sesion.setAttribute("lstTablas",informesDB.getListadoTablas());
				sesion.removeAttribute("lstCamposTablas");
				sesion.removeAttribute("parametrosInf");
				sesion.removeAttribute("resultadoInforme");
				mensaje="";
			break;
		}


		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
	

	
	public void consultasPersonalizadas(String sql){
		if(sql!=null){
			informesDB.analizaSQL(sql);
			parametros=informesDB.getParametros();
			sesion.setAttribute("parametrosInf", parametros);
			sesion.setAttribute("resultadoInforme", informesDB.getInforme(parametros));
		}
	}
}
