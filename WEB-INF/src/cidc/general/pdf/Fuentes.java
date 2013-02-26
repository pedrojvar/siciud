package cidc.general.pdf;

import java.awt.Color;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;

public class Fuentes {
	static Font fArial14Negrilla= FontFactory.getFont("arial", 14, Font.BOLD);

	static Font fArial10= FontFactory.getFont("times new roman", 10, Font.NORMAL);
	static Font fArial10Negrilla= FontFactory.getFont("times new roman", 10, Font.BOLD);
	static Font fArial11Azul= FontFactory.getFont("arial", 11, Font.BOLD, new BaseColor(0, 0, 255));
	static Font fArial11= FontFactory.getFont("arial", 11, Font.NORMAL);
	static Font fArial12= FontFactory.getFont("arial", 12, Font.NORMAL);
	static Font fArial12Negrilla= FontFactory.getFont("arial", 12, Font.BOLD);
	static Font fArial11Blanco= FontFactory.getFont("arial", 11, Font.NORMAL,new BaseColor(255, 255, 255));
	static Font fArial11Negrilla= FontFactory.getFont("arial", 11, Font.BOLD);
	static Font formula= FontFactory.getFont("times new roman", 13, Font.ITALIC);
	static Font titulo= FontFactory.getFont("tahoma", 16, Font.BOLDITALIC);
	static Font subtitulo= FontFactory.getFont("tahoma", 14, Font.ITALIC);

}
