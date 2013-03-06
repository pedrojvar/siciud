package cidc.certificaciones.servlet;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.adminArticulos.obj.Parametros;
import cidc.certificaciones.db.CertificadoDB;
import cidc.certificaciones.obj.CertificacionesOBJ;
import cidc.convMovilidad.obj.InfoGeneral;
import cidc.general.db.CursorDB;
import cidc.general.db.UsuarioDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;
import cidc.inscripSistema.obj.Persona;

public class AdminCertificados extends ServletGeneral{
	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		//context=config.getServletContext();
		int accion=0;	
		mensaje="Hola";
		System.out.println(mensaje);
		cursor=new CursorDB();
		HttpSession sesion=req.getSession();
		Persona persona=(Persona)sesion.getAttribute("persona");
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		UsuarioDB usuarioDB=new UsuarioDB(cursor,usuario.getPerfil());		
		CertificacionesOBJ certificado=(CertificacionesOBJ)sesion.getAttribute("certificado");		
		CertificadoDB certificadodb=new CertificadoDB(cursor,usuario.getPerfil()); 
		if(req.getParameter("accion")!=null)
			accion=Integer.parseInt(req.getParameter("accion"));
		else
			accion=5;
	
		String irA="/Certificados/GenerarCertificado.jsp";
		switch(accion){
		case 4:
			System.out.println("ID PERSONA --->"+usuario.getIdUsuario());
			persona=usuarioDB.getPersona(usuario.getIdUsuario());
			sesion.setAttribute("persona",persona);
			long personaid= persona.getIdPersona();
			System.out.println(personaid);
			persona.setEstado(true);
			sesion.setAttribute("persona",persona);
			sesion.setAttribute("listacertificados",certificadodb.buscarCertificadosPersona(personaid));
			irA="/Certificados/GenerarCertificado.jsp";
			mensaje="Case Pertenencia a Grupo";
			System.out.println(mensaje);
		break;
		case 2:
			sesion.setAttribute("persona",persona);
			irA="/Certificados/GenerarCertificado.jsp";
			mensaje="Case Paz y Salvo";
			System.out.println(mensaje);
		break;
		case 3:
			sesion.setAttribute("persona",persona);
			irA="/Certificados/GenerarCertificado.jsp";
			mensaje="Case Actividades de Investigación";
			System.out.println(mensaje);
		break;		
		case 1:
			sesion.setAttribute("persona",persona);
			irA="/certificaciones/CertificadosDoc.x?accion=1&accion2="+persona.getIdPersona();
			mensaje="Hizo el mapeo del Certificado";	
			System.out.println(irA);
		break;
		case 5:
			System.out.println("caso 05 --->");
			persona=usuarioDB.getPersona(usuario.getIdUsuario());
			sesion.setAttribute("persona",persona);
			personaid= persona.getIdPersona();
			System.out.println(personaid);
			persona.setEstado(true);
			sesion.setAttribute("persona",persona);
			irA="/Certificados/BuscarCertificados.jsp";
			mensaje="Busqueda de Certificados";			
		break;
		case 6:			
			persona=usuarioDB.getPersona(usuario.getIdUsuario());
			sesion.setAttribute("persona",persona);
			personaid= persona.getIdPersona();
			String cedula=req.getParameter("cedula");
			String cod_ver=req.getParameter("cod_verificacion");
			System.out.println("CEDULA---->"+cedula+ " COD_VERIFICACIÓN--->"+cod_ver);
			sesion.setAttribute("listacertificados",certificadodb.buscarCertificados(cedula, cod_ver));
			System.out.println("Todo Bien");
			persona.setEstado(true);
			sesion.setAttribute("persona",persona);
			irA="/Certificados/BuscarCertificados.jsp";
			mensaje="Busqueda de Certificados";			
		break;
		case 7:			
			persona=usuarioDB.getPersona(usuario.getIdUsuario());
			sesion.setAttribute("persona",persona);
			personaid= persona.getIdPersona();			
			System.out.println("Mostrar el .pdf");
			persona.setEstado(true);
			sesion.setAttribute("persona",persona);
			irA="/Certificados/BuscarCertificados.jsp";
			mensaje="Busqueda de Certificados";			
		break;
		}
		accion=0;
		retorno[0]="";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;	
	}

}
