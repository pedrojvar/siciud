package cidc.resultados.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.general.servlet.ServletGeneral;
import cidc.resultados.db.ResultadosDB;
import cidc.resultados.obj.Parametros;

public class AdminResultados extends ServletGeneral {

	public String [] operaciones(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		context=config.getServletContext();
		cursor=new CursorDB();
		String irA="/ResultadosConv/ListaConv.jsp";
		int accion=0,corte=0;
		if(req.getParameter("accion")!=null)
			accion=Integer.parseInt(req.getParameter("accion"));
		HttpSession sesion=req.getSession();
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		mensaje="";
		ResultadosDB resultados=new ResultadosDB(cursor,usuario.getPerfil());

		switch(accion){
			case Parametros.cmdResMovilidad:
				corte=Integer.parseInt(req.getParameter("corte"));
				System.out.println("Ingreos al primero case");
				switch(corte){
					case 1:
						System.out.println("Caso 1");
						irA="/ResultadosConv/ListaCorte.jsp";
						if(req.getParameter("ano").contains("201")){ // se usa el contains para saber si la convocatoria es superior al 2009
								System.out.println("Corte: "+req.getParameter("corte")+" Año: "+req.getParameter("ano")+ "Conv: " +req.getParameter("conv"));
								req.setAttribute("listaInscritos", resultados.getListaMovilidad(req.getParameter("corte"),req.getParameter("ano"),req.getParameter("conv")));
								irA="/ResultadosConv/ListaCorte2.jsp";
						}
					break;
					case 2:
						if(req.getParameter("ano").contains("201"))
							req.setAttribute("listaInscritos", resultados.getListaMovilidad(req.getParameter("corte"),req.getParameter("ano"),req.getParameter("conv")));
						else
							req.setAttribute("listaInscritos", resultados.getListaMovilidad(req.getParameter("corte"),req.getParameter("corte"),req.getParameter("conv")));
						irA="/ResultadosConv/ListaCorte2.jsp";
					break;
					case 3:
						if(req.getParameter("ano").contains("201")){
							req.setAttribute("listaInscritos", resultados.getListaMovilidad(req.getParameter("corte"),req.getParameter("ano"),req.getParameter("conv")));
							System.out.println("Corte: "+req.getParameter("corte")+" Año: "+req.getParameter("ano")+ "Conv: " +req.getParameter("conv"));
							irA="/ResultadosConv/ListaCorte2.jsp";
						}						
						else{
							req.setAttribute("listaInscritos", resultados.getListaMovilidad(req.getParameter("corte"),req.getParameter("corte"),req.getParameter("conv")));
							irA="/ResultadosConv/ListaCorte.jsp";
						}						
					break;
					case 4:
						if(req.getParameter("ano").contains("201"))
							req.setAttribute("listaInscritos", resultados.getListaMovilidad(req.getParameter("corte"),req.getParameter("ano"),req.getParameter("conv")));
						else
							req.setAttribute("listaInscritos", resultados.getListaMovilidad(req.getParameter("corte"),req.getParameter("corte"),req.getParameter("conv")));
						irA="/ResultadosConv/ListaCorte2.jsp";
					break;
					case 5:
						if(req.getParameter("ano").contains("201"))
							req.setAttribute("listaInscritos", resultados.getListaMovilidad(req.getParameter("corte"),req.getParameter("ano"),req.getParameter("conv")));
						else
							req.setAttribute("listaInscritos", resultados.getListaMovilidad(req.getParameter("corte"),req.getParameter("corte"),req.getParameter("conv")));
						irA="/ResultadosConv/ListaCorte2.jsp";
					break;
					case 6:
						if(req.getParameter("ano").contains("201"))
							req.setAttribute("listaInscritos", resultados.getListaMovilidad(req.getParameter("corte"),req.getParameter("ano"),req.getParameter("conv")));
						else
							req.setAttribute("listaInscritos", resultados.getListaMovilidad(req.getParameter("corte"),req.getParameter("corte"),req.getParameter("conv")));
						irA="/ResultadosConv/ListaCorte2.jsp";
					break;
					case 7:
						if(req.getParameter("ano").contains("201"))
							req.setAttribute("listaInscritos", resultados.getListaMovilidad(req.getParameter("corte"),req.getParameter("ano"),req.getParameter("conv")));
						else
							req.setAttribute("listaInscritos", resultados.getListaMovilidad(req.getParameter("corte"),req.getParameter("corte"),req.getParameter("conv")));
						irA="/ResultadosConv/ListaCorte2.jsp";
					break;
					}
				req.setAttribute("ano",""+req.getParameter("ano"));
				req.setAttribute("conv",""+req.getParameter("conv"));
				req.setAttribute("corte",""+corte);
			break;
			case Parametros.cmdVerMovilidad:
				System.out.println("En la opcion ver");
				corte=Integer.parseInt(req.getParameter("corte"));
				req.setAttribute("corte",""+corte);
				req.setAttribute("ano",""+req.getParameter("ano"));
				req.setAttribute("conv",""+req.getParameter("conv"));
				switch(corte){
				case 1:
					System.out.println("Caso 1 en el ver");
					req.setAttribute("Result", resultados.getDatosMovilidad(req.getParameter("id"),req.getParameter("st")));					
					System.out.println();
				break;
				case 2:
					req.setAttribute("Result", resultados.getPonenciaMovilidad(req.getParameter("id")));
				break;
				case 3:
					req.setAttribute("Result", resultados.getPonenciaMovilidad(req.getParameter("id")));
				break;
				case 4:
					req.setAttribute("Result", resultados.getPonenciaMovilidad(req.getParameter("id")));
				break;
				case 5:
					req.setAttribute("Result", resultados.getPonenciaMovilidad(req.getParameter("id")));
				break;
				case 6:
					req.setAttribute("Result", resultados.getPonenciaMovilidad(req.getParameter("id")));
				break;
				case 7:
					req.setAttribute("Result", resultados.getPonenciaMovilidad(req.getParameter("id")));
				break;
				}

				irA="/ResultadosConv/DatosPonencia.jsp";
			break;
			case Parametros.cmdResConvocatoriaCIDC:
				req.setAttribute("listado", resultados.getListaConvoctoriaCIDC(req.getParameter("conv"),req.getParameter("ano")));
				irA="/ResultadosConv/ListaPropConv.jsp";
				req.setAttribute("ano",req.getParameter("ano"));
			break;
			default:
				if(req.getParameter("ano")!=null)
					if(req.getParameter("ano").contains("201"))
						irA="/ResultadosConv/ListaConv"+req.getParameter("ano")+".jsp";
			break;
		}
		accion=0;
		retorno[0]="desviar";
		retorno[1]=irA;
		retorno[2]=mensaje;
		return retorno;
	}
}
