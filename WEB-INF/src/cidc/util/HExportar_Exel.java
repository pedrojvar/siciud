   /***************************************
    * Nombre Clase ............. HExportar_Exel_Consulta.java
    * Descripción  .. . . . . .  Permite generar imformacion a excel
    * Autor  . . . . . . . . . . ROGER RUIZ
    * Fecha . . . . . . . . . .  12/11/2011
    * versión . . . . . . . . .  1.0
    * Copyright ... . . . . . .  Morris Technologies
    *******************************************/

package cidc.util;

import java.io.ByteArrayOutputStream;


import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.util.HSSFColor;

import cidc.inventario.obj.Elemento;

/*import com.morris.vo.Prdgrupoind;
import com.morris.vo.Prdhistempleado;
import com.morris.vo.Prdrango;
import com.morris.vo.Prdreportefinal;
import com.morris.vo.Prdresulindgrupo;
import com.morris.vo.Prdresulindindividual;
import com.morris.vo.Prdsueldoobjetivo;*/


public class HExportar_Exel{
    protected String ruta;
    private List<Elemento> elementosList;//Tienen que enviarla desde el servlet con el response !!!
    protected HttpServletResponse response;
    protected HttpServletRequest request;

    public HExportar_Exel(List<Elemento> elementosList,
    		String ruta) {
    		this.ruta     = ruta;
    		this.response = response;
    		this.request = request;
    		this.elementosList = elementosList;
    }

    @SuppressWarnings("rawtypes")
	public void ejecutarExel(){
    	ByteArrayOutputStream retorno = new ByteArrayOutputStream();
    	ResourceBundle messages = ResourceBundle.getBundle("messages");
    	NumberFormat mf = NumberFormat.getInstance(); 
		mf.setMaximumFractionDigits(3);
    	try{
    		//CREAR FOLDER
    		ruta = StringUtils.replace(ruta, "\\", "/");
    		File f = new File(ruta);
    		if ( !f.exists() ){
    			f.mkdirs();
    		}
    		//CREANDO EXCEL
			String nombreArchivo = "InventarioGrupo.xls";
    		String rutaExcel = ruta+"/"+nombreArchivo;
    		POIWrite xls = new POIWrite(rutaExcel);
    		/**ESTO QUE VEN ACA SON ESTILOS, ENTONCES QUE LA LETRA DE X TM QUE CON BORDE, QUE ALINEADA BLA BLA BLA TOCA QUE PRUEBEN**/
    		HSSFCellStyle texto   = xls.nuevoEstilo("Calibri", 6 , false    , false, "text"       , HSSFColor.BLACK.index , HSSFColor.WHITE.index , HSSFCellStyle.ALIGN_JUSTIFY);
    		HSSFCellStyle texto1   = xls.nuevoEstilo("Calibri", 6 , false    , false, "text"       , HSSFColor.BLACK.index , HSSFColor.WHITE.index , HSSFCellStyle.ALIGN_CENTER);
    		HSSFCellStyle texto2   = xls.nuevoEstilo("Calibri", 6 , false    , false, "text"       , HSSFColor.BLACK.index , HSSFColor.WHITE.index , HSSFCellStyle.ALIGN_JUSTIFY);
    		HSSFCellStyle texto3   = xls.nuevoEstilo("Calibri", 6 , false    , false, "text"       , HSSFColor.BLACK.index , HSSFColor.WHITE.index , HSSFCellStyle.ALIGN_CENTER);
    		HSSFCellStyle texto6   = xls.nuevoEstilo("Calibri", 6 , false    , false, "text"       , HSSFColor.BLACK.index , HSSFColor.WHITE.index , HSSFCellStyle.ALIGN_LEFT);
    		HSSFCellStyle textoDerBorde   = xls.nuevoEstilo("Calibri", 6 , false    , false, "text"       , HSSFColor.BLACK.index , HSSFColor.WHITE.index , HSSFCellStyle.ALIGN_RIGHT);
    		HSSFCellStyle texto7   = xls.nuevoEstilo("Calibri", 6 , false    , false, "text"       , HSSFColor.BLACK.index , HSSFColor.WHITE.index , HSSFCellStyle.ALIGN_LEFT);
    		HSSFCellStyle textoCentralBordeL   = xls.nuevoEstilo("Calibri", 6 , false    , false, "text"       , HSSFColor.BLACK.index , HSSFColor.WHITE.index , HSSFCellStyle.ALIGN_CENTER);
    		HSSFCellStyle texto4   = xls.nuevoEstilo("Calibri", 6 , false    , false, "text"       , HSSFColor.BLACK.index , HSSFColor.WHITE.index , HSSFCellStyle.ALIGN_CENTER);
    		HSSFCellStyle texto5   = xls.nuevoEstilo("Calibri", 6 , false    , false, "text"       , HSSFColor.BLACK.index , HSSFColor.WHITE.index , HSSFCellStyle.ALIGN_CENTER);
    		HSSFCellStyle titulo  = xls.nuevoEstilo("Calibri", 14  , false    , false, "text"       , HSSFColor.BLACK.index , HSSFColor.WHITE.index, HSSFCellStyle.ALIGN_JUSTIFY);
    		HSSFCellStyle textoAzulIzquierda   = xls.nuevoEstilo("Calibri", 6 , false    , false, "text"       , HSSFColor.BLACK.index , HSSFColor.GREY_25_PERCENT.index , HSSFCellStyle.ALIGN_LEFT);
    		HSSFCellStyle textoAzulCentrado   = xls.nuevoEstilo("Calibri", 6 , false    , false, "text"       , HSSFColor.BLACK.index , HSSFColor.GREY_25_PERCENT.index , HSSFCellStyle.ALIGN_CENTER);    		
    		HSSFCellStyle texto3Izquierda   = xls.nuevoEstilo("Calibri", 6 , false    , false, "text"       , HSSFColor.BLACK.index , HSSFColor.WHITE.index , HSSFCellStyle.ALIGN_LEFT);
    		HSSFCellStyle texto4Amarillo   = xls.nuevoEstilo("Calibri", 6 , false    , false, "text"       , HSSFColor.BLACK.index , HSSFColor.YELLOW.index , HSSFCellStyle.ALIGN_CENTER);
    		HSSFCellStyle texto5Amarrillo   = xls.nuevoEstilo("Calibri", 6 , false    , false, "text"       , HSSFColor.BLACK.index , HSSFColor.YELLOW.index , HSSFCellStyle.ALIGN_CENTER);
    		HSSFCellStyle texto3Amarrillo   = xls.nuevoEstilo("Calibri", 6 , false    , false, "text"       , HSSFColor.BLACK.index , HSSFColor.YELLOW.index , HSSFCellStyle.ALIGN_CENTER);
    		HSSFCellStyle textoGrande   = xls.nuevoEstilo("Calibri", 10 , false    , false, "text"       , HSSFColor.BLACK.index , HSSFColor.WHITE.index , HSSFCellStyle.ALIGN_JUSTIFY);
    		HSSFCellStyle texto1Derecha   = xls.nuevoEstilo("Calibri", 6 , false    , false, "text"       , HSSFColor.BLACK.index , HSSFColor.WHITE.index , HSSFCellStyle.ALIGN_RIGHT);
    		HSSFCellStyle textoCenterBorde   = xls.nuevoEstilo("Calibri", 6 , false    , false, "text"       , HSSFColor.BLACK.index , HSSFColor.WHITE.index , HSSFCellStyle.ALIGN_CENTER);
    		HSSFCellStyle textoNumero = xls.nuevoEstilo("Calibri", 6 , false    , false, "text"       , HSSFColor.BLACK.index , HSSFColor.WHITE.index, HSSFCellStyle.ALIGN_RIGHT);
    		
    		textoNumero.setBorderBottom(HSSFCellStyle.BORDER_THIN);
    		textoNumero.setBottomBorderColor(HSSFColor.BLACK.index);
    		textoNumero.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    		textoNumero.setLeftBorderColor(HSSFColor.BLACK.index);
    		textoNumero.setBorderRight(HSSFCellStyle.BORDER_THIN);
    		textoNumero.setRightBorderColor(HSSFColor.BLACK.index);
    		textoNumero.setBorderTop(HSSFCellStyle.BORDER_THIN);
    		textoNumero.setTopBorderColor(HSSFColor.BLACK.index);
    		
    		textoCentralBordeL.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    		textoCentralBordeL.setLeftBorderColor(HSSFColor.BLACK.index);
    		textoCentralBordeL.setBorderRight(HSSFCellStyle.BORDER_THIN);
    		textoCentralBordeL.setRightBorderColor(HSSFColor.BLACK.index);
    		
    		texto4.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    		texto4.setLeftBorderColor(HSSFColor.BLACK.index);
    		texto4.setBorderRight(HSSFCellStyle.BORDER_THIN);
    		texto4.setRightBorderColor(HSSFColor.BLACK.index);
    		texto4.setBorderTop(HSSFCellStyle.BORDER_THIN);
    		texto4.setTopBorderColor(HSSFColor.BLACK.index);
    		
    		texto5.setBorderBottom(HSSFCellStyle.BORDER_THIN);
    		texto5.setBottomBorderColor(HSSFColor.BLACK.index);
    		texto5.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    		texto5.setLeftBorderColor(HSSFColor.BLACK.index);
    		texto5.setBorderRight(HSSFCellStyle.BORDER_THIN);
    		texto5.setRightBorderColor(HSSFColor.BLACK.index);
    		
    		texto4Amarillo.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    		texto4Amarillo.setLeftBorderColor(HSSFColor.BLACK.index);
    		texto4Amarillo.setBorderRight(HSSFCellStyle.BORDER_THIN);
    		texto4Amarillo.setRightBorderColor(HSSFColor.BLACK.index);
    		texto4Amarillo.setBorderTop(HSSFCellStyle.BORDER_THIN);
    		texto4Amarillo.setTopBorderColor(HSSFColor.BLACK.index);
    		
    		texto5Amarrillo.setBorderBottom(HSSFCellStyle.BORDER_THIN);
    		texto5Amarrillo.setBottomBorderColor(HSSFColor.BLACK.index);
    		texto5Amarrillo.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    		texto5Amarrillo.setLeftBorderColor(HSSFColor.BLACK.index);
    		texto5Amarrillo.setBorderRight(HSSFCellStyle.BORDER_THIN);
    		texto5Amarrillo.setRightBorderColor(HSSFColor.BLACK.index);
    		
    		texto6.setBorderBottom(HSSFCellStyle.BORDER_THIN);
    		texto6.setBottomBorderColor(HSSFColor.BLACK.index);
    		texto6.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    		texto6.setLeftBorderColor(HSSFColor.BLACK.index);
    		texto6.setBorderRight(HSSFCellStyle.BORDER_THIN);
    		texto6.setRightBorderColor(HSSFColor.BLACK.index);
    		texto6.setBorderTop(HSSFCellStyle.BORDER_THIN);
    		texto6.setTopBorderColor(HSSFColor.BLACK.index);
    		
    		textoDerBorde.setBorderBottom(HSSFCellStyle.BORDER_THIN);
    		textoDerBorde.setBottomBorderColor(HSSFColor.BLACK.index);
    		textoDerBorde.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    		textoDerBorde.setLeftBorderColor(HSSFColor.BLACK.index);
    		textoDerBorde.setBorderRight(HSSFCellStyle.BORDER_THIN);
    		textoDerBorde.setRightBorderColor(HSSFColor.BLACK.index);
    		textoDerBorde.setBorderTop(HSSFCellStyle.BORDER_THIN);
    		textoDerBorde.setTopBorderColor(HSSFColor.BLACK.index);
    		
    		textoCenterBorde.setBorderBottom(HSSFCellStyle.BORDER_THIN);
    		textoCenterBorde.setBottomBorderColor(HSSFColor.BLACK.index);
    		textoCenterBorde.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    		textoCenterBorde.setLeftBorderColor(HSSFColor.BLACK.index);
    		textoCenterBorde.setBorderRight(HSSFCellStyle.BORDER_THIN);
    		textoCenterBorde.setRightBorderColor(HSSFColor.BLACK.index);
    		textoCenterBorde.setBorderTop(HSSFCellStyle.BORDER_THIN);
    		textoCenterBorde.setTopBorderColor(HSSFColor.BLACK.index);
    		
    		texto3.setBorderBottom(HSSFCellStyle.BORDER_THIN);
    		texto3.setBottomBorderColor(HSSFColor.BLACK.index);
    		texto3.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    		texto3.setLeftBorderColor(HSSFColor.BLACK.index);
    		texto3.setBorderRight(HSSFCellStyle.BORDER_THIN);
    		texto3.setRightBorderColor(HSSFColor.BLACK.index);
    		texto3.setBorderTop(HSSFCellStyle.BORDER_THIN);
    		texto3.setTopBorderColor(HSSFColor.BLACK.index);
    		
    		texto3Amarrillo.setBorderBottom(HSSFCellStyle.BORDER_THIN);
    		texto3Amarrillo.setBottomBorderColor(HSSFColor.BLACK.index);
    		texto3Amarrillo.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    		texto3Amarrillo.setLeftBorderColor(HSSFColor.BLACK.index);
    		texto3Amarrillo.setBorderRight(HSSFCellStyle.BORDER_THIN);
    		texto3Amarrillo.setRightBorderColor(HSSFColor.BLACK.index);
    		texto3Amarrillo.setBorderTop(HSSFCellStyle.BORDER_THIN);
    		texto3Amarrillo.setTopBorderColor(HSSFColor.BLACK.index);
    		
    		texto3Izquierda.setBorderBottom(HSSFCellStyle.BORDER_THIN);
    		texto3Izquierda.setBottomBorderColor(HSSFColor.BLACK.index);
    		texto3Izquierda.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    		texto3Izquierda.setLeftBorderColor(HSSFColor.BLACK.index);
    		texto3Izquierda.setBorderRight(HSSFCellStyle.BORDER_THIN);
    		texto3Izquierda.setRightBorderColor(HSSFColor.BLACK.index);
    		texto3Izquierda.setBorderTop(HSSFCellStyle.BORDER_THIN);
    		texto3Izquierda.setTopBorderColor(HSSFColor.BLACK.index);
    		
    		texto2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
    		texto2.setBottomBorderColor(HSSFColor.BLACK.index);
    		texto2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    		texto2.setLeftBorderColor(HSSFColor.BLACK.index);
    		texto2.setBorderRight(HSSFCellStyle.BORDER_THIN);
    		texto2.setRightBorderColor(HSSFColor.BLACK.index);
    		texto2.setBorderTop(HSSFCellStyle.BORDER_THIN);
    		texto2.setTopBorderColor(HSSFColor.BLACK.index);
    		
    		textoAzulIzquierda.setBorderBottom(HSSFCellStyle.BORDER_THIN);
    		textoAzulIzquierda.setBottomBorderColor(HSSFColor.BLACK.index);
    		textoAzulIzquierda.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    		textoAzulIzquierda.setLeftBorderColor(HSSFColor.BLACK.index);
    		textoAzulIzquierda.setBorderRight(HSSFCellStyle.BORDER_THIN);
    		textoAzulIzquierda.setRightBorderColor(HSSFColor.BLACK.index);
    		textoAzulIzquierda.setBorderTop(HSSFCellStyle.BORDER_THIN);
    		textoAzulIzquierda.setTopBorderColor(HSSFColor.BLACK.index);
    		
    		textoAzulCentrado.setBorderBottom(HSSFCellStyle.BORDER_THIN);
    		textoAzulCentrado.setBottomBorderColor(HSSFColor.BLACK.index);
    		textoAzulCentrado.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    		textoAzulCentrado.setLeftBorderColor(HSSFColor.BLACK.index);
    		textoAzulCentrado.setBorderRight(HSSFCellStyle.BORDER_THIN);
    		textoAzulCentrado.setRightBorderColor(HSSFColor.BLACK.index);
    		textoAzulCentrado.setBorderTop(HSSFCellStyle.BORDER_THIN);
    		textoAzulCentrado.setTopBorderColor(HSSFColor.BLACK.index);

    		
    		xls.obtenerHoja("Inventario");
    		/*AQUI VAN LOS TITULOS DE LAS COLUMNAS**/
			xls.adicionarCelda(0,0,"Fecha",textoGrande);
			xls.adicionarCelda(0,1,"Elemento Inventario",textoGrande);
			xls.adicionarCelda(0,2,"Código",textoGrande);
			xls.adicionarCelda(0,3,"Valor",textoGrande);
			xls.adicionarCelda(0,4,"Ubicación",textoGrande);
			
			/***aqui hacen u fro para iterar la lista e ir adicionando dinamicamente la lista Y VENGO CHAO*/
			int fila=1, columna=0;
			System.out.printf("Antes del for");
			for(Elemento iteElementos : elementosList){
				xls.adicionarCelda(fila, columna, iteElementos.getFecha(), textoGrande);
				xls.adicionarCelda(fila, columna, iteElementos.getNombreElemento(), textoGrande);
				xls.adicionarCelda(fila, columna, iteElementos.getCodigo(), textoGrande);
				xls.adicionarCelda(fila, columna, iteElementos.getValor(), textoGrande);
				xls.adicionarCelda(fila, columna, iteElementos.getObservacion(), textoGrande);
			}
			procesar(xls.escribirArray(retorno));
			xls.cerrarLibro();
			File archivo = new File(rutaExcel);
			archivo.delete();
    	}catch (Exception ex){
    		ex.printStackTrace();
    	} finally{
    	}
    }
    
    public void procesar(ByteArrayOutputStream retorno)
	throws ServletException, IOException {
		ServletOutputStream out = response.getOutputStream();
		String tipofor = "application/vnd.ms-excel";
		response.setContentType(tipofor);
		try {
			response.setContentLength(retorno.size());
			retorno.writeTo(out);
			out.flush();
		} catch (Exception e) {
		}
    }
}