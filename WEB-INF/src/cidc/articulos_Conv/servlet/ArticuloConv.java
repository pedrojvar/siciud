package cidc.articulos_Conv.servlet;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.articulos_Conv.db.ArticuloConvBD;
import cidc.articulos_Conv.obj.InfoGeneral;
import cidc.convMovilidad.obj.Parametros;
import cidc.convMovilidad.obj.Requisitos;
import cidc.general.db.CursorDB;
import cidc.general.db.UsuarioDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;
import cidc.inscripSistema.obj.Persona;

public class ArticuloConv extends ServletGeneral {

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
		cursor=new CursorDB();
		HttpSession sesion=req.getSession();
		String irA="/Articulos_Conv/InfoGeneral.jsp";
		Persona persona=(Persona)sesion.getAttribute("persona");
	//	UsuarioDB usuarioDB=new UsuarioDB(cursor,2);

		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		ArticuloConvBD articuloDB=new ArticuloConvBD(cursor,2);
		InfoGeneral info=null;
		mensaje=null;
		int accion=0;
		if(req.getParameter("accion")!=null)
			accion=Integer.parseInt(req.getParameter("accion"));

		System.out.println("Ingreso al servlet Articulos Accion:------>"+ accion);
		retorno[0]="unir";
		

		switch(accion){
			case Parametros.insercion:
				info=(InfoGeneral)sesion.getAttribute("articulosconv");
				info.setIdPersona(persona.getIdPersona());				
				info.setGrupo(persona.getIdGrupo());
				System.out.println("Valor de IdGrupo ---->"+persona.getIdGrupo());
				if(info.getIdPropuesta()==0){
					if(articuloDB.insertaPropuesta(info)){
						mensaje="Registro insertado correctamente, favor continuar la inscripción, cargando los documentos soporte de la convocatoria";
						//actualizo
						sesion.setAttribute("articulosconv", articuloDB.consultaIndividual(articuloDB.getConsec()));						
						irA="/Articulos_Conv/Cargar.jsp";
					}
					else{
						mensaje="No pudo ser registrada la propuesta\nFavor volver a intentar";
						req.setAttribute("listaMovilidad", articuloDB.consultaLista(persona.getIdPersona()));
						irA="/convMovilidad/listaPropuestas.jsp";
					}					
				}/*else{
					if(articuloDB.actualizarPropuesta(info)){
						mensaje="Registro actualizado correctamente.";
						//actualizo						
						irA="/convMovilidad/Insercion.jsp";
					}
					else{
						mensaje="No pudo ser actualziar la propuesta\nFavor volver a intentar";
						irA="/convMovilidad/Insercion.jsp";
					}
				}*/
				persona.setEstado(true);
				sesion.setAttribute("persona",persona);				
			break;
			case Parametros.consultaLista:
				System.out.println("Consulta los artículos incritos hasta el momento------>");
				if(persona!=null){
					System.out.println("Dentro del if para Convocatoria Articulos------>");
					req.setAttribute("listaArticulos", articuloDB.consultaLista(persona.getIdPersona()));
					irA="/Articulos_Conv/listaPropuestas.jsp";
				}
				else{
					mensaje="Usuario no valido";
					irA="/InscripcionConv/VistaPreliminar.jsp";
				}
				sesion.removeAttribute("movilidad");
			break;
		/*	case Parametros.consultaIndividual:
				sesion.removeAttribute("movilidad");
				sesion.removeAttribute("requisitos");
				sesion.setAttribute("movilidad", movilidadDB.consultaIndividual(req.getParameter("id")));
				if(req.getParameter("estado").equals("1")){
					irA="/convMovilidad/agenda.jsp";
					sesion.setAttribute("idPropuesta", movilidadDB.consultaIndividual(req.getParameter("id")));
					sesion.setAttribute("estado", req.getParameter("estado"));
				}
				else{
					irA="/convMovilidad/Cargar.jsp";
					sesion.setAttribute("idPropuesta", movilidadDB.consultaIndividual(req.getParameter("id")));
					sesion.setAttribute("estado", req.getParameter("estado"));
				}
			break;*/
			case Parametros.enviaMail:
				//System.out.println("Inicia envio de mail soporte movilidad para ="+req.getParameter("id"));
				if(articuloDB.enviarMail(req.getParameter("id"),persona))
					mensaje="Mensaje enviado satisfactoriamente";
				else
					mensaje="El mensaje no pudo ser enviado";
				////System.out.println("Termina proceso de envio de mail movilidad");
				req.setAttribute("listaMovilidad", articuloDB.consultaLista(persona.getIdPersona()));
				////System.out.println("Termina consulta de propuestas por persona");
				//req.setAttribute("habilitado", movilidadDB.grupoHabilitado(persona));
				req.setAttribute("habilitadoMsm", articuloDB.getMensaje());
				irA="/convMovilidad/listaPropuestas.jsp";
			break;
			case Parametros.ActializarPaso1:
				//EN ESTE CASE SE CONSULTA LA INFORMACIÓN GENERAL DE LA PROPUESTA DE MOVILIDAD
				System.out.println("Paso 01");
				info=(InfoGeneral)sesion.getAttribute("movilidad");
				if(req.getParameter("id")!=null)
					sesion.setAttribute("movilidad", articuloDB.consultaIndividual(req.getParameter("id")));
				
				irA="/convMovilidad/Insercion.jsp";
			break;
			case Parametros.ActializarPaso3:
				irA="/convMovilidad/Cargar.jsp";
				System.out.println("Paso 03");
			break;
			default:
				//System.out.println("entra al default de admin movilidad");
			break;
			
		}
		accion=0;
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}
