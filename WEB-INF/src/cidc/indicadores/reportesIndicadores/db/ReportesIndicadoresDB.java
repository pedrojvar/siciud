package cidc.indicadores.reportesIndicadores.db;

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

import cidc.indicadores.bancoVariables.obj.InfoVariables;
import cidc.docsIndicadores.obj.InfoConsultas;
import cidc.docsIndicadores.obj.InfoDocumentos;
import cidc.docsIndicadores.obj.InfoRAE;
import cidc.indicadores.fichasIndicadores.obj.FichaIndicadores;
import cidc.general.db.BaseDB;
import cidc.general.db.CursorDB;
import cidc.general.mails.EnvioMail;
import cidc.general.mails.Reporte;
import cidc.general.obj.Globales;

public class ReportesIndicadoresDB extends BaseDB
{
	public ReportesIndicadoresDB(CursorDB c, int perfil)
	{
		super(c, perfil);
		// TODO Auto-generated constructor stub
		rb=ResourceBundle.getBundle("cidc.indicadores.reportesIndicadores.consultas");
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
			ps.setString(1, idind);
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
}