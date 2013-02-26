package cidc.unidadInvestigacion.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import cidc.resultados.obj.DatosMovilidad;
import cidc.resultados.obj.ListaPropuesta;
import cidc.unidadInvestigacion.obj.FiltroProyecto;
import cidc.unidadInvestigacion.obj.GrupoInvest;
import cidc.unidadInvestigacion.obj.ProyCurricular;
import cidc.unidadInvestigacion.obj.Proyecto;
import cidc.adminGrupos.obj.GrupoInvestigacion;
import cidc.general.db.BaseDB;
import cidc.general.db.CursorDB;
import cidc.inscripcionConv.obj.ProyCurOBJ;


public class AdminUnidadDB extends BaseDB {

	public static char sep=java.io.File.separatorChar;

	public AdminUnidadDB(CursorDB c, int perfil) {
		super(c, perfil);
		rb=ResourceBundle.getBundle("cidc.unidadInvestigacion.consultas");
	}


	public List listaProyectoCur(int facultad) {
		List l=new ArrayList();
		ProyCurricular proyCurOBJ=null;
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			cn = cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("listaProyCurr"));
			ps.setLong(1,facultad);
			rs=ps.executeQuery();
			while(rs.next()){
				proyCurOBJ=new ProyCurricular();
				proyCurOBJ.setId(rs.getInt(1));
				proyCurOBJ.setNombre(rs.getString(2));
				l.add(proyCurOBJ);
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
		return l;
	}

	public List listaProyectos(int facultad, FiltroProyecto filtro) {
		List lista=new ArrayList();
		Proyecto proy=null;
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int i=1;
		try {
			cn = cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("listaConsultaProyNuevos"));
			ps.setString(i++,filtro.getEstado());
			ps.setString(i++,filtro.getTipo());
			ps.setString(i++,filtro.getIdGrupo());
			ps.setString(i++,filtro.getIdProyCurr());
			ps.setInt(i++,facultad);
			rs=ps.executeQuery();
			while(rs.next()){
				i=1;
				proy=new Proyecto();
				proy.setId(rs.getInt(i++));
				proy.setFlag(rs.getInt(i++));
				proy.setCodigo(rs.getString(i++));
				proy.setEstado(rs.getString(i++));
				proy.setDirector(rs.getString(i++));
				proy.setProyecto(rs.getString(i++));
				proy.setTipo(1);
				lista.add(proy);
			}
			i=1;
			ps=cn.prepareStatement(rb.getString("listaConsultaProyAntiguos"));
			ps.setString(i++,filtro.getEstado());
			ps.setString(i++,filtro.getTipo());
			ps.setString(i++,filtro.getIdGrupo());
			ps.setString(i++,filtro.getIdProyCurr());
			ps.setInt(i++,facultad);
			rs=ps.executeQuery();
		//	System.out.println("***-->"+ps);
			while(rs.next()){
				i=1;
				proy=new Proyecto();
				proy.setId(rs.getInt(i++));
				proy.setFlag(rs.getInt(i++));
				proy.setCodigo(rs.getString(i++));
				proy.setEstado(rs.getString(i++));
				proy.setDirector(rs.getString(i++));
				proy.setProyecto(rs.getString(i++));
				proy.setTipo(2);
				lista.add(proy);
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


	public Proyecto consultarProyecto(String idProyecto, String tipo) {
		Proyecto objProyecto=null;
		Connection cn = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    int i=1;
	        try {
	             cn = cursor.getConnection(super.perfil);
	             ps = cn.prepareStatement(rb.getString("consultarProyecto"+tipo));
	             ps.setInt(1, Integer.parseInt(idProyecto));
	             rs = ps.executeQuery();
	             while (rs.next()){
	                objProyecto=new Proyecto();
	                objProyecto.setId(rs.getInt(i++));
	                objProyecto.setCodigo(rs.getString(i++));
	                objProyecto.setFechaAprobado(rs.getString(i++));
	                objProyecto.setFechaInicio(rs.getString(i++));
	                objProyecto.setNombreProyCurr(rs.getString(i++));
	                objProyecto.setNombreGrupo(rs.getString(i++));
	                objProyecto.setDirector(rs.getString(i++));
	                objProyecto.setEstado(rs.getString(i++));
	                objProyecto.setProyecto(rs.getString(i++));
	                objProyecto.setNombreConvocatoria(rs.getString(i++));
	                objProyecto.setDuracion(rs.getString(i++));
	                objProyecto.setFechaTerminado(rs.getString(i++));
	            }
	        } catch (SQLException e) {lanzaExcepcion(e);}
		       catch (Exception e) {lanzaExcepcion(e);}
	        finally {
	             cerrar(rs);
	             cerrar(ps);
	             cerrar(cn);
            }
		return objProyecto;
	}

	public List listaGrupos(int facultad, String tipo) {
		List listaGrupos= new ArrayList();
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		GrupoInvest grupo=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("listaGrupos"));
			ps.setInt(i++, facultad);
			ps.setString(i++, tipo);
			rs=ps.executeQuery();
			while(rs.next()){
				i=1;
				grupo=new GrupoInvest();
				grupo.setIdGrupo(rs.getInt(i++));
				grupo.setNombreGrupo(rs.getString(i++));
				grupo.setDirector(rs.getString(i++));
				grupo.setEstado(rs.getString(i++));
				listaGrupos.add(grupo);
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
		return listaGrupos;
	}

}
