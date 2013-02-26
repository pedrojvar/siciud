package cidc.general.obj;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cidc.general.db.CursorDB;
import cidc.proyectos.obj.GastosRubro;

import jxl.*;
import jxl.read.biff.BiffException;
import jxl.write.*;

public class LeeExcel5 extends HttpServlet {
	public CursorDB cursor;
	public static char sep=java.io.File.separatorChar;

	public List leerGastosExcel(){
		List lista =new ArrayList();
		GastosRubro gastos=new GastosRubro();

		Workbook workbook;
		try {
			workbook = Workbook.getWorkbook(new File("C:"+sep+"POLLA 2010.xls"));
			Sheet sheet = workbook.getSheet(11);
			Cell celda1=sheet.getCell(5,4);
			System.out.println("***"+ celda1.getContents());
			Cell []listaCeldasD=sheet.getColumn(5);
			for(int i=1;i<listaCeldasD.length;i++){

				System.out.println("***-->"+ listaCeldasD[i].getContents());

			}
		} catch (BiffException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lista;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		LeeExcel5 leer=new LeeExcel5();
		leer.leerGastosExcel();
		System.out.println("***-->Teminado");

	}

}
