package cidc.general.servlet;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cidc.general.inicio.CargaInicio;
import cidc.general.login.Usuario;

/**
 * Filter class
 *
 * @web.filter              name="Filtro2"
 *                          display-name="Name for Filtro2"
 *                          description="Description for Filtro2"
 * @web.filter-mapping      url-pattern="/Filtro2"
 * @web.filter-init-param   name="A parameter"
 *                          value="A value"
 */
public class Filtro2 implements Filter {

	private FilterConfig config=null;
	public ServletContext context=null;
	private Usuario user=null;
	private CargaInicio cargaInicio=null;
	private HttpSession sesion=null;
	private HttpServletRequest req=null;

	public Filtro2() {
		// TODO Auto-generated constructor stub
	}

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(
		ServletRequest request,
		ServletResponse response,
		FilterChain arg2) throws IOException, ServletException {
		// TODO Auto-generated method stub
		req=(HttpServletRequest)request;
		sesion=req.getSession();
		user=(Usuario)sesion.getAttribute("loginUsuario");

		for(int i=0;i<user.getRecursos().size();i++){

		}
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
