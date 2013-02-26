package cidc.general.obj;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import org.jdom.*;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;

import cidc.general.obj.Colores;

public class Graficas
{
	public static char sep = java.io.File.separatorChar;

    public void tortas(String []variables, String []valores,String url,String nombreArchivo){
    	Element contenedor=new Element("pie");
        Element a=null;
        for(int i=0;i<variables.length;i++){
        	a=new Element("slice");
        	a.setAttribute("title", ""+variables[i]);
        	a.setAttribute("color", new Colores().dame_color_aleatorio());
        	a.setText(""+valores[i]);
        	contenedor.addContent(a);
        }
        Document documento=new Document(contenedor);
        try{
          XMLOutputter escribirXml=new XMLOutputter(Format.getPrettyFormat());
          FileOutputStream archivo=new FileOutputStream(url+sep+nombreArchivo+".xml");
          escribirXml.output(documento,archivo);
          archivo.flush();
          archivo.close();
        //  out.output(doc,//System.out);
        }catch(Exception ex){
        	ex.printStackTrace();
        }
    }

    public void donuts(String []variables, String []valores,String url,String nombreArchivo){
    	Element contenedor=new Element("pie");
        Element a=null;
        for(int i=0;i<variables.length;i++){
        	a=new Element("slice");
        	a.setAttribute("title", ""+variables[i]);
        	a.setAttribute("color", new Colores().dame_color_aleatorio());
        	a.setText(""+valores[i]);
        	contenedor.addContent(a);
        }
        Document documento=new Document(contenedor);
        try{
          XMLOutputter escribirXml=new XMLOutputter(Format.getPrettyFormat());
          FileOutputStream archivo=new FileOutputStream(url+sep+nombreArchivo+".xml");
          escribirXml.output(documento,archivo);
          archivo.flush();
          archivo.close();
        //  out.output(doc,//System.out);
        }catch(Exception ex){
        	ex.printStackTrace();
        }
    }

    public void columnas(String []series, String []valores,String url,String nombreArchivo){
    	Element contenedor=new Element("chart");
        Element a=new Element("series");
        Element b=null;
        Element c=new Element("graphs");
        Element d=null;
        Element e=null;
        for(int i=0;i<series.length;i++){
        	b=new Element("value").setAttribute("xid", ""+i);
        	b.setAttribute("color", new Colores().dame_color_aleatorio());
        	b.setText(""+series[i]);
        	a.addContent(b);
        }
        contenedor.addContent(a);
        d=new Element("graph").setAttribute("gid", ""+0);
        for(int i=0;i<valores.length;i++){
        	e=new Element("value").setAttribute("xid", ""+i);
        	e.setText(""+valores[i]);
        	d.addContent(e);
        }
        c.addContent(d);
        contenedor.addContent(c);
        Document documento=new Document(contenedor);
        try{
          XMLOutputter escribirXml=new XMLOutputter(Format.getPrettyFormat());
          FileOutputStream archivo=new FileOutputStream(url+sep+nombreArchivo+".xml");
          escribirXml.output(documento,archivo);
          archivo.flush();
          archivo.close();
        //  out.output(doc,//System.out);
        }catch(Exception ex){
        	ex.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Graficas xml=new Graficas();
        List x= new ArrayList();
        String []a={"1","34","25","43","39","92","38"};
        String []b={"2","34","45","34","93","28","23"};
        String []c={"3","74","2345"};
        x.add(a);
        x.add(b);
        x.add(c);
        xml.tortas(a,b,"D:\\", "elmio10");
        //xml.crearDistPuntos(3,x);
        //xml.crearHistograma(a, "E:\\Tomcat\\webapps\\Simulador\\grafico\\amline\\");
    }
}