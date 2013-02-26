package cidc.docsIndicadores.db;

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
import cidc.general.db.BaseDB;
import cidc.general.db.CursorDB;
import cidc.general.mails.EnvioMail;
import cidc.general.mails.Reporte;
import cidc.general.obj.Globales;

public class DocsIndicadoresDB extends BaseDB {

	public DocsIndicadoresDB(CursorDB c, int perfil)
	{
		super(c, perfil);
		// TODO Auto-generated constructor stub
		rb=ResourceBundle.getBundle("cidc.docsIndicadores.consultas");
	}

	public boolean insertaDocumento(InfoDocumentos info){
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("insertaDocumento"));
			ps.setString(i++, info.getNombre());
			if(info.getImagen()==null)
			{
				ps.setNull(i++, Types.VARCHAR);
			}
			else
			{
				ps.setString(i++, info.getImagen());
			}

			ps.setInt(i++, info.getTipodoc());
			ps.setInt(i++, info.getCategoria());
			ps.setInt(i++, info.getTipo());
			ps.setString(i++, info.getDescripcion());
			ps.setString(i++, info.getObservaciones());
			ps.setLong(i++, info.getUsuario());
			ps.executeUpdate();
			cn.commit();
			retorno=true;
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
		return retorno;
	}

	public int consultaIddoc(String indnomdocumento, int indtipodoc)
	{
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int i=1;
		int id = 0;
		try {
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("consultaIdDoc"));
			ps.setString(i++, indnomdocumento);
			ps.setInt(i++, indtipodoc);
			rs=ps.executeQuery();
			while(rs.next()){
				id = rs.getInt(1);
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
		return id;
	}

	public boolean insertaRAE(InfoRAE info, int iddoc)
	{
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("insertaRAE"));
			ps.setInt(i++, iddoc);
			ps.setString(i++, info.getApellidos());
			ps.setString(i++, info.getNombres());
			ps.setString(i++, info.getTitulo());
			ps.setString(i++, info.getFechapublicacion());
			ps.setString(i++, info.getCiudad());
			ps.setString(i++, info.getEditorial());
			ps.setInt(i++, info.getNumeropaginas());
			ps.setString(i++, info.getDirweb());
			ps.setString(i++, info.getFechaacceso());
			ps.setString(i++, info.getSintesisglobal());
			ps.setString(i++, info.getIdeacentral());
			ps.setInt(i++, info.getPaginaideacentral());
			ps.setString(i++, info.getConceptoscategorias());
			ps.setString(i++, info.getRef1());
			ps.setString(i++, info.getRef2());
			ps.setString(i++, info.getRef3());
			ps.setString(i++, info.getRef4());
			ps.setString(i++, info.getValoracioncritica());
			ps.setInt(i++, info.getVolumen());
			ps.setInt(i++, info.getNumcapitulo());
			ps.executeUpdate();
			cn.commit();
			retorno=true;
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
		return retorno;
	}

	public InfoRAE consultaDetalladaRAE (String idrae)
	{
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int i=1;
		InfoRAE info = new InfoRAE();
		try {
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("consultaRAE"));
			ps.setInt(i++, Integer.parseInt(idrae));
			rs = ps.executeQuery();
			if(rs.next())
			{
				i = 1;
				info.setIdrae(rs.getInt(i++));
				info.setIddoc(rs.getInt(i++));
				info.setApellidos(rs.getString(i++));
				info.setNombres(rs.getString(i++));
				info.setTitulo(rs.getString(i++));
				info.setFechapublicacion(rs.getString(i++));
				info.setCiudad(rs.getString(i++));
				info.setEditorial(rs.getString(i++));
				info.setNumeropaginas(rs.getInt(i++));
				info.setDirweb(rs.getString(i++));
				info.setFechaacceso(rs.getString(i++));
				info.setSintesisglobal(rs.getString(i++));
				info.setIdeacentral(rs.getString(i++));
				info.setPaginaideacentral(rs.getInt(i++));
				info.setConceptoscategorias(rs.getString(i++));
				info.setRef1(rs.getString(i++));
				info.setRef2(rs.getString(i++));
				info.setRef3(rs.getString(i++));
				info.setRef4(rs.getString(i++));
				info.setValoracioncritica(rs.getString(i++));
				info.setVolumen(rs.getInt(i++));
				info.setNumcapitulo(rs.getInt(i++));
			}
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
	return info;
	}

	public boolean actualizaRAE(InfoRAE info)
	{
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		boolean retorno = false;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps = cn.prepareStatement(rb.getString("actualizaRAE"));

			ps.setString(i++, info.getApellidos());
			ps.setString(i++, info.getNombres());
			ps.setString(i++, info.getTitulo());
			ps.setString(i++, info.getFechapublicacion());
			ps.setString(i++, info.getCiudad());
			ps.setString(i++, info.getEditorial());
			ps.setInt(i++, info.getNumeropaginas());
			ps.setString(i++, info.getDirweb());
			ps.setString(i++, info.getFechaacceso());
			ps.setString(i++, info.getSintesisglobal());
			ps.setString(i++, info.getIdeacentral());
			ps.setInt(i++, info.getPaginaideacentral());
			ps.setString(i++, info.getConceptoscategorias());
			ps.setString(i++, info.getRef1());
			ps.setString(i++, info.getRef2());
			ps.setString(i++, info.getRef3());
			ps.setString(i++, info.getRef4());
			ps.setString(i++, info.getValoracioncritica());
			ps.setInt(i++, info.getVolumen());
			ps.setInt(i++, info.getNumcapitulo());
			ps.setInt(i++, info.getIdrae());
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

	public int ultimoDocumento(){
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int i=1;
		int consecutivo = 0;
		try {
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("getIdDoc"));

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

	public List consultatipo (int tipo)
	{
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List lista = new ArrayList();
		InfoConsultas objDatos = null;
		try
		{
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("conTipoDocumento"));
			ps.setInt(1, (tipo));
			rs = ps.executeQuery();
			while(rs.next())
			{
				int i=1;
				objDatos = new InfoConsultas();
				objDatos.setNombreusuario(rs.getString(i++));
				objDatos.setIddoc(rs.getInt(i++));
				objDatos.setIndnomdocumento(rs.getString(i++));
				objDatos.setIndnomimagen(rs.getString(i++));
				objDatos.setIndtipodoc(rs.getInt(i++));
				objDatos.setIndcategoria(rs.getInt(i++));
				objDatos.setIndtipo(rs.getInt(i++));
				objDatos.setInddescripcion(rs.getString(i++));
				objDatos.setIndobservaciones(rs.getString(i++));
				lista.add(objDatos);
			}
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
		return lista;
	}

	public List consultacategoria(int categoria, String tipo)
	{
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List lista = new ArrayList();
		InfoConsultas objDatos = null;
		try
		{
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("conCategoria"));
			ps.setInt(1, (categoria));
			ps.setString(2, (tipo));
			rs = ps.executeQuery();
			while(rs.next())
			{
				int i=1;
				objDatos = new InfoConsultas();
				objDatos.setNombreusuario(rs.getString(i++));
				objDatos.setIddoc(rs.getInt(i++));
				objDatos.setIndnomdocumento(rs.getString(i++));
				objDatos.setIndnomimagen(rs.getString(i++));
				objDatos.setIndtipodoc(rs.getInt(i++));
				objDatos.setIndcategoria(rs.getInt(i++));
				objDatos.setIndtipo(rs.getInt(i++));
				objDatos.setInddescripcion(rs.getString(i++));
				objDatos.setIndobservaciones(rs.getString(i++));
				lista.add(objDatos);
			}
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
		return lista;
	}

	public List consultaGeneral()
	{
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List lista = new ArrayList();
		InfoConsultas objDatos = null;
		try
		{
			cn=cursor.getConnection(super.perfil);
			cn.setAutoCommit(false);
			ps=cn.prepareStatement(rb.getString("conGeneral"));
			rs = ps.executeQuery();
			while(rs.next())
			{
				int i=1;
				objDatos = new InfoConsultas();
				objDatos.setNombreusuario(rs.getString(i++));
				objDatos.setIddoc(rs.getInt(i++));
				objDatos.setIndnomdocumento(rs.getString(i++));
				objDatos.setIndnomimagen(rs.getString(i++));
				objDatos.setIndtipodoc(rs.getInt(i++));
				objDatos.setIndcategoria(rs.getInt(i++));
				objDatos.setIndtipo(rs.getInt(i++));
				objDatos.setInddescripcion(rs.getString(i++));
				objDatos.setIndobservaciones(rs.getString(i++));
				lista.add(objDatos);
			}
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
		return lista;
	}

	public boolean enviarMail(InfoDocumentos infodocs, String nombrepersona)
	{
		boolean retorno=false;
		String []destino={"andresmora20@gmail.com", "giroberbo@gmail.com", "miratonera@gmail.com", "malyolita@gmail.com","sigud-meci@udistrital.edu.co"};
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String consMail=null;
		try {
			cn = cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getIdmail"));
			rs=ps.executeQuery();
			while(rs.next()){
				consMail=rs.getString(1);
			}
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			lanzaExcepcion(e1);
		}

		ResourceBundle rb1= ResourceBundle.getBundle("cidc.general.mails.correoRAE");
		Globales gl=new Globales();
		StringBuffer texto=new StringBuffer();
		texto.append("<b>CIDC "+consMail+"-"+gl.getAnoCortoHoy()+"</b><br><br>");
		texto.append(rb1.getString("nc1")+"  <b>Usuarios</b>");
		texto.append(rb1.getString("nc2"));
		texto.append(rb1.getString("nc3")+"  <b>"+infodocs.getNombre()+"</br>");
		texto.append(rb1.getString("nc4")+"  <b>"+infodocs.getDescripcion()+"</br>");
		texto.append(rb1.getString("nc5")+"  <b>"+infodocs.getObservaciones()+"</br>");
		texto.append(rb1.getString("nc6")+"  <b>"+nombrepersona+"</br>");
		texto.append(rb1.getString("nc7"));
		texto.append(rb1.getString("nc8"));
		texto.append(rb1.getString("nc9"));
		EnvioMail mail=new EnvioMail("siciud");
		try
		{
			mail.enviar(destino,"Archivos Sistema de Indicadores",""+texto);
			Reporte reporteMail=new Reporte(cursor,super.perfil);
			reporteMail.reportar(nombrepersona,"Archivos Sistema de Indicadores",destino[0],consMail);
			retorno=true;
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			lanzaExcepcion(e);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			lanzaExcepcion(e);
		}
		return retorno;
	}
}