package cidc.evalArticulo.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import cidc.evalArticulo.obj.Aspectos;
import cidc.evalArticulo.obj.DatosArtic;
import cidc.evalArticulo.obj.Evaluacion;
import cidc.evalArticulo.obj.Filtro;
import cidc.general.db.BaseDB;
import cidc.general.db.CursorDB;

public class EvalArticuloDB extends BaseDB {

	public EvalArticuloDB(CursorDB c, int perfil) {
		super(c,perfil);
		rb=ResourceBundle.getBundle("cidc.evalArticulo.consultas");
	}

	public List getListaArticulos(Filtro filtroArticulo){
		DatosArtic articulo=null;
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List lista=new ArrayList();
		DecimalFormat dx=new DecimalFormat("0000.0");
		float x=0;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getListaArticulosEvaluar"));
			ps.setInt(i++, Integer.parseInt(filtroArticulo.getAno()));
			rs=ps.executeQuery();
			while(rs.next()){
				i=1;
				articulo=new DatosArtic();
				articulo.setIdArtic(rs.getLong(i++));
				articulo.setNombArtic(rs.getString(i++));
				articulo.setNombPresentador(rs.getString(i++));
				articulo.setUrlArchivo(rs.getString(i++));
				x=rs.getFloat(i++);
		//		System.out.println("---->"+x);
				articulo.setCalificacion(x);
				articulo.setEstado(rs.getInt(i++));
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



	public boolean insertaEvaluacion(Evaluacion eval){
		Connection cn=null;
		PreparedStatement ps=null;
		boolean retorno=false;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("evaluarArticulo"));
			for(int j=0;j<eval.getValores().length;j++){
				i=1;
				ps.setLong(i++,eval.getId());
				ps.setFloat(i++,eval.getIdAspectos()[j]);
				ps.setFloat(i++,eval.getValores()[j]);
				ps.addBatch();
			}
			ps.executeBatch();
			retorno=true;
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(ps);
			cerrar(cn);
		}
		return retorno;
	}


	public List getListaAspectosEvaluar(){
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List lista=new ArrayList();
		Aspectos aspecto= null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getListaAspectosEvaluar"));
			ps.setInt(i++, 1);
			rs=ps.executeQuery();
			while(rs.next()){
				i=1;
				aspecto=new Aspectos();
				aspecto.setId(rs.getInt(i++));
				aspecto.setNombre(rs.getString(i++));
				aspecto.setValor(rs.getString(i++));
				lista.add(aspecto);
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

	public DatosArtic getInfoArticulos(String id){
		DatosArtic articulo=null;
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getInfoArticulo"));
			ps.setInt(i++, Integer.parseInt(id));
			rs=ps.executeQuery();
			while(rs.next()){
				i=1;
				articulo=new DatosArtic();
				articulo.setIdArtic(rs.getLong(i++));
				articulo.setNombArtic(rs.getString(i++));
				articulo.setNombPresentador(rs.getString(i++));
				articulo.setUrlArchivo(rs.getString(i++));
				articulo.setAspectosEvaluar(getListaAspectosEvaluar());
				if(articulo.getUrlArchivo().endsWith(".pdf"))
					articulo.setImgArchivo("pdf.png");
				if(articulo.getUrlArchivo().endsWith(".doc"))
					articulo.setImgArchivo("word.png");
			}
		}catch (SQLException e){
			lanzaExcepcion(e);
		}catch (Exception e){
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return articulo;
	}

	public boolean cambiaEstadoArticulo(String id, String estado){
		Connection cn=null;
		PreparedStatement ps=null;
		boolean retorno=false;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("cambiaEstadoArticulo"));
			ps.setInt(i++,Integer.parseInt(estado));
			ps.setLong(i++,Integer.parseInt(id));
			ps.executeUpdate();
			retorno=true;
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(ps);
			cerrar(cn);
		}
		return retorno;
	}
}
