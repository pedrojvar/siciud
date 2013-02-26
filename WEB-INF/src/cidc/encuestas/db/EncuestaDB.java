package cidc.encuestas.db;

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

import cidc.docsIndicadores.obj.InfoConsultas;
import cidc.docsIndicadores.obj.InfoDocumentos;
import cidc.docsIndicadores.obj.InfoRAE;
import cidc.encuestas.obj.InfoConsulta;
import cidc.encuestas.obj.InfoEncuesta;
import cidc.general.db.BaseDB;
import cidc.general.db.CursorDB;
import cidc.general.mails.EnvioMail2;
import cidc.general.mails.Reporte;
import cidc.general.obj.Globales;

public class EncuestaDB extends BaseDB {

	public EncuestaDB(CursorDB c, int perfil)
	{
		super(c, perfil);
		// TODO Auto-generated constructor stub
		rb=ResourceBundle.getBundle("cidc.encuestas.consultas");
	}

	public int numEncuestador (long idEncuestador)
	{
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int i=1;
		int consecutivo = 0;
		try {
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("numEncuestador"));
			ps.setLong(1, idEncuestador);

			rs=ps.executeQuery();
			while(rs.next()){
				consecutivo = rs.getInt(1);
			}
			cn.commit();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			lanzaExcepcion(e);
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			lanzaExcepcion(e);
		}finally{
			cerrar(ps);
			cerrar(cn);
		}
		return consecutivo;
	}

	public int numGeneral ()
	{
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int i=1;
		int consecutivo = 0;
		try {
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("numGeneral"));

			rs=ps.executeQuery();
			while(rs.next()){
				consecutivo = rs.getInt(1);
			}
			cn.commit();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			lanzaExcepcion(e);
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			lanzaExcepcion(e);
		}finally{
			cerrar(ps);
			cerrar(cn);
		}
		return consecutivo;
	}

	public int consultaEncuesta (int tipo, int facultad)
	{
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int i=1;
		int consecutivo = 0;
		try {
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("consultaNumEncuesta"));
			ps.setInt(1, facultad);
			ps.setInt(2, tipo);

			rs=ps.executeQuery();
			while(rs.next()){
				consecutivo = rs.getInt(1);
			}
			cn.commit();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			lanzaExcepcion(e);
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			lanzaExcepcion(e);
		}finally{
			cerrar(ps);
			cerrar(cn);
		}
		return consecutivo;
	}

	public int ultimaEncuesta ()
	{
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int i=1;
		int consecutivo = 0;
		try {
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("ultimaEncuesta"));

			rs=ps.executeQuery();
			while(rs.next()){
				consecutivo = rs.getInt(1);
			}
			cn.commit();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			lanzaExcepcion(e);
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			lanzaExcepcion(e);
		}finally{
			cerrar(ps);
			cerrar(cn);
		}
		return consecutivo;
	}

	public boolean insertaEncuesta(InfoEncuesta info)
	{
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int i=1;
		try
		{
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("insertaFormulario"));
			ps.setLong(i++, info.getIddoc());
			ps.executeUpdate();
			retorno=true;
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			lanzaExcepcion(e);
		}
		catch (Exception e)
		{
			// TODO Auto-generated catch block
			lanzaExcepcion(e);
		}

		i=1;
		try
		{
			ps=cn.prepareStatement(rb.getString("insertaEncuesta"));
			ps.setString(i++, "A");
			ps.setInt(i++, info.getPersona());
			ps.setString(i++, "");
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "B");
			ps.setInt(i++, info.getFacultadencuesta());
			ps.setString(i++, "");
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "C");
			ps.setInt(i++, info.getGenero());
			ps.setString(i++, "");
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "D");
			ps.setInt(i++, info.getEdad());
			ps.setString(i++, "");
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "E");
			ps.setInt(i++, 0);
			ps.setString(i++, info.getProfesion());
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "F");
			ps.setInt(i++, info.getEstrato());
			ps.setString(i++, "");
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "G");
			ps.setInt(i++, info.getLocalidad());
			ps.setString(i++, info.getExtlocalidad());
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "H.1");
			ps.setInt(i++, info.getFacultad());
			ps.setString(i++, "");
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "H.2");
			ps.setInt(i++, info.getTipo());
			ps.setString(i++, "");
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "H.3");
			ps.setInt(i++, info.getSemestre());
			ps.setString(i++, "");
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "I");
			ps.setInt(i++, 0);
			ps.setString(i++, info.getObservaciones());
			ps.executeUpdate();
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			lanzaExcepcion(e);
		}
		catch (Exception e)
		{
			// TODO Auto-generated catch block
			lanzaExcepcion(e);
		}

		////////////// cierre elementos generales

		i=1;
		try
		{
			ps.setString(i++, "1");
			ps.setInt(i++, info.getP1());
			ps.setString(i++, info.getExtp1());
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "2");
			ps.setInt(i++, info.getP2());
			ps.setString(i++, "");
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "3A");
			ps.setInt(i++, 0);
			ps.setString(i++, String.valueOf(info.getP3a()));
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "3B");
			ps.setInt(i++, 0);
			ps.setString(i++, String.valueOf(info.getP3b()));
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "3C");
			ps.setInt(i++, 0);
			ps.setString(i++, String.valueOf(info.getP3c()));
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "3D");
			ps.setInt(i++, 0);
			ps.setString(i++, String.valueOf(info.getP3d()));
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "3E");
			ps.setInt(i++, 0);
			ps.setString(i++, String.valueOf(info.getP3e()));
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "3");
			ps.setInt(i++, 0);
			ps.setString(i++, info.getExtp3());
			ps.executeUpdate();

			i=1;
			for(int j=0;j<info.getP4().length;j++)
			{
				i=1;
				ps.setString(i++, "4");
				ps.setInt(i++, info.getP4()[j]);
				ps.setString(i++, "");
				ps.addBatch();

			}
			ps.executeBatch();

			i=1;
			for(int j=0;j<info.getP5().length;j++)
			{
				i=1;
				ps.setString(i++, "5");
				ps.setInt(i++, info.getP5()[j]);
				ps.setString(i++, "");
				ps.addBatch();

			}
			ps.executeBatch();

			i=1;
			ps.setString(i++, "5A");
			ps.setInt(i++, 0);
			ps.setString(i++, info.getExtp5());
			ps.executeUpdate();

			i=1;
			ps.setString(i++, "6");
			ps.setInt(i++, info.getP6());
			ps.setString(i++, info.getExtp6());
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "7A");
			ps.setInt(i++, 0);
			ps.setString(i++, String.valueOf(info.getP7a()));
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "7B");
			ps.setInt(i++, 0);
			ps.setString(i++, String.valueOf(info.getP7b()));
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "7C");
			ps.setInt(i++, 0);
			ps.setString(i++, String.valueOf(info.getP7c()));
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "7D");
			ps.setInt(i++, 0);
			ps.setString(i++, String.valueOf(info.getP7d()));
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "7E");
			ps.setInt(i++, 0);
			ps.setString(i++, String.valueOf(info.getP7e()));
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "7");
			ps.setInt(i++, 0);
			ps.setString(i++, info.getExtp7());
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "7.1");
			ps.setInt(i++, info.getP71());
			ps.setString(i++, info.getExtp71());
			ps.executeUpdate();

		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			lanzaExcepcion(e);
		}
		catch (Exception e)
		{
			// TODO Auto-generated catch block
			lanzaExcepcion(e);
		}

		////////////// cierre preguntas 1 a 7

		i=1;
		try
		{
			ps.setString(i++, "8");
			ps.setInt(i++, info.getP8());
			ps.setString(i++, info.getExtp8());
			ps.executeUpdate();

			i=1;
			for(int j=0;j<info.getP9().length;j++)
			{
				i=1;
				ps.setString(i++, "9");
				ps.setInt(i++, info.getP9()[j]);
				ps.setString(i++, "");
				ps.addBatch();

			}
			ps.executeBatch();

			i=1;
			ps.setString(i++, "10");
			ps.setInt(i++, info.getP10());
			ps.setString(i++, info.getExtp10());
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "11");
			ps.setInt(i++, info.getP11());
			ps.setString(i++, "");
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "12");
			ps.setInt(i++, info.getP12());
			ps.setString(i++, info.getExtp12());
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "13");
			ps.setInt(i++, info.getP13());
			ps.setString(i++, info.getExtp13());
			ps.executeUpdate();

			i=1;
			for(int j=0;j<info.getP131().length;j++)
			{
				i=1;
				ps.setString(i++, "13.1");
				ps.setInt(i++, info.getP131()[j]);
				ps.setString(i++, "");
				ps.addBatch();

			}
			ps.executeBatch();

			i=1;
			ps.setString(i++, "13.1A");
			ps.setInt(i++, 0);
			ps.setString(i++, info.getExtp131());
			ps.executeUpdate();

			i=1;
			ps.setString(i++, "14");
			ps.setInt(i++, info.getP14());
			ps.setString(i++, info.getExtp14());
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "15");
			ps.setInt(i++, info.getP15());
			ps.setString(i++, "");
			ps.executeUpdate();

			i=1;
			for(int j=0;j<info.getP151().length;j++)
			{
				i=1;
				ps.setString(i++, "15.1");
				ps.setInt(i++, info.getP151()[j]);
				ps.setString(i++, "");
				ps.addBatch();

			}
			ps.executeBatch();

			i=1;
			ps.setString(i++, "16");
			ps.setInt(i++, info.getP16());
			ps.setString(i++, info.getExtp16());
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "17A");
			ps.setInt(i++, 0);
			ps.setString(i++, String.valueOf(info.getP17a()));
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "17B");
			ps.setInt(i++, 0);
			ps.setString(i++, String.valueOf(info.getP17b()));
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "17C");
			ps.setInt(i++, 0);
			ps.setString(i++, String.valueOf(info.getP17c()));
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "17");
			ps.setInt(i++, 0);
			ps.setString(i++, info.getExtp17());
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "18");
			ps.setInt(i++, info.getP18());
			ps.setString(i++, info.getExtp18());
			ps.executeUpdate();

			i=1;
			for(int j=0;j<info.getP19().length;j++)
			{
				i=1;
				ps.setString(i++, "19");
				ps.setInt(i++, info.getP19()[j]);
				ps.setString(i++, "");
				ps.addBatch();

			}
			ps.executeBatch();

			i=1;
			ps.setString(i++, "19A");
			ps.setInt(i++, 0);
			ps.setString(i++, info.getExtp19());
			ps.executeUpdate();

			i=1;
			ps.setString(i++, "20");
			ps.setInt(i++, info.getP20());
			ps.setString(i++, info.getExtp20());
			ps.executeUpdate();
			i=1;
			ps.setString(i++, "21");
			ps.setInt(i++, info.getP21());
			ps.setString(i++, "");
			ps.executeUpdate();

			cn.commit();
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			lanzaExcepcion(e);
		}
		catch (Exception e)
		{
			// TODO Auto-generated catch block
			lanzaExcepcion(e);
		}

		finally
		{
			cerrar(ps);
			cerrar(cn);
		}
		return retorno;
	}

	public List consultaEncuesta (int idEncuesta)
	{
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List lista = new ArrayList();
		InfoConsulta objDatos = null;
		try
		{
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("consultaEncuesta"));
			ps.setInt(1, (idEncuesta));
			rs = ps.executeQuery();
			while(rs.next())
			{
				int i=1;
				objDatos = new InfoConsulta();
				objDatos.setIdpregunta(rs.getString(i++));
				objDatos.setPregunta(rs.getString(i++));
				objDatos.setValor1(rs.getString(i++));
				objDatos.setValor2(rs.getString(i++));
				lista.add(objDatos);
			}
		}catch (SQLException e)
		{
			// TODO Auto-generated catch block
			lanzaExcepcion(e);
		}
		catch (Exception e)
		{
			// TODO Auto-generated catch block
			lanzaExcepcion(e);
		}
		finally
		{
			cerrar(ps);
			cerrar(cn);
		}
		return lista;
	}
}