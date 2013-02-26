package cidc.indicadores.fichasIndicadores.db;

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

import cidc.indicadores.bancoVariables.obj.FiltroVariables;
import cidc.indicadores.bancoVariables.obj.InfoVariables;
import cidc.docsIndicadores.obj.InfoConsultas;
import cidc.docsIndicadores.obj.InfoDocumentos;
import cidc.docsIndicadores.obj.InfoRAE;
import cidc.indicadores.fichasIndicadores.obj.FichaIndicadores;
import cidc.indicadores.fichasIndicadores.obj.FiltroFichas;
import cidc.general.db.BaseDB;
import cidc.general.db.CursorDB;
import cidc.general.mails.EnvioMail;
import cidc.general.mails.Reporte;
import cidc.general.obj.Globales;

public class FichaIndicadoresDB extends BaseDB
{
	public FichaIndicadoresDB(CursorDB c, int perfil)
	{
		super(c, perfil);
		// TODO Auto-generated constructor stub
		rb=ResourceBundle.getBundle("cidc.indicadores.fichasIndicadores.consultas");
	}

	public int consultaIdFicha ()
	{
		int retorno =0;
		Connection cn=null;
		ResultSet rs=null;
		PreparedStatement ps=null;
		try
		{
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("consultaIdFicha"));
			rs = ps.executeQuery();
			if(rs.next())
			{
				retorno = rs.getInt(1);
			}
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
		return (retorno);
	}

	public boolean crearFicha(FichaIndicadores objFicha)
	{
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		int i=1;
		try
		{
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("crearFicha"));
			ps.setString(i++, objFicha.getIdentificador());
			ps.setInt(i++, objFicha.getModelo());
			ps.setInt(i++, objFicha.getProceso());
			ps.setInt(i++, objFicha.getSubproceso());
			ps.setString(i++, objFicha.getNombre());
			ps.setString(i++, objFicha.getDescripcion());
			ps.setString(i++, objFicha.getObjetivo());
			ps.setString(i++, objFicha.getMetodologia());
			ps.setString(i++, objFicha.getFechacorte());
			ps.setInt(i++, objFicha.getResponsable());
			ps.setString(i++, objFicha.getFuente());
			ps.setString(i++, objFicha.getDocsoporte());
			ps.setString(i++, objFicha.getTipograficatexto());
			ps.setString(i++, objFicha.getVariablestexto());
			ps.setString(i++, objFicha.getFormula());
			ps.setLong(i++, objFicha.getCreador());
			ps.setLong(i++, objFicha.getCreador());
			ps.executeUpdate();
			cn.commit();
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

		finally
		{
			cerrar(ps);
			cerrar(cn);
		}
		return retorno;
	}

	public List consultaListaFichas()
	{
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List lista = new ArrayList();
		FichaIndicadores objFicha = null;

		try
		{
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("consultaFichas"));
			rs = ps.executeQuery();
			while(rs.next())
			{
				int i=1;
				objFicha = new FichaIndicadores();
				objFicha.setId(rs.getInt(i++));
				objFicha.setIdentificador(rs.getString(i++));
				objFicha.setNombre(rs.getString(i++));
				objFicha.setDescripcion(rs.getString(i++));
				objFicha.setObjetivo(rs.getString(i++));
				objFicha.setFechacorte(rs.getString(i++));
				objFicha.setNombrecreador(rs.getString(i++));
				objFicha.setCreador(rs.getLong(i++));
				lista.add(objFicha);
			}
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
		return lista;
	}

	public List filtroFichas(FiltroFichas objFiltro)
	{
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		FichaIndicadores objFicha = null;
		List lista = new ArrayList();

		try
		{
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("filtroFicha"));
        	ps.setString(1, objFiltro.getIdentificador());
			ps.setString(2, objFiltro.getNombre());
			ps.setString(3, objFiltro.getResponsable());
			ps.setString(4, objFiltro.getModelo());
			rs = ps.executeQuery();
			while(rs.next())
			{
				int i=1;
				objFicha = new FichaIndicadores();
				objFicha.setId(rs.getInt(i++));
				objFicha.setIdentificador(rs.getString(i++));
				objFicha.setModelo(rs.getInt(i++));
				objFicha.setProceso(rs.getInt(i++));
				objFicha.setSubproceso(rs.getInt(i++));
				objFicha.setNombre(rs.getString(i++));
				objFicha.setDescripcion(rs.getString(i++));
				objFicha.setObjetivo(rs.getString(i++));
				objFicha.setMetodologia(rs.getString(i++));
				objFicha.setFechacorte(rs.getString(i++));
				objFicha.setResponsable(rs.getInt(i++));
				objFicha.setFuente(rs.getString(i++));
				objFicha.setDocsoporte(rs.getString(i++));
				objFicha.setTipograficatexto(rs.getString(i++));
				objFicha.setVariablestexto(rs.getString(i++));
				objFicha.setFormula(rs.getString(i++));
				objFicha.setCreador(rs.getLong(i++));
				objFicha.setNombrecreador(rs.getString(i++));
				lista.add(objFicha);
			}
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

		return lista;
	}

	public FichaIndicadores variablesReporte(String idind)
	{
		String retorno ="";
		Connection cn=null;
		ResultSet rs=null;
		PreparedStatement ps=null;
		FichaIndicadores objFicha = new FichaIndicadores();
		try
		{
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("variablesReporte"));
			ps.setInt(1, Integer.parseInt(idind));
			rs = ps.executeQuery();
			if(rs.next())
			{
				int i=1;
				objFicha.setVariablestexto(rs.getString(i++));
				objFicha.setTipograficatexto(rs.getString(i++));
			}
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
		return objFicha;
	}

	public FichaIndicadores consultaInfoFicha(String idind)
	{
		Connection cn=null;
		ResultSet rs=null;
		PreparedStatement ps=null;
		FichaIndicadores objFicha = new FichaIndicadores();
		try
		{
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("consultaInfoFicha"));
			ps.setInt(1, Integer.parseInt(idind));
			rs = ps.executeQuery();
			if(rs.next())
			{
				int i=1;
				objFicha.setId(Integer.parseInt(idind));
				objFicha.setIdentificador(rs.getString(i++));
				objFicha.setModelo(rs.getInt(i++));
				objFicha.setProceso(rs.getInt(i++));
				objFicha.setSubproceso(rs.getInt(i++));
				objFicha.setNombre(rs.getString(i++));
				objFicha.setDescripcion(rs.getString(i++));
				objFicha.setObjetivo(rs.getString(i++));
				objFicha.setMetodologia(rs.getString(i++));
				objFicha.setFechacorte(rs.getString(i++));
				objFicha.setResponsable(rs.getInt(i++));
				objFicha.setFuente(rs.getString(i++));
				objFicha.setDocsoporte(rs.getString(i++));
				objFicha.setTipograficatexto(rs.getString(i++));
				objFicha.setVariablestexto(rs.getString(i++));
				objFicha.setFormula(rs.getString(i++));
				objFicha.setCreador(rs.getLong(i++));
				objFicha.setVariables(objFicha.getVariablestexto().split(","));
			}
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
		return objFicha;
	}

	public boolean actualizarInfoFicha(FichaIndicadores objFicha)
	{
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		int i=1;
		try
		{
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("actualizarInfoFicha"));
			ps.setString(i++, objFicha.getNombre());
			ps.setString(i++, objFicha.getDescripcion());
			ps.setString(i++, objFicha.getObjetivo());
			ps.setString(i++, objFicha.getMetodologia());
			ps.setString(i++, objFicha.getFechacorte());
			ps.setInt(i++, objFicha.getResponsable());
			ps.setString(i++, objFicha.getFuente());
			ps.setString(i++, objFicha.getDocsoporte());
			ps.setString(i++, objFicha.getTipograficatexto());
			ps.setString(i++, objFicha.getVariablestexto());
			ps.setString(i++, objFicha.getFormula());
			ps.setLong(i++, objFicha.getModificador());
			ps.setLong(i++, objFicha.getId());
			ps.executeUpdate();
			cn.commit();
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

		finally
		{
			cerrar(ps);
			cerrar(cn);
		}
		return retorno;
	}

	public boolean eliminaFicha(String idind)
	{
		boolean retorno = false;
		Connection cn=null;
		ResultSet rs=null;
		PreparedStatement ps=null;
		try
		{
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("eliminaFicha"));
			ps.setInt(1, Integer.parseInt(idind));
			ps.executeUpdate();
			retorno = true;
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
}