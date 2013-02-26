package cidc.indicadores.bancoVariables.db;

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
import cidc.general.db.BaseDB;
import cidc.general.db.CursorDB;
import cidc.general.mails.EnvioMail;
import cidc.general.mails.Reporte;
import cidc.general.obj.Globales;

public class BancoVariablesDB extends BaseDB
{
	public BancoVariablesDB(CursorDB c, int perfil)
	{
		super(c, perfil);
		// TODO Auto-generated constructor stub
		rb=ResourceBundle.getBundle("cidc.indicadores.bancoVariables.consultas");
	}

	public List consultaListaVariables()
	{
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List lista = new ArrayList();
		InfoVariables objVariables = null;

		try
		{
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("consultaVariables"));
			rs = ps.executeQuery();
			while(rs.next())
			{
				int i=1;
				objVariables = new InfoVariables();
				objVariables.setIdentificador(rs.getString(i++));
				objVariables.setNombre(rs.getString(i++));
				objVariables.setResponsable(rs.getInt(i++));
				objVariables.setDescripcion(rs.getString(i++));
				objVariables.setFechacreacion(rs.getString(i++));
				objVariables.setFechaactualizacion(rs.getString(i++));
				objVariables.setDato(rs.getLong(i++));
				objVariables.setCreador(rs.getLong(i++));
				lista.add(objVariables);
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

	public List filtroVariables(FiltroVariables objFiltro)
	{
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List lista = new ArrayList();
		InfoVariables objVariables = null;

		try
		{
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("filtroVariables"));
        	ps.setString(1, objFiltro.getIdentificador());
			ps.setString(2, objFiltro.getNombre());
			ps.setString(3, objFiltro.getResponsable());
			rs = ps.executeQuery();
			while(rs.next())
			{
				int i=1;
				objVariables = new InfoVariables();
				objVariables.setIdentificador(rs.getString(i++));
				objVariables.setNombre(rs.getString(i++));
				objVariables.setResponsable(rs.getInt(i++));
				objVariables.setDescripcion(rs.getString(i++));
				objVariables.setFechacreacion(rs.getString(i++));
				objVariables.setFechaactualizacion(rs.getString(i++));
				objVariables.setDato(rs.getLong(i++));
				objVariables.setCreador(rs.getLong(i++));
				lista.add(objVariables);
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

	public List consultaMisVariables(int responsable)
	{
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List lista = new ArrayList();
		InfoVariables objVariables = null;

		try
		{
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("consultaMisVariables"));
			ps.setInt(1, responsable);
			rs = ps.executeQuery();
			while(rs.next())
			{
				int i=1;
				objVariables = new InfoVariables();
				objVariables.setIdentificador(rs.getString(i++));
				objVariables.setNombre(rs.getString(i++));
				objVariables.setDescripcion(rs.getString(i++));
				objVariables.setFechacreacion(rs.getString(i++));
				objVariables.setDato(rs.getLong(i++));
				lista.add(objVariables);
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

	public boolean crearVariable(InfoVariables objVariable)
	{
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		int i=1;
		try
		{
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("crearVariable"));
			ps.setString(i++, objVariable.getIdentificador());
			ps.setString(i++, objVariable.getNombre());
			ps.setInt(i++, objVariable.getResponsable());
			ps.setString(i++, objVariable.getDescripcion());
			ps.setInt(i++, objVariable.getPeriodo());
			ps.setInt(i++, objVariable.getUnidad());
			ps.setString(i++, objVariable.getTipograficatexto());
			ps.setString(i++, objVariable.getFechacreacion());
			ps.setString(i++, objVariable.getFechacreacion());
			ps.setLong(i++, objVariable.getCreador());
			ps.setLong(i++, objVariable.getCreador());
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

	public boolean actualizarVariable(String idvariable, Long dato)
	{
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		boolean retorno = false;
		int i=1;
		try
		{
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps = cn.prepareStatement(rb.getString("actualizarVariable"));
			ps.setLong(i++, dato);
			ps.setString(i++, idvariable);
			ps.executeUpdate();
			cn.commit();
			retorno = true;
		}
		catch (SQLException e) {
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
		return retorno;

	}

	public boolean consultaIdVariable (String idVariable)
	{
		boolean retorno=false;
		Connection cn=null;
		ResultSet rs=null;
		PreparedStatement ps=null;
		int i=1;
		try
		{
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("consultaIdVariable"));
			ps.setString(i++, idVariable);
			rs = ps.executeQuery();
			if(rs.next())
			{
				retorno = false;
			}
			else
			{
				retorno = true;
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
		return retorno;
	}

	public InfoVariables consultaInfoVariableModificar (String idVariable)
	{
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		InfoVariables objVariable = null;

		try
		{
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("consultaInfoVariableModificar"));
			ps.setString(1, idVariable);
			rs = ps.executeQuery();
			while(rs.next())
			{
				int i=1;
				objVariable = new InfoVariables();
				objVariable.setIdentificador(rs.getString(i++));
				objVariable.setNombre(rs.getString(i++));
				objVariable.setResponsable(rs.getInt(i++));
				objVariable.setDescripcion(rs.getString(i++));
				objVariable.setPeriodo(rs.getInt(i++));
				objVariable.setUnidad(rs.getInt(i++));
				objVariable.setTipograficatexto(rs.getString(i++));
				objVariable.setDato(rs.getLong(i++));
				objVariable.setFechacreacion(rs.getString(i++));
				objVariable.setFechaactualizacion(rs.getString(i++));
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
		return objVariable;
	}

	public String[] llenarVariables(String []v)
	{
		String datos[]=new String[v.length];
		Connection cn=null;
		ResultSet rs=null;
		PreparedStatement ps=null;
		try
		{
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("datoVariable"));

			for(int i = 0; i<v.length; i++)
			{

				ps.setString(1, v[i]);
				rs = ps.executeQuery();
				if(rs.next())
				{
					datos[i]= String.valueOf(rs.getLong(1));
				}
				else
				{
					datos[i]="";
				}
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
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}

		return datos;
	}

	public List llenarDatosReporte(String []v)
	{
		String datos[]=new String[v.length];
		List lista = new ArrayList();
		Connection cn=null;
		ResultSet rs=null;
		PreparedStatement ps=null;
		InfoVariables objVariable = null;
		try
		{
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("datoVariable"));

			for(int i = 0; i<v.length; i++)
			{
				ps.setString(1, v[i]);
				rs = ps.executeQuery();
				if(rs.next())
				{
					datos[i]= String.valueOf(rs.getLong(1));
					objVariable = new InfoVariables();
					objVariable.setIdentificador(v[i]);
					objVariable.setDato(Long.parseLong(datos[i]));
					objVariable.setNombre(rs.getString(2));
					lista.add(objVariable);
				}
				else
				{
					datos[i]="";
				}
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
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}

		return lista;
	}

	public InfoVariables consultaInfoVariable (String idVariable)
	{
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		InfoVariables objVariable = null;

		try
		{
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("consultaInfoVariable"));
			ps.setString(1, idVariable);
			rs = ps.executeQuery();
			while(rs.next())
			{
				int i=1;
				objVariable = new InfoVariables();
				objVariable.setIdentificador(rs.getString(i++));
				objVariable.setNombre(rs.getString(i++));
				objVariable.setNombreresponsable(rs.getString(i++));
				objVariable.setNombrecreador(rs.getString(i++));
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
		return objVariable;
	}


	public boolean actualizarInfoVariable(InfoVariables objVariable)
	{
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		int i=1;
		try
		{
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("actualizarInfoVariable"));
			ps.setString(i++, objVariable.getNombre());
			ps.setInt(i++, objVariable.getResponsable());
			ps.setString(i++, objVariable.getDescripcion());
			ps.setInt(i++, objVariable.getPeriodo());
			ps.setInt(i++, objVariable.getUnidad());
			ps.setString(i++, objVariable.getTipograficatexto());
			ps.setLong(i++, objVariable.getModificador());
			ps.setString(i++, objVariable.getIdentificador());
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

	public List consultaVariableEnFicha(String idVariable)
	{
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List lista = new ArrayList();

		try
		{
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("buscarVariables"));
			ps.setString(1, "%" + idVariable + "%");
			rs = ps.executeQuery();
			while(rs.next())
			{
				lista.add(rs.getString(1));
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

	public boolean eliminaVariable(String idVariable)
	{
		boolean retorno = false;
		Connection cn=null;
		ResultSet rs=null;
		PreparedStatement ps=null;
		try
		{
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("eliminaVariable"));
			ps.setString(1, idVariable);
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

	public List consultaValorVariables (List listaVariables)
	{
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List listaValores = new ArrayList();

		try
		{
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("datoVariable"));

			for(int i = 0; i< listaVariables.size(); i++)
			{
				ps.setString(1, String.valueOf(listaVariables.get(i)));
				rs = ps.executeQuery();
				while(rs.next())
				{
					listaValores.add(rs.getString(1));
				}
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
		return listaValores;
	}
}