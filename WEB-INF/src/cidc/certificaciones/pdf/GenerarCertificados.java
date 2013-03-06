package cidc.certificaciones.pdf;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletResponse;

import cidc.certificaciones.obj.CertificacionesOBJ;
import cidc.general.obj.Globales;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class GenerarCertificados {

	public GenerarCertificados() {
	}
	
	Globales global=new Globales();
	char sep=java.io.File.separatorChar;
	public PdfWriter writer=null;
	public Document document = new Document(new PageSize().LETTER,80f,60f,140f,80f);
	public ResourceBundle rbDir =ResourceBundle.getBundle("cidc.general.conect");
	private static Font texto5 = new Font(Font.FontFamily.HELVETICA, 5,Font.NORMAL);
	private static Font texto7 = new Font(Font.FontFamily.HELVETICA, 7,Font.NORMAL);
	private static Font paginacion = new Font(Font.FontFamily.HELVETICA, 8,Font.BOLD);
	private static Font texto9 = new Font(Font.FontFamily.HELVETICA, 9,Font.NORMAL);
	private static Font texto9n = new Font(Font.FontFamily.HELVETICA, 9,Font.BOLD);
	private static Font texto8 = new Font(Font.FontFamily.HELVETICA, 8,Font.NORMAL);
	private static Font texto10 = new Font(Font.FontFamily.HELVETICA, 10,Font.NORMAL);
	private static Font texto10n = new Font(Font.FontFamily.HELVETICA, 10,Font.BOLD);
	private static Font texto10s = new Font(Font.FontFamily.HELVETICA, 10,Font.UNDERLINE);
	private static Font texto11 = new Font(Font.FontFamily.HELVETICA, 11,Font.NORMAL);
	private static Font texto11n = new Font(Font.FontFamily.HELVETICA, 11,Font.BOLD);
	private static Font texto15Blanca = new Font(Font.FontFamily.HELVETICA, 10,Font.BOLD, BaseColor.WHITE);
	String numCertificado="";
	String nombrePersona="";
	
	/**
	 * Este metodo crea el pdf del certificado de paz y salvo
	 * @param certificado
	 * @param path
	 * @param resp
	 */
	public void crearPazySalvo(CertificacionesOBJ certificado, String path, HttpServletResponse resp){
		System.out.println("Creando Certificado Paz y Salvo");
		String contenido=""; 
		numCertificado=certificado.getConsCert()+" de "+Calendar.getInstance().get(Calendar.YEAR);
		nombrePersona=certificado.getNombre().toUpperCase();		
		Phrase []textoDocumento=new Phrase [2];
		Phrase clausulas=new Phrase();
		Phrase clausulasinicio=new Phrase();		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy h:mm:ss a");
		String formattedDate = sdf.format(date);		
		clausulasinicio.add(new Phrase("\n\nNúmero de Verificación: "+certificado.getCod_verificacion()+"\n",texto10n));
		clausulasinicio.add(new Phrase("Generado el: "+formattedDate+"\n\n\n",texto10n));
		clausulasinicio.add(new Phrase("El(La) investigador(a) ",texto10));
		clausulasinicio.add(new Phrase(certificado.getNombre(),texto10n));
		clausulasinicio.add(new Phrase(" identificado(a) con la cédula de ciudadanía No."+certificado.getCedula()+" de "+ certificado.getNumCedDe()+", ",texto10));
		clausulasinicio.add(new Phrase("a la fecha, se encuentra a ",texto10));
		clausulasinicio.add(new Phrase("PAZ Y SALVO",texto10n));
		clausulasinicio.add(new Phrase(" por concepto de proyectos de investigación en el Centro de Investigación y Desarrollo Científico. ",texto10));
		clausulasinicio.add(new Phrase("Se expide la presente a solicitud del (de la) interesado(a) a los ",texto10));
		clausulasinicio.add(new Phrase(" "+global.getDiaHoy()+" días del mes de "+global.getNombreMesHoy()+" de "+global.getAnoHoy()+".",texto10));
		contenido=clausulasinicio.toString();
		
		textoDocumento[0]=clausulasinicio;
		textoDocumento[1]=clausulas;
		PdfPTable tablaFirmas =new PdfPTable(2);
		PdfPTable tablaEscudo =new PdfPTable(1);
		PdfPCell c0 = null;
        Image firmaD=null;
        
        try {			
			/*tablaEscudo.setWidths(new float[]{(rectangulo.getLeft()+rectangulo.getRight()-120)});
			tablaEscudo.setTotalWidth((rectangulo.getLeft()+rectangulo.getRight()-120));*/
			tablaEscudo.setWidths(new int[]{200});
			tablaEscudo.setTotalWidth(450);
			tablaEscudo.getDefaultCell().setFixedHeight(70);
			
			firmaD=Image.getInstance(path.substring(0,path.lastIndexOf("Documentos"))+sep+"comp"+sep+"img"+sep+"firma_Director.jpg");
			firmaD.setBorder(0);
			tablaEscudo.getDefaultCell().setBorder(Rectangle.NO_BORDER);
			tablaEscudo.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);			
			
			tablaFirmas.setWidths(new int[]{200,200});
			tablaFirmas.setTotalWidth(450);
			tablaFirmas.setLockedWidth(true);
			tablaFirmas.getDefaultCell().setFixedHeight(10);
			tablaFirmas.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
			//tablaEscudo.writeSelectedRows(0, 5, 72, 780 , writer.getDirectContent());
		} catch (DocumentException e1) {
			
			e1.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
        PdfPTable tablaBlanca =new PdfPTable(1);
        PdfPCell celdaVacia=new PdfPCell(new Phrase("\n....\n",texto15Blanca));
        
        celdaVacia.setBorder(Rectangle.NO_BORDER);
        tablaBlanca.addCell(celdaVacia);
        PdfPCell celdaGenerica=new PdfPCell();
        PdfPCell celdaTablaVacia=new PdfPCell(tablaBlanca);
        celdaTablaVacia.setBorder(Rectangle.NO_BORDER);
        celdaGenerica.setBorder(Rectangle.NO_BORDER);
		
        PdfPCell ralla1=new PdfPCell(new Phrase("_________________________________ ",texto10n));
		PdfPCell directorCIDC=new PdfPCell(new Phrase(rbDir.getString("directorCIDC").toUpperCase(),texto10n));
		PdfPCell tituloCIDC=new PdfPCell(new Phrase("Director Centro de Investigaciones",texto10));
		
		ralla1.setHorizontalAlignment(Element.ALIGN_CENTER);
		ralla1.setBorder(Rectangle.NO_BORDER);		
		
		directorCIDC.setHorizontalAlignment(Element.ALIGN_CENTER);
		directorCIDC.setBorder(Rectangle.NO_BORDER);		
		
		tituloCIDC.setHorizontalAlignment(Element.ALIGN_CENTER);
		tituloCIDC.setBorder(Rectangle.NO_BORDER);		
		
		tablaEscudo.addCell(firmaD);		
		tablaEscudo.addCell(ralla1);		
		tablaEscudo.addCell(directorCIDC);		
		tablaEscudo.addCell(tituloCIDC);		
		try {
			certificado.setCuerpo_cer(contenido);
			inicarDocumentoCertificado(resp,path);
			agregarContenido(textoDocumento, tablaEscudo);
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		System.out.println("-Certificado Electrónico creado->");

		
	}
	/**
	 * 
	 * @param resp
	 * @return
	 */
	private HttpServletResponse inicarDocumentoCertificado(HttpServletResponse resp, String pathArchivo) {
		try {
			writer=PdfWriter.getInstance(document, new FileOutputStream(pathArchivo));
			resp.setContentType("application/pdf");
			resp.setHeader("Content-disposition","inline; filename=test.pdf");			
			PdfWriter.getInstance(document, new FileOutputStream("Certificado.pdf"));
			
			document.open();			
			document.addTitle("\n EL SUSCRITO DIRECTOR DEL CENTRO DE INVESTIGACIONES Y DESARROLLO CIENTÍFICO \n CERTIFICA QUE:");
			document.addSubject("Certificado Electrónico");
			document.addKeywords("Certificado, electrónico,o.j.a.s");
			document.addAuthor("CIDC");
			document.addCreator("Sistema SICIUD");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return resp;
	}
	
	/**
	 * 
	 * @param texto
	 * @param tablaFirmas
	 * @throws DocumentException
	 */
	private void agregarContenido(Phrase[] texto,PdfPTable tablaFirmas) throws DocumentException {
		Paragraph total=new Paragraph();
		for(int i=0;i<texto.length;i++)
			total.add(texto[i]);
		total.setAlignment(3);
						
		Paragraph p=new Paragraph("");
		total.add(p);total.add(p);total.add(p);total.add(p);total.add(p);total.add(p);
				
		document.add(total);		
		document.add(tablaFirmas);
		document.close();
	}
	
	
}
