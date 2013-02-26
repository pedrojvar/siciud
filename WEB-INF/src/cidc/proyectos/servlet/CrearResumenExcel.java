package cidc.proyectos.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.proyectos.db.ProyectosDB;
import cidc.proyectos.obj.GastosRubro;
import cidc.proyectos.obj.Proyecto;

import jxl.*;
import jxl.write.*;
import jxl.write.Number;
import jxl.write.biff.RowsExceededException;
import jxl.biff.DisplayFormat;
import jxl.format.BoldStyle;
import jxl.format.Colour;
import jxl.format.Alignment;


public class CrearResumenExcel extends HttpServlet {
	public CursorDB cursor;
	public static char sep=java.io.File.separatorChar;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		doPost(req,resp);
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException,
		IOException {
		cursor=new CursorDB();
		HttpSession sesion=req.getSession();
		Usuario usuario=(Usuario)sesion.getAttribute("loginUsuario");
		ProyectosDB proyectosDB=new ProyectosDB(cursor,usuario.getPerfil());
		Proyecto proyecto=(Proyecto)sesion.getAttribute("proyecto");
		GastosRubro gastos=null;
		List lista =new ArrayList();
		WritableWorkbook  libro;
		Label general=null;
		Number numero=null;
		try {
			resp.setContentType("application/vnd.ms-excel");
			libro = Workbook.createWorkbook(resp.getOutputStream());
			WritableSheet  hoja1 = libro.createSheet("Resumen de Gastos", 0);
			lista=proyectosDB.getListaGastosExcel(proyecto.getId());
			//crear cabeceras de la lista
			WritableFont fuenteCabecera = new WritableFont(WritableFont.ARIAL, 11);
			WritableFont fuenteTexto = new WritableFont(WritableFont.ARIAL, 10);
			WritableCellFormat formCeldaCabecera = new WritableCellFormat (fuenteCabecera );
			WritableCellFormat formCeldaTexto = new WritableCellFormat (fuenteTexto);
			WritableCellFormat formCeldaNumero = new WritableCellFormat (fuenteTexto);

			fuenteCabecera.setColour(Colour.WHITE);

			formCeldaCabecera.setBackground(Colour.DEFAULT_BACKGROUND1);
			formCeldaCabecera.setAlignment(Alignment.CENTRE);
			formCeldaCabecera.setShrinkToFit(true);

			formCeldaTexto.setShrinkToFit(true);
			formCeldaNumero.setAlignment(Alignment.RIGHT);

			//**********************
			Label lblNombreRubro = new Label(0, 0, "Nombre de Rubro",formCeldaCabecera);
			hoja1.addCell(lblNombreRubro);
			Label lblFecha = new Label(1, 0, "Fecha Registro",formCeldaCabecera);
			hoja1.addCell(lblFecha);
			Label lblDescripcion = new Label(2, 0, "Descripcion del Gasto",formCeldaCabecera);
			hoja1.addCell(lblDescripcion);
			Label lblValor = new Label(3, 0, "Valor",formCeldaCabecera);
			hoja1.addCell(lblValor);
			Label lblCodigo = new Label(4, 0, "Codigo",formCeldaCabecera);
			hoja1.addCell(lblCodigo);
			Label lblObservacion = new Label(5, 0, "Observaciones",formCeldaCabecera);
			hoja1.addCell(lblObservacion);

			for(int i=0;i<lista.size();i++) {
				gastos=(GastosRubro)lista.get(i);
				general=new Label(0, i+1, gastos.getNombreRubro(),formCeldaTexto);
				hoja1.addCell(general);
				general=new Label(1, i+1,gastos.getFecha(),formCeldaTexto);
				hoja1.addCell(general);
				general=new Label(2, i+1, gastos.getDescripcion(),formCeldaTexto);
				hoja1.addCell(general);
				numero=new Number(3 ,i+1,Double.parseDouble(gastos.getValorGasto()),formCeldaNumero);
				hoja1.addCell(numero);
				general=new Label(4 ,i+1, gastos.getCodigo(),formCeldaNumero);
				hoja1.addCell(general);
				general=new Label(5 ,i+1, gastos.getObservaciones(),formCeldaTexto);
				hoja1.addCell(general);
			}
			libro.write();
			libro.close();
		}  catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (RowsExceededException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (WriteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	public static void main(String[] args) {
		// TODO Auto-generated method stub



	}

}
