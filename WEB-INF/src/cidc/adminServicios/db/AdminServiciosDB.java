package cidc.adminServicios.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
import cidc.adminEvaluador.obj.AreasTrabOBJ;
import cidc.adminPropuestas.obj.DatEvaluadorOBJ;
import cidc.adminPropuestas.obj.DatoConvocatoriaOBJ;
import cidc.adminPropuestas.obj.EstadoPropuestaOBJ;
import cidc.adminPropuestas.obj.FiltroEvaluadorOBJ;
import cidc.adminPropuestas.obj.ListaEvaluadorOBJ;
import cidc.adminPropuestas.obj.PropuestaOBJ;
import cidc.adminServicios.obj.Objeto;


public class AdminServiciosDB extends BaseDB{

	public AdminServiciosDB(CursorDB c, int perfil) {
		super(c, perfil);
		// TODO Auto-generated constructor stub
		rb=ResourceBundle.getBundle("cidc.adminServicios.consultas");
	}

	public List getCategorias(){
		List listCategoria=new ArrayList();
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		Objeto categoria=null;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("listaCategoria"));
			rs=ps.executeQuery();
			while (rs.next()) {
				categoria=new Objeto();
				categoria.setId(rs.getInt(1));
				categoria.setNombre(rs.getString(2));
				listCategoria.add(categoria);
			}
		}catch (SQLException e) {
			lanzaExcepcion(e);
		} catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}

		return listCategoria;
	}

	public List ajaxServicios(int idCat){
		List listaServicios=new ArrayList();
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		Objeto serv=null;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("ajaxServicios"));
			ps.setInt(1, idCat);
			rs=ps.executeQuery();
			while (rs.next()) {

				serv=new Objeto();
				serv.setId(rs.getInt(1));
				serv.setNombre(rs.getString(2));
				listaServicios.add(serv);
		//		System.out.println(serv.getId()+" - "+serv.getNombre());
			}
		}catch (SQLException e) {
			lanzaExcepcion(e);
		} catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return listaServicios;
	}


	public List ajaxPerfilServicio(long idRecurso){
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List listaPerfiles=new ArrayList();
		try {
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("getPerfilServicio"));
	//		System.out.println("Item="+idRecurso);
			ps.setLong(1, idRecurso);
			rs=ps.executeQuery();
			while (rs.next()) {
//				System.out.println("-"+rs.getString(1));
				listaPerfiles.add(rs.getString(1));
			}
		}catch (SQLException e) {
			lanzaExcepcion(e);
		} catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return listaPerfiles;
	}

	public boolean setPerfilServicio(Objeto obj){
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		try {
			cn=cursor.getConnection(super.perfil);
			
			ps=cn.prepareStatement(rb.getString("borrarListaItem"));
			ps.setLong(1, obj.getIdServ());
			ps.executeUpdate();
			
			cn.setAutoCommit(false);
			if(obj.getLsPerfiles()!=null){
				ps=cn.prepareStatement(rb.getString("insertaItemPerfil"));
				for(int i=0;i<obj.getLsPerfiles().length;i++){
					ps.setInt(1, obj.getIdServ());
					ps.setLong(2, obj.getLsPerfiles()[i]);
					ps.addBatch();
				}
				ps.executeBatch();
			}
			cn.commit();
			retorno=true;
		}catch (SQLException e) {
			lanzaExcepcion(e);
			lanzaExcepcion(e.getNextException());
		} catch (Exception e){
			lanzaExcepcion(e);
		}finally{
			cerrar(ps);
			cerrar(cn);
		}
		return retorno;
	}

	public List getListaPerfiles(){
		List listaPerfiles=new ArrayList();
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		Objeto perfil=null;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getListaPerfiles"));
			rs=ps.executeQuery();
			while (rs.next()) {
				perfil=new Objeto();
				perfil.setId(rs.getInt(1));
				perfil.setNombre(rs.getString(2));
				listaPerfiles.add(perfil);
			}
		}catch (SQLException e) {
			lanzaExcepcion(e);
		} catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}

		return listaPerfiles;
	}
}


