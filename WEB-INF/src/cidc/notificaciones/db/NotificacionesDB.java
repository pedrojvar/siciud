package cidc.notificaciones.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import cidc.general.db.BaseDB;
import cidc.general.db.CursorDB;
import cidc.general.login.Usuario;
import cidc.notificaciones.obj.DatosPersona;
import cidc.notificaciones.obj.FiltroPersona;
import cidc.notificaciones.obj.Notificacion;
import cidc.notificaciones.obj.Perfiles;

public class NotificacionesDB extends BaseDB{

	public NotificacionesDB(CursorDB c, int p) {
		super(c, p);
		// TODO Auto-generated constructor stub
		rb=ResourceBundle.getBundle("cidc.notificaciones.consultas");
	}
	public boolean nuevaNotificacion(Notificacion notificacion) {
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("nuevaNotificacion"));

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

	public List getListaNotificaciones(Usuario usuario){
		List lista = new ArrayList ();
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		Notificacion notificacion=null;
		String []perfiles=null;
		int i=1;
		try {
			perfiles=usuario.getPerfilComp().split(",");
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getListaNotificaciones"));
			ps.setLong(i++, usuario.getIdUsuario());
			ps.setLong(i++, usuario.getIdUsuario());
			ps.setInt(i++, Integer.parseInt(perfiles[0]));
			ps.setInt(i++, Integer.parseInt(perfiles[1]));
			ps.setInt(i++, Integer.parseInt(perfiles[2]));
			ps.setLong(i++, usuario.getIdUsuario());
			rs=ps.executeQuery();
			while(rs.next()){
				i=1;
				notificacion= new Notificacion();
				notificacion.setIdNotificacion(rs.getLong(i++));
				notificacion.setDescripcion(rs.getString(i++));
				notificacion.setFechaPublicacion(rs.getString(i++));
				notificacion.setNivel(rs.getInt(i++));
				notificacion.setAsigPor(rs.getString(i++));
				notificacion.setEstado(rs.getInt(i++));
				lista.add(notificacion);
			}
		}catch (SQLException e) {
			System.out.println("---error con el perfil -->"+usuario.getPerfilComp() +" de "+usuario.getIdUsuario());
			lanzaExcepcion(e);
		}catch (Exception e) {
			System.out.println("Error en la consulta de notificaciones con el usuario:"+usuario.getIdUsuario());
			lanzaExcepcion(e);
		}finally{
			cerrar(ps);
		}
		return lista;
	}

	public boolean cambiaEstado(String id,String estado,long usuario ) {
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("buscaNotificacion"));
			ps.setInt(i++,Integer.parseInt(estado));
			ps.setLong(i++, usuario);
			rs=ps.executeQuery();
			if(rs.next()){
				i=1;
				ps=cn.prepareStatement(rb.getString("cambiaEstado"));
				ps.setInt(i++,Integer.parseInt(estado));
				ps.setInt(i++,Integer.parseInt(id));
				ps.setLong(i++, usuario);
				ps.executeUpdate();
			}else{
				i=1;
				ps=cn.prepareStatement(rb.getString("insertaEstadoIndividual"));
				ps.setInt(i++,Integer.parseInt(id));
				ps.setLong(i++, usuario);
				ps.setInt(i++,Integer.parseInt(estado));
				ps.executeUpdate();
			}


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

	public List getListaPerfiles(){
		List lista = new ArrayList ();
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		Perfiles perfil=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getListaPerfiles"));
			rs=ps.executeQuery();
			while(rs.next()){
				i=1;
				perfil= new Perfiles();
				perfil.setId(rs.getInt(i++));
				perfil.setNombre(rs.getString(i++));
				lista.add(perfil);
			}
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(ps);
		}
		return lista;
	}
	public List getBuscarPersonas(FiltroPersona datos){
		List lista = new ArrayList ();
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		DatosPersona persona=null;
		int i=1;
		try {
			if(datos!=null){
				cn=cursor.getConnection(super.perfil);
				if(!datos.getDocumento().equals("%%") && !datos.getDocumento().equals("%"))
					ps=cn.prepareStatement(rb.getString("getBuscarPersonas"));
				else
					ps=cn.prepareStatement(rb.getString("getBuscarPersonas2"));
				ps.setString(i++, datos.getDocumento());
				ps.setString(i++, datos.getNombres());
				ps.setString(i++, datos.getApellidos());
				rs=ps.executeQuery();

				while(rs.next()){
					i=1;
					persona= new DatosPersona();
					persona.setIdPersona(rs.getLong(i++));
					persona.setDocumento(rs.getString(i++));
					persona.setNombres(rs.getString(i++));
					persona.setApellidos(rs.getString(i++));
					persona.setTipo(rs.getString(i++));
					lista.add(persona);
				}
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
	public boolean insertaNotificacion(FiltroPersona notificacion,long idPersona) {
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("insertaNotificacion"));
			if(notificacion.getPara()==1||notificacion.getPara()==3){
				ps.setNull(i++,Types.NULL);
				ps.setInt(i++,notificacion.getPerfil());
				ps.setString(i++,notificacion.getDescripcion());
				ps.setInt(i++,1);
				ps.setInt(i++,notificacion.getPrioridad());
				ps.setLong(i++, idPersona);
				ps.executeUpdate();
			}
			if(notificacion.getPara()==2||notificacion.getPara()==3){
				i=1;
				for(int j=0;j<notificacion.getPersona().length;j++){
					i=1;
					ps.setInt(i++,notificacion.getPersona()[j]);
					ps.setNull(i++,Types.NULL);
					ps.setString(i++,notificacion.getDescripcion());
					ps.setInt(i++,1);
					ps.setInt(i++,notificacion.getPrioridad());
					ps.setLong(i++, idPersona);
					ps.addBatch();
				}
				ps.executeBatch();
			}
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
}
