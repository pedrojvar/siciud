package cidc.eventos.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;


import cidc.evalPrueba.obj.DatosArtic;
import cidc.evalPrueba.obj.Formulario;
import cidc.evalPrueba.obj.PorEvaluar;

import cidc.general.db.BaseDB;
import cidc.general.db.CursorDB;

public class EventosDB extends BaseDB {

	public EventosDB(CursorDB c, int perfil) {
		super(c,perfil);
		rb=ResourceBundle.getBundle("cidc.eventos.consultas");
	}

	public boolean getEstadoInscripcion(long idPersona,int idEvento){
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int i;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getEstadoInscripcion"));
			ps.setLong(1,idPersona);
			ps.setLong(2,idEvento);
			rs=ps.executeQuery();
			if(rs.next())				
				retorno=true;
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return retorno;
	}



	public boolean insertaInscripcion(long idPersona){
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		boolean retorno=false;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("insertaInscripcion"));
			ps.setLong(i++,1);
			ps.setLong(i++,idPersona);
			ps.executeUpdate();
			retorno=true;
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(cn);
			cerrar(ps);
		}
		return retorno;
	}
	
	public boolean eliminaInscripcion(long idPersona){
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		boolean retorno=false;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("insertaInscripcion"));
			ps.setLong(i++,1);
			ps.setLong(i++,idPersona);
			ps.executeUpdate();
			retorno=true;
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(cn);
			cerrar(ps);
		}
		return retorno;
	}

}
