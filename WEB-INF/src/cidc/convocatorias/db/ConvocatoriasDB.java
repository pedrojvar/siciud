package cidc.convocatorias.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.sql.Types;
import java.util.ArrayList;

import java.util.List;
import java.util.ResourceBundle;

import cidc.general.obj.Globales;
import cidc.convocatorias.obj.AspectosOBJ;
import cidc.convocatorias.obj.CompromisosOBJ;
import cidc.convocatorias.obj.ConvocatoriaOBJ;
import cidc.convocatorias.obj.CriteriosOBJ;
import cidc.convocatorias.obj.EjesOBJ;
import cidc.convocatorias.obj.InsercionGralOBJ;
import cidc.convocatorias.obj.ParametrosOBJ;
import cidc.convocatorias.obj.RubrosOBJ;
import cidc.general.db.BaseDB;
import cidc.general.db.CursorDB;
import cidc.inscripcionConv.obj.ConvCorte;

public class ConvocatoriasDB extends BaseDB{

	public ConvocatoriasDB(CursorDB c, int perfil) {
		super(c, perfil);
		// TODO Auto-generated constructor stub
		rb=ResourceBundle.getBundle("cidc.convocatorias.consultas");
	}
	public List consultaCriterios(int consulta,long convocatoria){
		List l=new ArrayList();
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int i=0;
		try {
			cn=cursor.getConnection(super.perfil);
	//		System.out.println("Consulta="+consulta);
	//		System.out.println("Convocatoria="+convocatoria);
			ps=cn.prepareStatement(rb.getString("lista_criterios"+consulta));
			if(consulta==1)
				ps.setLong(1,convocatoria);
			rs=ps.executeQuery();

			while(rs.next()){
				i=1;
			//	System.out.println("encuentra criterios");
				CriteriosOBJ criteriosOBJ=new CriteriosOBJ();
				criteriosOBJ.setCodigo(rs.getInt(i++));
				criteriosOBJ.setNombre(rs.getString(i++));
				if(consulta==1){
					criteriosOBJ.setValor(rs.getFloat(i++));
		//			System.out.println("ingresa valor "+criteriosOBJ.getValor());
				}
				l.add(criteriosOBJ);
			}
		}catch (SQLException e) {
			lanzaExcepcion(e);
		} catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return l;
	}
	public List consultaCompromisos(int tipo, long conv){
		List l=new ArrayList();
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int i=0;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("lista_compromisos"+tipo));
			if(tipo!=0)
				ps.setLong(1,conv);
			rs=ps.executeQuery();

			while(rs.next()){
				i=1;
				CompromisosOBJ compromisosOBJ=new CompromisosOBJ();
				compromisosOBJ.setCodigo(rs.getInt(i++));
				compromisosOBJ.setNombre(rs.getString(i++));
				compromisosOBJ.setIndicador(rs.getString(i++));
				if(tipo!=0){
			//		System.out.println("entra");
					compromisosOBJ.setObligatorio(rs.getInt(i++));
				}
				l.add(compromisosOBJ);
			}
		} catch (SQLException e) {
			lanzaExcepcion(e);
		} catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return l;
	}
	public int getCantCompromisos(long conv){
		int i=0,retorno=0;
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getCantComp"));
			ps.setLong(1,conv);
			rs=ps.executeQuery();

			while(rs.next()){
				retorno=rs.getInt(1);
			}
		}catch (SQLException e) {
			lanzaExcepcion(e);
		} catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return retorno;
	}

	public List consultaEjes(int tipo,long convocatoria){
		List l=new ArrayList();
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int i=0;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("lista_ejes"+tipo));
		//	System.out.println("tipo= "+tipo);
			if(tipo==ParametrosOBJ.ListaEje)
				ps.setLong(1,convocatoria);
			rs=ps.executeQuery();

			while(rs.next()){
				i=1;
				EjesOBJ ejesOBJ=new EjesOBJ();
				ejesOBJ.setCodigo(rs.getInt(i++));
				ejesOBJ.setNombre(rs.getString(i++));
				l.add(ejesOBJ);
			}
		}catch (SQLException e) {
			lanzaExcepcion(e);
		} catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return l;
	}

	public List getDependencias(){
		List l=new ArrayList();
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		CriteriosOBJ crit=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getDependencias"));
			rs=ps.executeQuery();
			while(rs.next()){
				crit=new CriteriosOBJ();
				crit.setCodigo(rs.getInt(1));
				crit.setNombre(rs.getString(2));
				l.add(crit);
			}
		}catch (SQLException e){
			lanzaExcepcion(e);
		} catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return l;
	}

	public List getAspectosComite(String dependencia){
		List l=new ArrayList();
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int i=1;
		try {
			if(dependencia!=null && !dependencia.equals("null")){
				cn=cursor.getConnection(super.perfil);
				ps=cn.prepareStatement(rb.getString("lista_aspectos3"));
				ps.setInt(1,Integer.parseInt(dependencia));
				rs=ps.executeQuery();
				while(rs.next()){
					i=1;
					AspectosOBJ aspectosOBJ=new AspectosOBJ();
					aspectosOBJ.setCodigo(rs.getInt(i++));
					aspectosOBJ.setNombre(rs.getString(i++));
					l.add(aspectosOBJ);
				}
			}
		}catch (SQLException e) {
			lanzaExcepcion(e);
		} catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return l;
	}

	public int getComiteEvaluador(long conv){
		int comite=0;
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getComiteEval"));
			ps.setLong(1,conv);
			rs=ps.executeQuery();
			while(rs.next()){
				comite=rs.getInt(1);
			}
		}catch (SQLException e) {
			lanzaExcepcion(e);
		} catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return comite;
	}


	public List getAspectos3(ConvocatoriaOBJ convocatoriaOBJ){
		List l=new ArrayList();
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int i=1;
		try {
			if(convocatoriaOBJ!=null){
				cn=cursor.getConnection(super.perfil);
				ps=cn.prepareStatement(rb.getString("getAspGuardadosComite"));
				ps.setLong(1,convocatoriaOBJ.getConvId());
				rs=ps.executeQuery();
				while(rs.next()){
					l.add(rs.getString(1));
				}
			}
		}catch (SQLException e) {
			lanzaExcepcion(e);
		} catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return l;
	}

	public List consultaAspectos(int tipo,long convocatoria){
		List l=new ArrayList();
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("lista_aspectos"+tipo));
			if(tipo==ParametrosOBJ.ListaAspecto)
				ps.setLong(1,convocatoria);
			rs=ps.executeQuery();
		//	System.out.println("antes tipo="+tipo);
			while(rs.next()){
				i=1;
				AspectosOBJ aspectosOBJ=new AspectosOBJ();
				aspectosOBJ.setCodigo(rs.getInt(i++));
				aspectosOBJ.setCriterio(rs.getInt(i++));
				aspectosOBJ.setNombre(rs.getString(i++));
				if(tipo==ParametrosOBJ.ListaAspecto){
					aspectosOBJ.setValor(rs.getFloat(i++));
				}
				l.add(aspectosOBJ);
	//			System.out.println("Aspecto "+aspectosOBJ.getNombre());
			}
		}catch (SQLException e) {
			lanzaExcepcion(e);
		} catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return l;
	}
	public List listaConvocatorias(long convocatoria){
		List l=new ArrayList();
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("lista_convocatorias"+convocatoria));
			rs=ps.executeQuery();
			while(rs.next()){
				i=1;
				ConvocatoriaOBJ convocatoriaOBJ=new ConvocatoriaOBJ();
				convocatoriaOBJ.setConvId(rs.getLong(i++));
				convocatoriaOBJ.setConvAno(rs.getInt(i++));
				convocatoriaOBJ.setConvNumero(rs.getInt(i++));
				convocatoriaOBJ.setConvNombre(rs.getString(i++));
				l.add(convocatoriaOBJ);
			}
		} catch (SQLException e) {
			lanzaExcepcion(e);
		} catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return l;
	}

	public boolean insertaConvocatoria(ConvocatoriaOBJ convocatoriaOBJ){
		boolean retorno=false;
		List l=new ArrayList();
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("inserta_convocatoria"));

			ps.setInt(i++,convocatoriaOBJ.getConvAno());
			ps.setInt(i++,convocatoriaOBJ.getConvNumero());
			ps.setString(i++,convocatoriaOBJ.getConvNombre().toLowerCase());
			ps.setString(i++,convocatoriaOBJ.getConvCuantia());
			ps.setLong(i++,convocatoriaOBJ.getConvDuracion());
			ps.setString(i++,convocatoriaOBJ.getConvFecInicio());
			ps.setString(i++,convocatoriaOBJ.getConvFecFin());
			ps.setString(i++,convocatoriaOBJ.getConvDirigido());
			ps.setBoolean(i++,convocatoriaOBJ.isConvPublica());
			ps.setString(i++,convocatoriaOBJ.getCorteActual());
			ps.execute();
			retorno=true;
		} catch (SQLException e) {
			lanzaExcepcion(e);
			setMensaje("No se puede repetir el a�o y n�mero de la convocatoria");
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return retorno;
	}
	public boolean modificarConvocatoria(ConvocatoriaOBJ convocatoriaOBJ){
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("modificar_convocatoria"));

			ps.setInt(i++,convocatoriaOBJ.getConvAno());
			ps.setInt(i++,convocatoriaOBJ.getConvNumero());
			ps.setString(i++,convocatoriaOBJ.getConvNombre().toLowerCase());
			ps.setString(i++,convocatoriaOBJ.getConvCuantia());
			ps.setLong(i++,convocatoriaOBJ.getConvDuracion());
			ps.setString(i++,convocatoriaOBJ.getConvFecInicio());
			ps.setString(i++,convocatoriaOBJ.getConvFecFin());
			ps.setString(i++,convocatoriaOBJ.getConvDirigido());
			ps.setBoolean(i++,convocatoriaOBJ.isConvPublica());
			ps.setString(i++,convocatoriaOBJ.getCorteActual());
	//		System.out.println("publica ="+convocatoriaOBJ.isConvPublica());

			ps.setLong(i++,convocatoriaOBJ.getConvId());
			ps.execute();
			retorno=true;
		} catch (SQLException e) {
			lanzaExcepcion(e);
			setMensaje("Ya se encuentra almacenada una convocatoria con ese a�o y n�mero");
		}catch (Exception e) {
			// TODO Auto-generated catch block
			setMensaje("Problemas en la conexi�n a la base de datos");
			lanzaExcepcion(e);
		}finally{
			cerrar(ps);
			cerrar(cn);
		}
		return retorno;
	}

	public boolean quitarConvocatoria(long idconv){
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("borrar_convocatoria"));

			ps.setLong(i++,idconv);
			ps.execute();
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


	public ConvocatoriaOBJ getConvocatoria(long id){
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		ConvocatoriaOBJ convocatoriaOBJ=null;
		List listaCortes=new ArrayList();
		ConvCorte corte=null;
		String ini=null,fin=null;
		Globales g=new Globales();
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getConvocatoria"));
			ps.setLong(1,id);
			rs=ps.executeQuery();
			while(rs.next()){
				convocatoriaOBJ=new ConvocatoriaOBJ();

				convocatoriaOBJ.setConvId(rs.getLong(i++));
				convocatoriaOBJ.setConvAno(rs.getInt(i++));
				convocatoriaOBJ.setConvNumero(rs.getInt(i++));
				convocatoriaOBJ.setConvNombre(rs.getString(i++));
				convocatoriaOBJ.setConvCuantia(rs.getString(i++));
				convocatoriaOBJ.setConvDuracion(rs.getInt(i++));
				convocatoriaOBJ.setConvFecInicio(rs.getString(i++));
				convocatoriaOBJ.setConvFecFin(rs.getString(i++));
				convocatoriaOBJ.setConvDirigido(rs.getString(i++));
				convocatoriaOBJ.setConvPublica(rs.getBoolean(i++));
				convocatoriaOBJ.setConvArchivo(rs.getString(i++));
				convocatoriaOBJ.setObservacion(rs.getString(i++));
				convocatoriaOBJ.setConvResolucion(rs.getString(i++));
				convocatoriaOBJ.setCantProduct(rs.getInt(i++));
				convocatoriaOBJ.setCorteActual(rs.getString(i++));
			}
			if(convocatoriaOBJ!=null){
				ps=cn.prepareStatement(rb.getString("getCortesConvocatoria"));
				ps.setLong(1,id);
				rs=ps.executeQuery();
				while(rs.next()){
					i=1;
					corte=new ConvCorte();
					corte.setNumCorte(rs.getInt(i++));
					corte.setFechaApertura(""+rs.getDate(i++));
					corte.setFechaCierre(""+rs.getDate(i++));
					corte.setAuxApertura(""+rs.getDate(i++));
					corte.setAuxCierre(""+rs.getDate(i++));
					listaCortes.add(corte);
					ini=corte.getFechaApertura().replace("-","/");
					fin=corte.getFechaCierre().replace("-","/");

					if(g.entreFechas(new java.util.Date(ini),new java.util.Date(fin),new java.util.Date())){
						convocatoriaOBJ.setInscripcion(true);
					}
				}
			}

		} catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return convocatoriaOBJ;
	}




	public boolean borrar(int en, long convId) {
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		try {
			cn=cursor.getConnection(super.perfil);
		}catch(Exception e){
			lanzaExcepcion(e);
		}
	//	System.out.println("entra metodo de eliminacion");
		switch(en){
			case ParametrosOBJ.ListaAspecto:
				try {
					ps=cn.prepareStatement(rb.getString("elimina_Aspecto"));
					ps.setLong(1,convId);
					ps.execute();
					retorno=true;
				}catch (SQLException e) {
					lanzaExcepcion(e);
				}catch (Exception e) {
					lanzaExcepcion(e);
				}finally{
					cerrar(ps);
					cerrar(cn);
				}
			break;
			case ParametrosOBJ.ListaCompromiso:
				try {
					ps=cn.prepareStatement(rb.getString("elimina_compromiso"));
					ps.setLong(1,convId);
					ps.execute();
					retorno=true;
				}catch (SQLException e) {
					lanzaExcepcion(e);
				}catch (Exception e) {
					lanzaExcepcion(e);
				}finally{
					cerrar(ps);
					cerrar(cn);
				}
			break;
			case ParametrosOBJ.ListaCriterio:
				try {
					ps=cn.prepareStatement(rb.getString("elimina_criterio"));
					ps.setLong(1,convId);
					ps.execute();
					retorno=true;
				}catch (SQLException e) {
					lanzaExcepcion(e);
				}catch (Exception e) {
					lanzaExcepcion(e);
				}finally{
					cerrar(ps);
					cerrar(cn);
				}
			break;
			case ParametrosOBJ.ListaEje:
				try {
		//			System.out.println("entra a eliminar "+convId);
					ps=cn.prepareStatement(rb.getString("elimina_eje"));
					ps.setLong(1,convId);
					ps.execute();
					retorno=true;
		//			System.out.println("Termina "+convId);
				}catch (SQLException e) {
					lanzaExcepcion(e);
				}catch (Exception e) {
					lanzaExcepcion(e);
				}finally{
					cerrar(ps);
					cerrar(cn);
				}
			break;
			case ParametrosOBJ.ListaRubros:
				try {
		//			System.out.println("entra a eliminar "+convId);
					ps=cn.prepareStatement(rb.getString("elimina_rubro"));
					ps.setLong(1,convId);
					ps.execute();
					retorno=true;
		//			System.out.println("Termina "+convId);
				}catch (SQLException e) {
					lanzaExcepcion(e);
				}catch (Exception e) {
					lanzaExcepcion(e);
				}finally{
					cerrar(ps);
					cerrar(cn);
				}
			break;
			case ParametrosOBJ.porcentajes:
				try {
					ps=cn.prepareStatement(rb.getString("elimina_porcentajes"));
					ps.setLong(1,convId);
					ps.execute();
					retorno=true;
				}catch (SQLException e) {
					lanzaExcepcion(e);
				}catch (Exception e) {
					lanzaExcepcion(e);
				}finally{
					cerrar(ps);
					cerrar(cn);
				}
			break;
			case ParametrosOBJ.AspectoComite:
				try {
					ps=cn.prepareStatement(rb.getString("elimina_Aspecto_Comite"));
					ps.setLong(1,convId);
					ps.execute();
					retorno=true;
				}catch (SQLException e) {
					lanzaExcepcion(e);
				}catch (Exception e) {
					lanzaExcepcion(e);
				}finally{
					cerrar(ps);
					cerrar(cn);
				}
			break;
		}
		return retorno;
	}
	public void insertaAspectos(InsercionGralOBJ insercionGralOBJ, long convId) {
		Connection cn=null;
		PreparedStatement ps=null;
		int c=1;
		try {
			//System.out.println("LLega al metodo de insercion "+insercionGralOBJ.getAspectos().length);
			if(insercionGralOBJ.getAspectos()!=null){
				cn=cursor.getConnection(super.perfil);
				ps=cn.prepareStatement(rb.getString("inserta_aspectos"));
		//		System.out.println("cantidad aspectos => "+insercionGralOBJ.getAspectos().length);
				for(int i=0;i<insercionGralOBJ.getAspectos().length;i++){
					c=1;
					ps.setLong(c++,convId);
					ps.setLong(c++,insercionGralOBJ.getCriterios()[i]);
					ps.setLong(c++,insercionGralOBJ.getAspectos()[i]);
					ps.setFloat(c++,insercionGralOBJ.getAspValor()[i]);
					ps.execute();
				}
			}
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(ps);
			cerrar(cn);
		}
	}
	public void insertaAspectosComite(InsercionGralOBJ insercionGralOBJ, long convId) {
		Connection cn=null;
		PreparedStatement ps=null;
		int c=1;
		try {
			//System.out.println("LLega al metodo de insercion "+insercionGralOBJ.getAspectos().length);q
			if(insercionGralOBJ.getAspectos()!=null){
				cn=cursor.getConnection(super.perfil);
				ps=cn.prepareStatement(rb.getString("inserta_aspectos_comite"));
		//		System.out.println("cantidad aspectos => "+insercionGralOBJ.getAspectos().length);
				for(int i=0;i<insercionGralOBJ.getAspectos().length;i++){
					c=1;
					ps.setLong(c++,convId);
					ps.setLong(c++,insercionGralOBJ.getAspectos()[i]);
					ps.setString(c++,insercionGralOBJ.getComite());
					ps.setFloat(c++,100);
					ps.execute();
				}
			}
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(ps);
			cerrar(cn);
		}
	}
	public void insertaCriterios(InsercionGralOBJ insercionGralOBJ, long convId) {
		Connection cn=null;
		PreparedStatement ps=null;
		int c=1;
		try {
			if(insercionGralOBJ.getCriterios()!=null){
				cn=cursor.getConnection(super.perfil);
				ps=cn.prepareStatement(rb.getString("inserta_criterios"));
				for(int i=0;i<insercionGralOBJ.getCriterios().length;i++){
					c=1;
					ps.setLong(c++,convId);
					ps.setLong(c++,insercionGralOBJ.getCriterios()[i]);
					ps.setLong(c++,insercionGralOBJ.getCritValor()[i]);
					ps.execute();
				}
			}
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(ps);
			cerrar(cn);
		}
	}
	public void insertaEjes(InsercionGralOBJ insercionGralOBJ, long convId) {
		Connection cn=null;
		PreparedStatement ps=null;
		int c=1;
		try {
			if(insercionGralOBJ.getEjeTematico()!=null){
				cn=cursor.getConnection(super.perfil);
				ps=cn.prepareStatement(rb.getString("inserta_ejes"));
				for(int i=0;i<insercionGralOBJ.getEjeTematico().length;i++){
					c=1;
					ps.setLong(c++,convId);
					ps.setLong(c++,insercionGralOBJ.getEjeTematico()[i]);
					ps.execute();
				}
			}
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(ps);
			cerrar(cn);
		}
	}
	public boolean insertaCompromisos(InsercionGralOBJ insercionGralOBJ, long convId) {
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		int num=1,c=1;
		try {
			if(insercionGralOBJ.getCompromiso()!=null){
				cn=cursor.getConnection(super.perfil);
				ps=cn.prepareStatement(rb.getString("inserta_cant_comp"));
				ps.setInt(c++,insercionGralOBJ.getAspectComit());
				ps.setLong(c++,convId);
				ps.executeUpdate();
				ps=cn.prepareStatement(rb.getString("inserta_compromisos"));
				for(int i=0;i<insercionGralOBJ.getCompromiso().length;i++){
					c=1;
			//		System.out.println("inserta comp: "+insercionGralOBJ.getCompromiso()[i]+" = "+insercionGralOBJ.getObligatorio()[i]);
					ps.setLong(c++,num++);
					ps.setLong(c++,convId);
					ps.setLong(c++,insercionGralOBJ.getCompromiso()[i]);
					ps.setLong(c++,insercionGralOBJ.getObligatorio()[i]);
					ps.addBatch();
				}
				ps.executeBatch();
				retorno=true;
			}
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
	public boolean setTerminos(long convId, String nombre) {
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("archivo_convocatoria"));
			//System.out.println("El d�digo "+convId);
			ps.setString(i++,nombre);
			ps.setLong(i++,convId);
			ps.execute();
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
	public boolean setResolucion(long convId, String nombre) {
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("archivo_convocatoria2"));
			ps.setString(i++,nombre);
			ps.setLong(i++,convId);
			ps.execute();
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

	public List consultaRubros(int consulta,long convocatoria){
		List l=new ArrayList();
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int i=0;
		try {
			cn=cursor.getConnection(super.perfil);
		//	System.out.println("Consulta="+consulta);
		//	System.out.println("Convocatoria="+convocatoria);
			ps=cn.prepareStatement(rb.getString("lista_Rubros"+consulta));
			if(consulta==11)
				ps.setLong(1,convocatoria);
			rs=ps.executeQuery();

			while(rs.next()){
				i=1;
	//			System.out.println("encuentra rubros");
				RubrosOBJ rubrosOBJ=new RubrosOBJ();
				rubrosOBJ.setCodigo(rs.getInt(i++));
				rubrosOBJ.setNombre(rs.getString(i++));
				if(consulta==11){
					rubrosOBJ.setValor(rs.getString(i++));
		//			System.out.println("ingresa valor "+criteriosOBJ.getValor());
				}
				l.add(rubrosOBJ);
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
	public void insertaRubros(InsercionGralOBJ insercionGralOBJ, long convId) {
		Connection cn=null;
		PreparedStatement ps=null;
		int c=1;
		try {
			if(insercionGralOBJ.getRubros()!=null){
				cn=cursor.getConnection(super.perfil);
				ps=cn.prepareStatement(rb.getString("inserta_rubros"));
				for(int i=0;i<insercionGralOBJ.getRubros().length;i++){
					c=1;
					ps.setLong(c++,convId);
					ps.setLong(c++,insercionGralOBJ.getRubros()[i]);
					ps.setDouble(c++,insercionGralOBJ.getRubValor()[i]);
					ps.execute();
				}
				insertaObservRubros(insercionGralOBJ,convId);
			}
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(ps);
			cerrar(cn);
		}
	}
	public boolean insertaObservRubros(InsercionGralOBJ insercionGralOBJ, long convId) {
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		int c=1;
		try {
	//		System.out.println("observaciones="+convId+"--"+insercionGralOBJ.getObservacion());
			if(insercionGralOBJ.getRubros()!=null){
				cn=cursor.getConnection(super.perfil);
				ps=cn.prepareStatement(rb.getString("insertaObservRubros"));
				ps.setString(c++,insercionGralOBJ.getObservacion());
				ps.setLong(c++,convId);
				ps.execute();
			}
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
	public boolean insertaPorcentajes(InsercionGralOBJ insercionGralOBJ, long convId) {
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		int c=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("insertaPorcentajes"));
			ps.setLong(c++,convId);
			ps.setDouble(c++,insercionGralOBJ.getPorcentInt());
			ps.setDouble(c++,insercionGralOBJ.getPorcentExt());
			ps.setDouble(c++,insercionGralOBJ.getPorcentComit());
			ps.executeUpdate();
			setMensaje("Porcentajes almacenados correctamente");
			retorno=true;
		} catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(ps);
			cerrar(cn);
		}
		return retorno;
	}
	public InsercionGralOBJ getPorcentajes(long convId) {
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int c=1;
		InsercionGralOBJ insercionGralOBJ=null;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getPorcentajes"));
			ps.setLong(c++,convId);
			rs=ps.executeQuery();
			while(rs.next()){
				insercionGralOBJ=new InsercionGralOBJ();
				insercionGralOBJ.setPorcentInt(rs.getDouble(1));
				insercionGralOBJ.setPorcentExt(rs.getDouble(2));
				insercionGralOBJ.setPorcentComit(rs.getDouble(3));
			}
		} catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(ps);
			cerrar(cn);
		}
		return insercionGralOBJ;
	}
	public List getCortes(long convId) {
		List lista=new ArrayList();
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		InsercionGralOBJ corte=null;
		int i=0;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("listaCortes"));
			ps.setLong(1,convId);
			rs=ps.executeQuery();
			while(rs.next()){
				i=1;
				corte=new InsercionGralOBJ();
				corte.setConvId(convId);
				corte.setIdCorte(rs.getInt(i++));
				corte.setNumCorte(rs.getInt(i++));
				corte.setFechaApertura(rs.getString(i++));
				corte.setFechaCierre(rs.getString(i++));
				corte.setAuxApertura(rs.getString(i++));
				corte.setAuxCierre(rs.getString(i++));
				lista.add(corte);
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

	public boolean insertaCorte(InsercionGralOBJ corte, long convId) {
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("insertaCorte"));
			ps.setLong(i++,corte.getConvId());
			ps.setInt(i++,corte.getNumCorte());
			ps.setDate(i++,Date.valueOf(corte.getFechaApertura()));
			ps.setDate(i++,Date.valueOf(corte.getFechaCierre()));
			if(corte.getAuxApertura()!=null)
				ps.setDate(i++,Date.valueOf(corte.getAuxApertura()));
			else
				ps.setNull(i++, Types.DATE);
			if(corte.getAuxCierre()!=null)
				ps.setDate(i++,Date.valueOf(corte.getAuxCierre()));
			else
				ps.setNull(i++, Types.DATE);

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

	public boolean actualizaCorte(InsercionGralOBJ corte) {
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("actualizaCorte"));
			ps.setDate(i++,Date.valueOf(corte.getFechaApertura()));
			ps.setDate(i++,Date.valueOf(corte.getFechaCierre()));
			if(corte.getAuxApertura()!=null)
				ps.setDate(i++,Date.valueOf(corte.getAuxApertura()));
			else
				ps.setNull(i++, Types.DATE);
			if(corte.getAuxCierre()!=null)
				ps.setDate(i++,Date.valueOf(corte.getAuxCierre()));
			else
				ps.setNull(i++, Types.DATE);
			ps.setLong(i++,corte.getIdCorte());

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

	public boolean eliminaCorte(InsercionGralOBJ corte) {
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("eliminaCorte"));
			ps.setLong(i++,corte.getIdCorte());
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
