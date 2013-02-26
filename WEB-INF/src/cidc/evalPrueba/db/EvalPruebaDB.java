package cidc.evalPrueba.db;

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

public class EvalPruebaDB extends BaseDB {

	public EvalPruebaDB(CursorDB c, int perfil) {
		super(c,perfil);
		rb=ResourceBundle.getBundle("cidc.evalPrueba.consultas");
	}

	public List getProductosAsignados(long idPersona){
		PorEvaluar porEvaluar=null;
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List lista=new ArrayList();
		int i;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getArticuloEvaluar"));
		//	System.out.println("Persona="+idPersona);
			ps.setLong(1,idPersona);
			rs=ps.executeQuery();
			while(rs.next()){
				i=1;
				porEvaluar=new PorEvaluar();
				porEvaluar.setId(rs.getLong(i++));
				porEvaluar.setNombre(rs.getString(i++));
				porEvaluar.setUrlArchivo(rs.getString(i++));
				lista.add(porEvaluar);
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



	public boolean insertaEvaluacion(Formulario evaluacion){
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		boolean retorno=false;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("insertaEvalArticulo"));
			ps.setLong(i++,evaluacion.getIdArtic());
			ps.setInt(i++,evaluacion.getPr1());
			ps.setInt(i++,evaluacion.getPr2());
			ps.setInt(i++,evaluacion.getPr3());
			ps.setInt(i++,evaluacion.getPr4());
			ps.setInt(i++,evaluacion.getPr5());
			ps.setInt(i++,evaluacion.getPr6());
			ps.setInt(i++,evaluacion.getPr7());
			ps.setString(i++,evaluacion.getObserv());

			cambiaEstado(evaluacion.getIdArtic(),cn);

			ps.executeUpdate();
			cn.commit();
			retorno=true;
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(cn);
			cerrar(ps);
			cerrar(rs);
		}
		return retorno;
	}



	public void cambiaEstado(long artic, Connection cn)throws SQLException{
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{
			ps=cn.prepareStatement(rb.getString("cambia_estado"));
			ps.setInt(1,5);
			ps.setLong(2,artic);
			ps.executeUpdate();
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(ps);
			cerrar(rs);
		}
	}


	public boolean isPswCorrecta(String prop,String eval,String clave) {
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("claveArticulo"));
			ps.setString(1,prop);
			ps.setString(2,eval);
			ps.setString(3,clave);
			rs=ps.executeQuery();
			System.out.println("llega al mètodo "+prop+" "+eval+" "+clave);
			while(rs.next()){
				System.out.println("ecuentra a la calve de propuesta");
				retorno=true;
				break;
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
	//	System.out.println("Retorno="+retorno);
		return retorno;
	}


	public DatosArtic getDatosArticulo(String idPersona, String idArtic){
		DatosArtic datos=null;
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getDatosArticulo"));
			System.out.println("Persona="+idPersona);
			System.out.println("articulo="+idArtic);
			ps.setLong(1,Long.parseLong(idPersona));
			ps.setLong(2,Long.parseLong(idArtic));
			rs=ps.executeQuery();
			while(rs.next()){
				i=1;
				datos=new DatosArtic();
				datos.setIdArtic(Long.parseLong(idArtic));
				datos.setIdEval(Long.parseLong(idPersona));
				datos.setNombArtic(rs.getString(i++));
				datos.setNombEval(rs.getString(i++));
			}
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(cn);
			cerrar(ps);
			cerrar(rs);
		}
		return datos;
	}

}
