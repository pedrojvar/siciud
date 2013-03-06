package cidc.certificaciones.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cidc.general.db.CursorDB;
import cidc.general.db.BaseDB;
import cidc.general.obj.Globales;
import cidc.general.pdf.DocumentosPDF;
import cidc.certificaciones.obj.CertificacionesOBJ;
import cidc.convMovilidad.obj.InfoGeneral;

public class CertificadoDB extends BaseDB{
	public static char sep=java.io.File.separatorChar;
	
	public CertificadoDB(CursorDB c, int perfil) {
		super(c, perfil);
		rb=ResourceBundle.getBundle("cidc.certificaciones.consultas");
	}
	
	
	public CertificacionesOBJ crearcertificado1(CertificacionesOBJ certificado, String path, HttpServletResponse resp){
		System.out.println("Fucnion Certificado1");
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		DocumentosPDF pertenencia=null;
		String consec=null;
		String tabla=null;
		int i=1;
		int ano=Calendar.getInstance().get(Calendar.YEAR);
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("infoCertificado1"));
			ps.setLong(1,certificado.getIdPersona());
			ps.setLong(2,certificado.getIdGrupo());			
			System.out.println("Consulta: "+ps);
			rs=ps.executeQuery();
			while(rs.next()){
				consec=rs.getString(i++);				
				certificado.setNombreGrupo(rs.getString(i++));
				certificado.setIdGrupo(rs.getInt(i++));
				certificado.setNombre(rs.getString(i++));
				certificado.setCedula(rs.getString(i++));
				certificado.setNumCedDe(rs.getString(i++));
				certificado.setFecha_cert(rs.getString(i++));
				certificado.setNombreDirector(rs.getString(i++));
				certificado.setRol(rs.getString(i++));
				certificado.setTipo("1");
				certificado.setCategoriaGrupo(rs.getString(i++));
				if(tabla!=null)
					certificado.setConsCert(tabla);
				else
					certificado.setConsCert(consec);
				certificado.setCod_verificacion("CIDC_"+certificado.getTipo()+"_"+consec+"_"+ano);
				path+=sep+"Documentos"+sep+"Certificados"+sep+"CIDC_"+certificado.getTipo()+"_"+certificado.getConsCert()+"_"+ano+".pdf";
				String url="CIDC_"+certificado.getTipo()+"_"+certificado.getConsCert()+"_"+ano+".pdf";
				pertenencia=new DocumentosPDF();
				pertenencia.cearCertificado1(certificado, path, resp);				
				
				ps=cn.prepareStatement(rb.getString("crearCertificado"));
				ps.setString(1, certificado.getCuerpo_cer());
				ps.setString(2, certificado.getCod_verificacion());
				ps.setLong(3, certificado.getIdPersona());
				ps.setString(4, certificado.getCedula());
				ps.setString(5, url);
				ps.setInt(6, certificado.getIdGrupo());
				ps.execute();
				if(tabla==null){
					ps=cn.prepareStatement(rb.getString("Certificado++"));
					ps.execute();
				}
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
		
		return certificado;		
	}
	
	public List buscarCertificados(String cedula, String codVerificacion){
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		CertificacionesOBJ certificado=null;
		String cedu;
		String cod;
		List <CertificacionesOBJ>listacertificados=new ArrayList<CertificacionesOBJ>();		
		int i=1;
		try {
			if(cedula!=null){
				if(cedula.trim().equals(""))
					cedu="%";
				else
					cedu="%"+cedula+"%";
			}else
				cedu="%";
			if(codVerificacion!=null){
				if(codVerificacion.trim().equals(""))
					cod="%";
				else
					cod="%"+codVerificacion+"%";
			}else
				cod="%";
			System.out.println("CEDULA---->"+cedu+ " COD_VERIFICACIÓN--->"+cod);
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("BuscarCertificado"));
			ps.setString(1,cedu);
			ps.setString(2,cod);
			System.out.println("Consulta: "+ps);
			rs=ps.executeQuery();
			while(rs.next()){
				i=1;
				certificado=new CertificacionesOBJ();
				certificado.setId_certificaciones(rs.getInt(i++));
				certificado.setTipo(rs.getString(i++));
				certificado.setFecha_cert(rs.getString(i++));
				certificado.setCod_verificacion(rs.getString(i++));
				certificado.setAutomatico(rs.getBoolean(i++));
				certificado.setNombre(rs.getString(i++));
				certificado.setUrl(rs.getString(i++));				
				certificado.setNombreGrupo(rs.getString(i++));
				listacertificados.add(certificado);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return listacertificados;
	}
	
	public List buscarCertificadosPersona(long id_persona){
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		CertificacionesOBJ certificado=null;
		String cedu;
		String cod;
		List <CertificacionesOBJ>listacertificados=new ArrayList<CertificacionesOBJ>();		
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("BuscarCertificadoPersona"));
			ps.setLong(1,id_persona);			
			System.out.println("Consulta: "+ps);
			rs=ps.executeQuery();
			while(rs.next()){
				i=1;
				certificado=new CertificacionesOBJ();
				certificado.setId_certificaciones(rs.getInt(i++));
				certificado.setTipo(rs.getString(i++));
				certificado.setFecha_cert(rs.getString(i++));
				certificado.setCod_verificacion(rs.getString(i++));
				certificado.setAutomatico(rs.getBoolean(i++));
				certificado.setNombre(rs.getString(i++));
				certificado.setUrl(rs.getString(i++));				
				certificado.setNombreGrupo(rs.getString(i++));
				listacertificados.add(certificado);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return listacertificados;
	}
}
