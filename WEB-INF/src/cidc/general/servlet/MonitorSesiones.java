package cidc.general.servlet;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Servlet Class
 *
 * @web.servlet              name="MonitorSesiones"
 *                           display-name="Name for MonitorSesiones"
 *                           description="Description for MonitorSesiones"
 * @web.servlet-mapping      url-pattern="/MonitorSesiones"
 * @web.servlet-init-param   name="A parameter"
 *                           value="A value"
 */
public class MonitorSesiones extends ServletGeneral implements HttpSessionListener {
	HttpSession sesion=null;
	public void sessionCreated(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
//		System.out.println("Se crea la session " + new Date());
	}

	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
//		System.out.println("Se Termina la session " + new Date());
	}
}
