package cidc.adminInformes.db;

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

import cidc.general.db.BaseDB;
import cidc.general.db.CursorDB;
import cidc.general.mails.EnvioMail2;
import cidc.general.mails.Reporte;
import cidc.general.obj.CrearClaves;
import cidc.general.obj.Globales;
import cidc.adminArticulos.obj.Articulo;
import cidc.adminArticulos.obj.DatEvaluador;
import cidc.adminArticulos.obj.EstadoArticulo;
import cidc.adminArticulos.obj.FiltroArticulo;
import cidc.adminInformes.obj.ExtraDocProyecto;
import cidc.adminInformes.obj.InformeProyecto;
import cidc.convenios.obj.Convenio;



public class AdminInformesDB extends BaseDB{

	public AdminInformesDB(CursorDB c, int perfil) {
		super(c, perfil);
		// TODO Auto-generated constructor stub
		rb=ResourceBundle.getBundle("cidc.adminInformes.consultas");
	}

	public int getIdNuevoDoc(int tipoId, int tipoProyecto){
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int id=0;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getIdDocumento"+tipoId+tipoProyecto));
			rs=ps.executeQuery();
			while(rs.next()){
				id=rs.getInt(1)+1;
			}
			id=id-1;
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
		return id;
	}


	public boolean nuevoInformeProyecto(InformeProyecto informe) {
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("insertaInfProyecto"));
			ps.setLong(i++, informe.getIdProyecto());
			ps.setString(i++, informe.getFechaEntrega());
			ps.setInt(i++, informe.getEstado());
			ps.setInt(i++, informe.getTipo());
			ps.setString(i++, informe.getObservaciones());
			ps.setString(i++, informe.getNombreArchivo());
			ps.executeUpdate();
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

	public List <InformeProyecto> getListaInformes(long idProyecto,int claseProyecto) {
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List <InformeProyecto> lista=new ArrayList <InformeProyecto>();
		InformeProyecto informe= null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			System.out.println("---Daaaa-->"+"listaInfProyecto"+claseProyecto);
			ps=cn.prepareStatement(rb.getString("listaInfProyecto"+claseProyecto));
			ps.setLong(i++, idProyecto);
			rs=ps.executeQuery();
			while(rs.next()){
				i=1;
				informe=new InformeProyecto();
				informe.setIdProyecto(idProyecto);
				informe.setIdInforme(rs.getLong(i++));
				informe.setFechaEntrega(rs.getString(i++));
				informe.setEstado(rs.getInt(i++));
				informe.setTipo(rs.getInt(i++));
				informe.setObservaciones(rs.getString(i++));
				informe.setNombreArchivo(rs.getString(i++));
				lista.add(informe);
			}
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
		return lista;
	}
	
	public List getListaDocAnexos(long idProyecto,int tipoProyecto) {
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List lista=new ArrayList();
		ExtraDocProyecto documento= null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("listaDocsProyecto"+tipoProyecto));
			ps.setLong(i++, idProyecto);
			rs=ps.executeQuery();
			while(rs.next()){
				i=1;
				documento=new ExtraDocProyecto();
				documento.setIdDoc(rs.getLong(i++));
				documento.setFechaDoc(rs.getString(i++));
				documento.setFechaCarga(rs.getString(i++));
				documento.setNombreDocumento(rs.getString(i++));
				documento.setNombreArchivo(rs.getString(i++));
				documento.setNombreObservaciones(rs.getString(i++));
				lista.add(documento);
			}
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
		return lista;
	}

	public boolean actualizaEstadoInforme(String idInforme,String estado) {
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("cambiaEstadoInforme"));
			ps.setInt(i++, Integer.parseInt(estado));
			ps.setLong(i++, Integer.parseInt(idInforme));
			ps.executeUpdate();
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
	
	
	public boolean nuevoDocExternoProyecto(ExtraDocProyecto doc, long user,int tipo) {
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("insertaDocProyecto"+tipo));
			ps.setLong(i++, doc.getIdProyecto());
			ps.setString(i++, doc.getNombreDocumento());
			ps.setString(i++, doc.getFechaDoc());
			ps.setString(i++, doc.getNombreArchivo());
			ps.setString(i++, doc.getObservaciones());
			ps.executeUpdate();
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
	
	public boolean insertaActaCierre(ExtraDocProyecto doc, int tipo,long user, int tipoProy) {
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("insertaActaCierreProyecto"+tipoProy));
			ps.setString(i++, doc.getFechaDoc());
			ps.setInt(i++, tipo);			
			ps.setLong(i++, doc.getIdProyecto());
			ps.executeUpdate();
			i=1;
			ps=cn.prepareStatement(rb.getString("insertaObservacionDocumentoProyecto"+tipoProy));
			ps.setString(i++, doc.getObservaciones());			
			ps.setLong(i++, doc.getIdProyecto());
			ps.setLong(i++, user);
			ps.executeUpdate();
			cn.commit();
			retorno=true;
		} catch (SQLException e) {
			lanzaExcepcion(e);
		} catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(ps);
			cerrar(cn);
		}
		return retorno;
	}
	
}



