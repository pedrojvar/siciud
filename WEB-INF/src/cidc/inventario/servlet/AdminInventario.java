package cidc.inventario.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;
import cidc.inventario.db.InventarioDB;
import cidc.inventario.obj.Elemento;
import cidc.inventario.obj.ParametrosOBJ;

public class AdminInventario extends ServletGeneral {

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
		cursor=new CursorDB();
		String irA="/gruposInventario/ListaInventario.jsp";
		int accion=0,corte=0;
		if(req.getParameter("accion")!=null)
			accion=Integer.parseInt(req.getParameter("accion"));
		HttpSession sesion=req.getSession();
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		mensaje="";
		InventarioDB inventarioDB=new InventarioDB(cursor,usuario.getPerfil());

		switch(accion){
			//Crear nuevo elemento del inventario en el sistema.
			case ParametrosOBJ.cmdInsertaElemento:
				if(inventarioDB.insertaElementoGrupo((Elemento)sesion.getAttribute("NuevoELementoGrupo")))
					mensaje="Elemento Insertado Satisfactoriamente";
				else
					mensaje="El elemento no pudo ser insertado";
				irA="/gruposInventario/NuevoElementoGrupo.jsp";
			break;
			//Consulta el inventario por grupo y por proyecto de investigación
			case ParametrosOBJ.cmdConsultaInventarioGrupo:				
				sesion.setAttribute("listaPorProyecto", inventarioDB.listaElementosProyecto(req.getParameter("idGrupo")));
				sesion.setAttribute("listaPorGrupo", inventarioDB.listaElementosGrupo(req.getParameter("idGrupo")));				
			break;
			case ParametrosOBJ.cmdConsultaElemento:
				sesion.setAttribute("listaElementos", inventarioDB.buscarElemento((Elemento)sesion.getAttribute("NuevoELementoGrupo")));
				req.setAttribute("placa", req.getAttribute("placa"));
				req.setAttribute("nombre", req.getAttribute("nombre"));
				irA="/gruposInventario/FiltroElemento.jsp";
			break;
			default:
				irA="/gruposInventario/NuevoElementoGrupo.jsp";
			break;
		}
		accion=0;
		retorno[0]="desviar";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}
