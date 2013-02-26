/*
 * POIExcel.java
 *
 * Created on 03 de Agosto de 2008, 12:50 PM
 */


package cidc.util;

import java.io.ByteArrayOutputStream;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFPicture;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.hssf.util.Region;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;


/**
 *
 * @author  Julio Barros
 */
public class POIWrite {
    
    private String       fileName;
    private HSSFWorkbook wb;
    private HSSFSheet    sheet;
    
    public static final int NONE = -1;

    
    /** Creates a new instance of POIExcel */
    
    
    public POIWrite(String file) throws Exception{
        File archivo = new File(file);
        if(!archivo.exists()){
        	nuevoLibro(file);
        }else{
        	abrirLibroExistente(file);
        }
    	
    }
    
    public POIWrite()throws Exception {
    	nuevoLibroAbrir();
    }
    
    public void nuevoLibro (String file) throws Exception{
        wb = new HSSFWorkbook();
        fileName = file;
    }
    
    public void abrirLibroExistente (String file) throws Exception{
    	try
    	{
	    	FileInputStream fileInputStream = new FileInputStream(file);
	    	POIFSFileSystem fsFileSystem = new POIFSFileSystem(fileInputStream);
	    	wb = new HSSFWorkbook(fsFileSystem);
	        fileName = file;
    	}catch (Exception e) {
    		e.printStackTrace();
    		wb = new HSSFWorkbook();
		}
    }
    
    public void nuevoLibroAbrir () throws Exception{
        wb = new HSSFWorkbook();
    }
    
    public ByteArrayOutputStream escribirArray(ByteArrayOutputStream retorno){
    	try {
    		wb.write(retorno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return retorno;
    }
    
    public FileOutputStream escribirArray(FileOutputStream retorno){
    	try {
    		wb.write(retorno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return retorno;
    }
    
    public void cerrarLibro () throws Exception{
        if (wb==null)
            throw new Exception("No se pudo cerrar el libro, primero deberá crear el libro");
        
        FileOutputStream fileOut = new FileOutputStream(fileName);
        wb.write(fileOut);
        fileOut.close(); 
        wb = null;
    }
    
    public void obtenerHoja(String hoja)throws Exception{
        if (wb==null)
            throw new Exception("No se pudo crear la hoja, primero deberá crear el libro");
        
        sheet = wb.getSheet(hoja); 
        if (sheet == null) sheet = wb.createSheet(hoja);
    }    
    
    public HSSFCell obtenerCelda(int fila, int columna)throws Exception{
        if (sheet==null)
            throw new Exception("No se pudo crear la celda, primero deberá crear la hoja");
         
        HSSFRow row  = sheet.getRow(fila);
        if (row==null) row = sheet.createRow( (short) fila);
        
        HSSFCell cell   = row.getCell((short) columna );
        if (cell == null) cell = row.createCell( (short) columna);
        
        return cell;
    }
    
    @SuppressWarnings("deprecation")
	public void adicionarCelda(int fila, int columna, String value, HSSFCellStyle style)throws Exception{
        if (sheet==null)
            throw new Exception("No se pudo crear la celda, primero deberá crear la hoja");
         
        HSSFRow row   = sheet.createRow( (short) fila);
        HSSFCell cell = row.createCell ( (short) columna);
        
        cell.setCellValue(value);
        if (style!=null) cell.setCellStyle(style);
    }
    
    public void adicionarCelda(int fila, int columna, double value, HSSFCellStyle style)throws Exception{
        if (sheet==null)
            throw new Exception("No se pudo crear la celda, primero deberá crear la hoja");
         
        HSSFRow row   = sheet.createRow( (short) fila);
        HSSFCell cell = row.createCell ( (short) columna);
        
        cell.setCellValue(value);
        
        HSSFDataFormat format = wb.createDataFormat();
        style.setDataFormat(format.getFormat("#,##0.0"));
        
        if (style!=null) cell.setCellStyle(style);
    }
    
    public void adicionarCeldaPorcentaje(int fila, int columna, double value, HSSFCellStyle style)throws Exception{
        System.out.println("adicionarCeldaPorcentaje: "+value);
    	if (sheet==null)
            throw new Exception("No se pudo crear la celda, primero deberá crear la hoja");
         
        HSSFRow row   = sheet.createRow( (short) fila);
        HSSFCell cell = row.createCell ( (short) columna);
        
        cell.setCellValue(value);
        
        HSSFDataFormat format = wb.createDataFormat();
        style.setDataFormat(format.getFormat("#,##0.0\\%"));
        
        if (style!=null) cell.setCellStyle(style);
    }
    
    public void adicionarCelda(int fila, int columna, Date value, HSSFCellStyle style)throws Exception{
        if (sheet==null)
            throw new Exception("No se pudo crear la celda, primero deberá crear la hoja");
         
        HSSFRow row   = sheet.createRow( (short) fila);
        HSSFCell cell = row.createCell ( (short) columna);
        
        cell.setCellValue(value);
        
        if (style!=null) cell.setCellStyle(style);
    } 
    
    public void combinarCeldas(int filaInicial, int columnaInicial, int filaFinal , int columnaFinal)throws Exception{
        if (sheet==null)
            throw new Exception("No se pudo crear la celda, primero deberá crear la hoja");
                 
        sheet.addMergedRegion(new Region(filaInicial,(short)columnaInicial ,filaFinal,(short)columnaFinal));
     
    }
    
    public void cambiarMagnificacion (int x, int y)throws Exception{
        if (sheet==null)
            throw new Exception("No se pudo modificar la magnificacion, primero deberá crear la hoja");
                 
        sheet.setZoom(x,y);   
    }
    
    public void cambiarAnchoColumna (int columna, int ancho) throws Exception{
        if (sheet==null)
            throw new Exception("No se pudo cambiar el ancho de la columna, primero deberá crear la hoja");
        sheet.setColumnWidth((short) columna, (short) ancho);
    }
    
    public void crearPanel (int colSplit, int rowSplit, int leftmostColumn, int topRow)throws Exception{
        if (sheet==null)
            throw new Exception("No se pudo crear el panel, primero deberá crear la hoja");
        sheet.createFreezePane(colSplit, rowSplit , leftmostColumn ,topRow );
    }

    
    @SuppressWarnings("static-access")
	public HSSFCellStyle nuevoEstilo (String name, int size, boolean bold, boolean italic , String formato ,int color, int fondo, int align)throws Exception{
        if (wb==null)
            throw new Exception("No se pudo crear el estilo, primero deberá crear el libro");
        
        HSSFCellStyle style   = wb.createCellStyle();
        HSSFFont      font    = wb.createFont();
        
        font.setFontHeightInPoints((short) size);
        font.setFontName(name);                                 
        if (bold)   font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        font.setItalic(italic);
        if (color!=NONE) font.setColor((short) color);
        
        
        style.setFont(font);
        if (!formato.equals(""))
            style.setDataFormat(wb.createDataFormat().getFormat(formato)); 
        
        if (fondo!=NONE) {
            style.setFillPattern((short) style.SOLID_FOREGROUND);
            style.setFillForegroundColor((short)fondo);
        }
        
        if (align!=NONE) style.setAlignment((short)align);
        return style;
        
    }
    
    @SuppressWarnings("static-access")
	public HSSFCellStyle nuevoEstilo (String name, int size, boolean bold, boolean italic , String formato ,int color, int fondo, int align, int border)throws Exception{
        if (wb==null)
            throw new Exception("No se pudo crear  el estilo, primero deberá crear el libro");
        
        HSSFCellStyle style   = wb.createCellStyle();
        HSSFFont      font    = wb.createFont();
        
        font.setFontHeightInPoints((short) size);
        font.setFontName(name);                                 
        if (bold)   font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        font.setItalic(italic);
        if (color!=NONE) font.setColor((short) color);
        
        
        style.setFont(font);
        if (!formato.equals(""))
            style.setDataFormat(wb.createDataFormat().getFormat(formato)); 
        
        if (fondo!=NONE) {
            style.setFillPattern((short) style.SOLID_FOREGROUND);
            style.setFillForegroundColor((short)fondo);
        }
        
        if (align!=NONE) style.setAlignment((short)align);
        
        if (border>0){
            style.setBorderBottom((short)border);
            style.setBottomBorderColor(HSSFColor.BLACK.index);
            
            style.setBorderLeft((short)border);
            style.setLeftBorderColor(HSSFColor.BLACK.index);
            
            style.setBorderRight((short)border);
            style.setRightBorderColor(HSSFColor.BLACK.index);
            
            style.setBorderTop((short)border);
            style.setTopBorderColor(HSSFColor.BLACK.index);
        }      
        return style;
        
    }    
    
    
    /**
     * Metodo para obtenecer un nuevo color personalizado
     * @autor mfontalvo
     * params rgb, codigo del color
     */
    public HSSFColor obtenerColor (int r, int g, int b ) throws Exception{
        HSSFColor newColor = null;
        if (wb==null)
            throw new Exception("No se pudo crear el color, primero deberá crear el libro");
        try {
        java.awt.Color color = new java.awt.Color(r, g, b);
        newColor =
        wb.getCustomPalette().findColor(
            (byte)color.getRed(),
            (byte)color.getGreen(),
            (byte)color.getBlue()
        );
        
        } catch (Exception e) {
            e.printStackTrace();
        }
        return newColor;
        
    }
    
    
    /**
     * Metodo para agregar formulas a una celda, 'Formulas sencillas'
     * @autor mfontalvo
     * @param fila fila de la hoja actual
     * @param columna columna de la hoja actual
     * @param formula formula que desea agregar
     * @param style estilo de la celda
     * @throws Exception.
     */
    public void adicionarFormula(int fila, int columna, String formula, HSSFCellStyle style)throws Exception{
        if (sheet==null)
            throw new Exception("No se pudo crear la celda, primero deberá crear la hoja");

        HSSFRow row   = sheet.createRow( (short) fila);
        HSSFCell cell = row.createCell ( (short) columna);

        cell.setCellFormula(formula);

        if (style!=null) cell.setCellStyle(style);
    }
    
    @SuppressWarnings("unused")
	public void nuevaImagen(String nombreImg){
    	HSSFPatriarch patriarch = sheet.createDrawingPatriarch();
		HSSFClientAnchor anchor;
		anchor = new HSSFClientAnchor(500,100,804,200,(short)7,0,(short)10,3);
		anchor.setAnchorType(2);
		File files = new File(nombreImg);
		try {
			int picture1 = loadPicture(nombreImg);
			System.out.println("int de la imagen "+picture1);
			HSSFPicture picture =  patriarch.createPicture(anchor, picture1);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
//    @SuppressWarnings("unused")
//	public void nuevaImagen(String nombreImg){
//    	HSSFPatriarch patriarch = sheet.createDrawingPatriarch();
//    	HSSFClientAnchor anchor;
//		anchor = new HSSFClientAnchor(500,100,804,200,(short)7,0,(short)10,3);
//		anchor.setAnchorType(NONE);
//    	patriarch.createPicture(anchor,loadPicture(nombreImg,  wb ));
//    }
	

    private int loadPicture( String path) throws
    IOException{
    	int pictureIndex = 0;
    	try{
        	FileInputStream fis = null;
            ByteArrayOutputStream bos = null;
            try{
                fis = new FileInputStream( path);
                bos = new ByteArrayOutputStream();
                int c;
                while ( (c = fis.read()) != -1) bos.write( c );
                pictureIndex = this.wb.addPicture( bos.toByteArray(), HSSFWorkbook.PICTURE_TYPE_JPEG);
            } finally{
                if (fis != null)
                    fis.close();
                if (bos != null)
                    bos.close();
            }
        }catch (Exception e) {
        	e.printStackTrace();
		}
        return pictureIndex;
       }
}

