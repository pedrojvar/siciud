package cidc.cuentasUsuario.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.cuentasUsuario.obj.DatosCuenta;
import cidc.cuentasUsuario.obj.FiltroCuentas;
import cidc.cuentasUsuario.obj.Parametros;
import cidc.cuentasUsuario.db.CuentasUsuDB;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;

public class AdminCuentasUsuario extends ServletGeneral {

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
		cursor=new CursorDB();
		HttpSession sesion=req.getSession();
		String irA="/AdminUsuarios/CClaveUsuario.jsp";
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		int accion=0;
	//		System.out.println("entra al else valor="+req.getParameter("accion"));
		if(req.getParameter("accion")!=null)
			accion=Integer.parseInt(req.getParameter("accion"));
		mensaje="";
		CuentasUsuDB cuenta=new CuentasUsuDB(cursor,usuario.getPerfil());
		//System.out.println("perfil es:"+usuario.getPerfil());
		if (usuario.getPerfil()==1){
			irA="/AdminUsuarios/listaCuentas.jsp";
			switch(accion){
				case Parametros.cmdListaCuentas:
					FiltroCuentas fil=(FiltroCuentas)sesion.getAttribute("filtroCuenta");
					if(fil!=null)
						req.setAttribute("listaCuentas",cuenta.buscarCuentas(fil)) ;
					sesion.removeAttribute("filtroCuenta");
				break;
				case Parametros.cmdVerCuenta:
					if(req.getParameter("id")!=null)
					req.setAttribute("infoCuenta", cuenta.getCuenta(Long.parseLong(req.getParameter("id"))));
					req.setAttribute("listaPerfiles", cuenta.getListaPerfiles());
					irA="/AdminUsuarios/VerCuenta.jsp";
				break;
				case Parametros.cmdActualizaCuenta:
					if(cuenta.actualizaCuenta((DatosCuenta)sesion.getAttribute("cambioCuenta")))
						mensaje="Cuenta actualizada satisfactoriamente";
					else
						mensaje="La cuenta no pudo ser actualizada";
					req.setAttribute("infoCuenta", cuenta.getCuenta(Long.parseLong(req.getParameter("id"))));
					irA="/AdminUsuarios/VerCuenta.jsp";
				break;
				case Parametros.cmdBorrarCuenta:
					if(cuenta.eliminaCuenta((DatosCuenta)sesion.getAttribute("cambioCuenta")))
						mensaje="Cuenta fue eliminada satisfactoriamente";
					else
						mensaje="La cuenta no pudo ser eliminada";
				break;
				case Parametros.cmdResetearClave:
					if(cuenta.resetearClave(req.getParameter("id")))
						mensaje="La clave fue reseteada satisfactoriamente";
					else
						mensaje="La clave no pudo ser reseteada";
					req.setAttribute("infoCuenta", cuenta.getCuenta(Long.parseLong(req.getParameter("id"))));
					irA="/AdminUsuarios/VerCuenta.jsp";
				break;
			}
		}else{
			switch(accion){
				case Parametros.cmdActualizaClave:
			//		System.out.println("Entra al case de cambio");
					if(cuenta.cambiaNickClave(usuario.getIdUsuario(),req.getParameter("nick"), req.getParameter("clave"))){
						mensaje="Registro modificado correctamente";
						usuario.setNick(req.getParameter("nick"));
						sesion.setAttribute("loginUsuario",usuario);
					}
					else
						mensaje="El registro no pudo ser actualizado";
				break;
				default:
			//	System.out.println("sistema entra");
				//	req.setAttribute("cuenta", cuenta.getCuenta(usuario.getIdUsuario()));
				break;
			}
		}

		accion=0;
		retorno[0]="desviar";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}
