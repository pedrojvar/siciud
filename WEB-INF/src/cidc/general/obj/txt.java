package cidc.general.obj;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;

public class txt {

	public void crearArchivo(StringBuffer texto){
		String sep=null;
		//esto es para saber que sistema operativo tenemos y determinar el caracter de separación de carpetas..
		String so=System.getProperty("os.name");
    	if(so.equals("linux"))
    		sep="/";
    	else
    		sep="\\";
    	//***************************************************************************************************
		PrintWriter salida;
		try {
			salida = new PrintWriter(new File("D:"+sep+"ArchivoSalida.txt"));
	    	salida.write(""+texto);
	    	salida.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

    	System.out.println("listo pelao... Archivo creado");

	}

	public static void main (String [] as){
		txt t=new txt();
		StringBuffer envio=new StringBuffer();
		envio.append("Hola Pirinola :)\n\n\nEste es un archivo de prueba para ver la creación de un txt que tiene no se que cosas, para uso de no se que otras cosas...\n\n");
		t.crearArchivo(envio);

	}
}
