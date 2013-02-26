package cidc.general.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.ResourceBundle;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.apache.commons.fileupload.FileUploadException;

import cidc.general.obj.Globales;



public class BaseDB {
	private String mensaje;
	public Globales global=new Globales();
	public  CursorDB cursor;
	public ResourceBundle rb;
	public int perfil;
	private Date fecha=new Date();

	public BaseDB(CursorDB c, int p){
	      cursor=c;
	      mensaje="";
	      perfil=p;
	  }

	public String getMensaje(){
	      return mensaje;
	}
	public void setMensaje(String s){
	      mensaje+=s;
	}
	public void borrarMensaje(){
	    mensaje="";
	}

	public void cerrar(Connection cn){
		if(cn!=null){
			try {
			//	System.out.println("cierra conexion");
				cn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public void cerrar(PreparedStatement pst){
		if(pst!=null){
			try {
				pst.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				lanzaExcepcion(e);
			}
		}
	}
	public void cerrar(ResultSet rs){
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				lanzaExcepcion(e);
			}
		}
	}
	public void lanzaExcepcion(Exception e){
		System.out.println("*****************************Lanzamiento de Exception en el sistema SICIUD**************************");
		System.out.println("Fecha y Hora: "+fecha.toString());
		e.printStackTrace();
		System.out.println("*******************************************************************************************************");
	}

	public void lanzaExcepcion(SQLException e){
		System.out.println("*****************************Lanzamiento de SQLExcepción en el sistema SICIUD**************************");
		System.out.println("Fecha y Hora: "+fecha.toString());
		System.out.println("TIPO: "+e.getSQLState());
		e.printStackTrace();
		System.out.println(e.getNextException());
		System.out.println("*******************************************************************************************************");
	}
	public void lanzaExcepcion(MessagingException e){
		System.out.println("*****************************Lanzamiento de MessagingException en el sistema SICIUD**************************");
		System.out.println("Fecha y Hora: "+fecha.toString());
		e.printStackTrace();
		System.out.println("*******************************************************************************************************");
	}
	public void lanzaExcepcion(AddressException e){
		System.out.println("*****************************Lanzamiento de AddressException en el sistema SICIUD**************************");
		System.out.println("Fecha y Hora: "+fecha.toString());
		e.printStackTrace();
		System.out.println("*******************************************************************************************************");
	}
	public void lanzaExcepcion(FileUploadException e){
		System.out.println("*****************************Lanzamiento de FileUploadException en el sistema SICIUD**************************");
		System.out.println("Fecha y Hora: "+fecha.toString());
		e.printStackTrace();
		System.out.println("*******************************************************************************************************");
	}
}
