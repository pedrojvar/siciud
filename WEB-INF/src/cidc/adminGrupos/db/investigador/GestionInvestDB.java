package cidc.adminGrupos.db.investigador;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import cidc.adminGrupos.obj.Integrante;
import cidc.adminGrupos.obj.investigador.Articulo;
import cidc.adminGrupos.obj.investigador.Propuesta;
import cidc.general.db.BaseDB;
import cidc.general.db.CursorDB;
import cidc.general.mails.EnvioMail2;
import cidc.general.mails.Reporte;
import cidc.general.obj.CrearClaves;
import cidc.general.obj.Globales;

public class GestionInvestDB extends BaseDB{

	public GestionInvestDB(CursorDB cursor, int perfil) {
		super(cursor, perfil);
		rb=ResourceBundle.getBundle("cidc.adminGrupos.db.investigador.consultas");
	}

	public boolean participacion(long idPersona){
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		Globales g= new Globales();
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("insertaParticipacion"));
			ps.setLong(i++,idPersona);
			ps.setInt(i++,1);
			ps.setInt(i++,Integer.parseInt(g.getAnoHoy()));
			ps.executeUpdate();
			retorno=true;
			System.out.println("inserta participación");
		}catch (SQLException e) {
			if(e.getSQLState().equals("23505"))
				setMensaje("Su incripción ya ha sido registrada con anterioridad, ");
			else{
				lanzaExcepcion(e);
				setMensaje("No pudo ser registrada su inscripción " +e);
			}

		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(ps);
			cerrar(cn);
		}
		return retorno;
	}


	public long getIdArchivo() {
		long id=0;
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("idArchivo"));
			rs=ps.executeQuery();
			while (rs.next()) {
				id=rs.getLong(1);
			}
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return id;
	}

	public boolean nuevoArticulo(Articulo articulo) {
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		Globales g=new Globales();
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("nuevoArticulo"));
			ps.setString(i++,articulo.getTituloArticulo().toLowerCase());
			ps.setLong(i++,Long.parseLong(articulo.getPresentador()));
			ps.setString(i++,articulo.getAutores());
			ps.setString(i++,articulo.getPalabClaves());
			ps.setString(i++,articulo.getTemaInteres());
			ps.setInt(i++,articulo.getPara());
			ps.setInt(i++,articulo.getTipoPre());
			ps.setString(i++,articulo.getArchivo());
			ps.setInt(i++, Integer.parseInt(g.getAnoHoy()));
			ps.executeUpdate();

			ps=cn.prepareStatement(rb.getString("insertaEstado"));
			ps.setInt(1,1);
			ps.executeUpdate();
			cn.commit();
			retorno=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			lanzaExcepcion(e);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			lanzaExcepcion(e);
		}finally{
			cerrar(ps);
			cerrar(cn);
		}
		return retorno;
	}

	public List getListaArtic(long idPersona) {
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List lista=new ArrayList();
		Articulo articulo=null;
		Globales g=new Globales();
		int i=0;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("listaArticulos"));
			ps.setLong(1,idPersona);
			rs=ps.executeQuery();
			while (rs.next()) {
				i=1;
				articulo =new Articulo();
				articulo.setEstado(rs.getInt(i++));
				articulo.setTituloArticulo(rs.getString(i++));
				articulo.setFechaRecibido(rs.getString(i++));
				articulo.setAno(rs.getInt(i++));
				lista.add(articulo);
			}
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return lista;
	}

	public List getListaProp(long idPersona) {
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List lista=new ArrayList();
		Propuesta propuesta=null;
		int i=0;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("listaPropuestas"));
			ps.setLong(1,idPersona);
			rs=ps.executeQuery();
			while (rs.next()) {
				i=1;
				propuesta =new Propuesta();
				propuesta.setIdProp(rs.getLong(i++));
				propuesta.setConvocatoria(rs.getString(i++));
				propuesta.setNombre(rs.getString(i++));
				propuesta.setEstado(rs.getInt(i++));
				propuesta.setActiva(rs.getBoolean(i++));
				lista.add(propuesta);
			}
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return lista;
	}


}
