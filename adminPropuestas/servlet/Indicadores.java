package cidc.publico.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;
import cidc.inscripSistema.db.InscripcionSisDB;
import cidc.inscripSistema.obj.Persona;
import cidc.inscripSistema.obj.ParametrosOBJ;

public class Indicadores extends ServletGeneral {

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
		cursor=new CursorDB();
		String irA="/Indicadores/Torta.html";
		int accion=0;
		if(req.getParameter("accion")!=null)
			accion=Integer.parseInt(req.getParameter("accion"));
		HttpSession sesion=req.getSession();
		mensaje="";
	//	System.out.println("antes del switch");
		switch(accion){
			case 1:
				irA="/Indicadores/Columas1.html";
			break;
			case 2:
				irA="/Indicadores/Inicio1.jsp";
			break;
			case 3:
				irA="/Indicadores/Inicio2.jsp";
			break;
			case 4:
				irA="/Indicadores/EvolucionGruposInvestigacion.jsp";
			break;
			case 5:
				irA="/Indicadores/DistribucionGruposInvestigacionFacultad.jsp";
			break;
			case 6:
				irA="/Indicadores/DistribucionGrupos.jsp";
			break;
			case 7:
				irA="/Indicadores/NuevaDistribucion.jsp";
			break;
			case 8:
				irA="/Indicadores/EvolucionProyectosInvestigacion.jsp";
			break;
			case 9:
				irA="/Indicadores/PorcentajeParticipacionPI.jsp";
			break;
			case 10:
				irA="/Indicadores/DistribucionCofinanciacion.jsp";
			break;
			case 11:
				irA="/Indicadores/EvolucionSemillerosInvestigacion.jsp";
			break;

			case 12:
				irA="/Indicadores/PorcentajeParticipacionSI.jsp";
			break;
			case 13:
				irA="/Indicadores/TotalInvestigadoresFacultad.jsp";
			break;
			case 14:
				irA="/Indicadores/TotalInvestigadoresGenero.jsp";
			break;
			case 15:
				irA="/Indicadores/PorcentajeFormacionDocentes.jsp";
			break;
			case 16:
				irA="/Indicadores/Produccion.jsp";
			break;
			case 17:
				irA="/Indicadores/ProduccionPorFacultad.jsp";
			break;
			case 18:
				irA="/Indicadores/MovilidadDocentes.jsp";
			break;
			case 19:
				irA="/Indicadores/ComparacionInversionPresupuesto.jsp";
			break;
			case 20:
				irA="/Indicadores/InversionACTI_tipo.jsp";
			break;
			case 21:
				irA="/Indicadores/InversionACTI1.jsp";
			break;
			case 22:
				irA="/Indicadores/TrabajoFuturo.jsp";
			break;
		}
		accion=0;
		retorno[0]="desviar";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}
