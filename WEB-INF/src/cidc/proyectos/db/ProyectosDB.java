package cidc.proyectos.db;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletResponse;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

//import com.lowagie.text.DocumentException;

import cidc.adminGrupos.obj.GrupoInvestigacion;
import cidc.general.db.BaseDB;
import cidc.general.db.CursorDB;
import cidc.general.obj.Globales;
import cidc.proyectos.obj.BalanceGeneral;
import cidc.proyectos.obj.CoInvest;
import cidc.proyectos.obj.Devolutivo;
import cidc.proyectos.obj.FiltroProyecto;
import cidc.proyectos.obj.GastosRubro;
import cidc.proyectos.obj.Proyecto;
import cidc.proyectos.obj.Rubros;
import cidc.proyectos.servlet.GastosExcel;
import cidc.proyectosAntiguos.obj.GeneralOBJ;

public class ProyectosDB extends BaseDB {

	public static char sep=java.io.File.separatorChar;
	String nombreRubro=null;
	
	public String getNombreRubro() {
		return nombreRubro;
	}

	public void setNombreRubro(String nombreRubro) {
		this.nombreRubro = nombreRubro;
	}

	public ProyectosDB(CursorDB c, int perfil) {
		super(c, perfil);
		rb=ResourceBundle.getBundle("cidc.proyectos.consultas");
	}

	public List getListaProyectos(FiltroProyecto filtro){
		List lista=new ArrayList();
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		Proyecto datos=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getListaProyectos"));
			ps.setInt(i++,Integer.parseInt(filtro.getTipo()));
			ps.setString(i++,filtro.getFacultad());
			ps.setString(i++,filtro.getProyCur());
			ps.setString(i++,filtro.getGrupo());
			ps.setString(i++,filtro.getCodigo());
			ps.setString(i++,filtro.getConvAno());
			ps.setString(i++,filtro.getConvNum());
			ps.setString(i++,filtro.getEstado());
			rs=ps.executeQuery();
			i=1;
			while(rs.next()){
				i=1;
				datos=new Proyecto();
				datos.setId(rs.getString(i++));
				datos.setCodigo(rs.getString(i++));
				datos.setDirector(rs.getString(i++));
				datos.setProyecto(rs.getString(i++));
				datos.setFlag(rs.getInt(i++));
				lista.add(datos);
	//			System.out.println("A�ade pro");
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

	public Proyecto getVerProyecto(String id) {
		Proyecto proyecto=null;
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		Globales g= new Globales();
		String fechas=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("verProyecto"));
			ps.setLong(1, Long.parseLong(id));
			rs=ps.executeQuery();
			while(rs.next()){
				i=1;
				proyecto=new Proyecto();
				proyecto.setId(id);
				proyecto.setCodigo(rs.getString(i++));
				proyecto.setProyecto(rs.getString(i++));
				proyecto.setFacultad(rs.getString(i++));
				proyecto.setProyCurricular(rs.getString(i++));
				proyecto.setDirector(rs.getString(i++));
				proyecto.setFecAprobacion(rs.getString(i++));
				proyecto.setNumConvocatoria(rs.getString(i++));
				proyecto.setConvocatoria(rs.getString(i++));
				proyecto.setValor(calculoValor(cn,id));
				proyecto.setDuracion(rs.getString(i++));
				proyecto.setIdGrupo(rs.getString(i++));
				proyecto.setGrupoInvestigacion(rs.getString(i++));
				proyecto.setArchivo(rs.getString(i++));
				proyecto.setEstado(rs.getInt(i++));
				proyecto.setConsecContrato(rs.getString(i++));
				proyecto.setConsecActa(rs.getString(i++));
				proyecto.setAno(""+rs.getInt(i++));
				proyecto.setEjecucion(""+(Integer.parseInt(proyecto.getDuracion())-4));
				proyecto.setInformes("1");
				proyecto.setEvaluacion("3");
				/********************************************/
				fechas=rs.getString(i++);//captura la fecha del contrato
				if(fechas==null ||fechas.trim().equals(""))
					proyecto.setFecContrato(g.getAnoHoy()+"-"+g.getMesHoy()+"-"+g.getDiaHoy());
				else
					proyecto.setFecContrato(fechas);
				/********************************************/
				fechas=null;
				fechas=rs.getString(i++);//captura la fecha del acta de inicio
				if(fechas==null ||fechas.trim().equals("")){
					proyecto.setFecActaInicio(g.getAnoHoy()+"-"+g.getMesHoy()+"-"+g.getDiaHoy());
				}
				else{
					proyecto.setFecActaInicio(fechas);
				}
				proyecto.setFlag(rs.getInt(i++));
				proyecto.setTermRefConvo(rs.getString(i++));
				proyecto.setFecActaFin(rs.getString(i++));
				proyecto.setIdActaFin(rs.getInt(i++));			
				/********************************************/
				proyecto.setListaObservaciones(getListaObservaciones(Long.parseLong(id)));
			}
			if(proyecto!=null){
				CoInvest coInvest=null;
				coInvest=new CoInvest();
				coInvest.setNombre(proyecto.getDirector());
				List listaCoInve=new ArrayList();
				ps=cn.prepareStatement(rb.getString("getConInvesti"));
				ps.setLong(1, Long.parseLong(proyecto.getId()));
				rs=ps.executeQuery();
				listaCoInve.add(coInvest);
				while(rs.next()){
					coInvest=new CoInvest();
					coInvest.setNombre(rs.getString(1)+" "+rs.getString(2));
					listaCoInve.add(coInvest);
				}
				proyecto.setCoInvestigadores(listaCoInve);

				String comp="";
		//		System.out.println(proyecto.getNumConvocatoria());
				if(proyecto.getNumConvocatoria().endsWith("2008"))
					ps=cn.prepareStatement(rb.getString("compromisosConv2008"));
				else
					ps=cn.prepareStatement(rb.getString("compromisosConv2009"));
				ps.setLong(1, Long.parseLong(id));
				rs=ps.executeQuery();
				while(rs.next()){
					if(comp.equals(""))
						comp=comp+rs.getString(1);
					else
						comp=comp+", "+rs.getString(1);
				}
				proyecto.setCompromisosConv(comp);

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

		return proyecto;
	}

	public String calculoValor(Connection cn,String prop){
		Globales g=new Globales();
		BigInteger cidc=BigInteger.valueOf(0);
		PreparedStatement ps=null;
		ResultSet rs=null;
		String dato="";
		try {
			ps=cn.prepareStatement(rb.getString("getResumenRubros"));
			ps.setLong(1,Long.parseLong(prop));
			rs=ps.executeQuery();
			while(rs.next()){
				dato=rs.getString(1);
				if(dato!=null && !dato.equals("") && !dato.equals("0"))
					cidc=cidc.add(new BigInteger(dato));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			cerrar(rs);
			cerrar(ps);
		}
		return g.moneda(cidc.toString());
	}

/*	public Proyecto crearActaInicio(Proyecto proyecto,String path) {
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		ActaInicio actaInicio=null;
		String consec=null;
		String tabla=null;

		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("datosActaInicio"));
			ps.setLong(1,Long.parseLong(proyecto.getId()));
			rs=ps.executeQuery();
			while(rs.next()){
				consec=rs.getString(1);
				tabla=rs.getString(2);
				if(tabla!=null)
					proyecto.setConsecActa(tabla);
				else
					proyecto.setConsecActa(consec);

				path+=sep+"Documentos"+sep+"Proyectos"+sep+"Actas"+sep+"ActaInicio_"+proyecto.getConsecActa()+"_"+proyecto.getAnCortoActa()+".pdf";
				actaInicio=new ActaInicio();
				actaInicio.GenerarActaInicio(proyecto,path);

				ps=cn.prepareStatement(rb.getString("act_consecutivo_acta"));
				ps.setLong(1, Long.parseLong(proyecto.getConsecActa()));
				ps.setString(2, proyecto.getFecActaInicio());
				ps.setLong(3, Long.parseLong(proyecto.getId()));
				ps.execute();
				if(tabla==null){
					ps=cn.prepareStatement(rb.getString("ActaInicio++"));
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
		return proyecto;
	}

	public Proyecto crearContrato(Proyecto proyecto, String path) {
		ContratoInvestigacion1 contrato=new ContratoInvestigacion1();
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		long secuencia;
		String tabla=null;//hace referencia al consecutivo almacenado en la tabla.. es distinto de null en caso de ya haber contrado hecho
		int ano=0;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getConsecContrato"));
			ps.setLong(1,Long.parseLong(proyecto.getId()));
			rs=ps.executeQuery();
			while(rs.next()){
				secuencia=rs.getLong(1);
				tabla=rs.getString(2);
				ano=rs.getInt(3);
				if(tabla!=null)
					proyecto.setConsecContrato(tabla);
				else
					proyecto.setConsecContrato(""+secuencia);

				path+=sep+"Documentos"+sep+"Proyectos"+sep+"Contratos"+sep+"Contrato_"+proyecto.getConsecContrato()+"_"+proyecto.getAnCortoContrato()+".pdf";
				contrato.GenerarContrato(proyecto, path);

				if(tabla==null){
					ps=cn.prepareStatement(rb.getString("Contrato++"));
					ps.execute();
				}

				ps=cn.prepareStatement(rb.getString("act_consecutivo_contrato"));
				ps.setLong(1,Long.parseLong(proyecto.getConsecContrato()));
				ps.setString(2,proyecto.getFecContrato());
				ps.setLong(3,Long.parseLong(proyecto.getId()));
				ps.executeUpdate();
				break;
			}
		}catch (SQLException e){
			lanzaExcepcion(e);
		}catch (DocumentException e){
			lanzaExcepcion(e);
		}catch (IOException e){
			lanzaExcepcion(e);
		}catch (Exception e){
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return proyecto;
	}*/
	
	public BalanceGeneral getBalanceProyecto(String idProyecto){
		BalanceGeneral balance=null;
		Rubros rubros=null;
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List listaRubros=new ArrayList();
		Globales global=new Globales();
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getRubrosProyecto"));
			ps.setLong(1,Long.parseLong(idProyecto));
			rs=ps.executeQuery();
			balance=new BalanceGeneral();
			balance.setIdProyecto(Long.parseLong(idProyecto));
			while(rs.next()){
				i=1;

				rubros=new Rubros();
				rubros.setIdRubro(rs.getLong(i++));
				rubros.setNombreRubro(rs.getString(i++));
				rubros.setValorRubro(rs.getString(i++));
				rubros.setListaGastos(getGastosRubro(cn,rubros.getIdRubro(),idProyecto,rubros));
				listaRubros.add(rubros);
			}
			balance.setListaRubros(listaRubros);
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return balance;
	}
	public List getGastosRubro(Connection cn,long idRubro, String idProyecto, Rubros rubros){
		List listaRubros=new ArrayList();
		GastosRubro gastos=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		BigInteger acumulado=BigInteger.valueOf(0);
		Globales global=new Globales();
		int i=1;
		try {
			ps=cn.prepareStatement(rb.getString("getGastosRubro"));
			ps.setLong(1,idRubro);
			ps.setLong(2,Long.parseLong(idProyecto));
			rs=ps.executeQuery();
			gastos=new GastosRubro();
			gastos.setIdRubro(idRubro);
			while(rs.next()){
				i=1;
				gastos=new GastosRubro();
				gastos.setIdGasto(rs.getString(i++));
				gastos.setValorGasto(rs.getString(i++));
				gastos.setDescripcion(rs.getString(i++));
				gastos.setFecha(rs.getString(i++));
				gastos.setTipoGasto(rs.getInt(i++));
				gastos.setCodigo(rs.getString(i++));
				gastos.setObservaciones(rs.getString(i++));
				
				gastos.setUbicacion(rs.getString(i++));
				gastos.setGrupoAcargo(rs.getInt(i++));
				gastos.setObservacionEntrega(rs.getString(i++));
				gastos.setFechaEntrega(rs.getString(i++));
				
				listaRubros.add(gastos);
		//		if(gastos.getTipo()==1)
				acumulado=acumulado.add(new BigInteger(""+(Integer.parseInt(gastos.getValorGasto())*gastos.getTipoGasto())));
//System.out.println("---aa-->");
			}

			BigInteger a= new BigInteger(""+rubros.getValorRubro());
			rubros.setValorSaldo(global.moneda(""+a.subtract(acumulado)));

			rubros.setValorEjecutado(global.moneda(""+acumulado));
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
		}
		return listaRubros;
	}

	public List getGastosRubro(BalanceGeneral general,String idRub) {
		Rubros rubro=null;
		
		List gastosRubro=null;
		Iterator itRubros=general.getListaRubros().iterator();
		while (itRubros.hasNext()) {
			rubro=(Rubros)itRubros.next();
			if(rubro.getIdRubro()==Long.parseLong(idRub)){
				nombreRubro=rubro.getNombreRubro();
				gastosRubro=rubro.getListaGastos();
			}
		}
		return gastosRubro;
	}
	
	public List getElementosInventarioRubro(BalanceGeneral general,String idRub) {
		Rubros rubro=null;
		List gastosRubro=null,retorno=new ArrayList();
		Iterator itRubros=general.getListaRubros().iterator();
		while (itRubros.hasNext()) {
			rubro=(Rubros)itRubros.next();
			if(rubro.getIdRubro()==Long.parseLong(idRub)){
				gastosRubro=rubro.getListaGastos();
				for(int i=0;i<gastosRubro.size();i++){					
					GastosRubro gasto=(GastosRubro)gastosRubro.get(i);
					//System.out.println("--encuentra devolutivo--->");
					if(gasto.getTipoGasto()==1 && (gasto.getFechaEntrega()!=null || gasto.getFechaEntrega()!="")){
						retorno.add(gasto);
					}
				}
			}
		}
		return retorno;
	}
	
	public Rubros getRubro(BalanceGeneral general,String idRub){
		Rubros rubro=null;
		Iterator itRubros=general.getListaRubros().iterator();
		while (itRubros.hasNext()) {
			rubro=(Rubros)itRubros.next();
			if(Long.parseLong(idRub)==rubro.getIdRubro())
				break;
			else
				rubro=null;

		}
		return rubro;
	}

	public boolean registraGasto(GastosRubro gasto) {
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("registraGasto"));
			ps.setLong(i++,gasto.getIdProyecto());
			ps.setLong(i++,gasto.getIdRubro());
			ps.setDouble(i++,Double.parseDouble(gasto.getValorGasto()));
			ps.setString(i++,gasto.getDescripcion());
			ps.setInt(i++,gasto.getTipoGasto());
			ps.setString(i++,gasto.getFecha());
			ps.setInt(i++,gasto.getPara());
			ps.setString(i++,gasto.getCodigo());
			ps.setString(i++,gasto.getObservaciones());
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

	public boolean eliminarGasto(String idGast) {
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("eliminaGasto"));
			ps.setLong(i++,Long.parseLong(idGast));
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



	public boolean insertaObservacion(Long idPro, String observacion,long usuario) {
		Connection cn=null;
		PreparedStatement ps=null;
		boolean retorno = false;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("insertaObservacion"));
			ps.setLong(i++,idPro);
			ps.setString(i++,observacion);
			ps.setLong(i++,usuario);
			ps.executeUpdate();
			retorno = true;
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
	public List getListaObservaciones(long idPro) {
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List lista=new ArrayList();
		GeneralOBJ observ=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getObservaciones"));
			ps.setLong(1,idPro);
			rs=ps.executeQuery();
			while(rs.next()){
				i=1;
				observ= new GeneralOBJ();
				observ.setIdObservacion(rs.getLong(i++));
				observ.setFecha(rs.getString(i++));
				observ.setObservacion(rs.getString(i++));
				observ.setUsuario(rs.getString(i++));
				lista.add(observ);
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

	public boolean actualizarFlag(long idPro, String flag) {
		Connection cn=null;
		PreparedStatement ps=null;
		boolean retorno = false;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("actualizarFlag"));
			ps.setInt(1,Integer.parseInt(flag));
			ps.setLong(2,idPro);
			ps.executeUpdate();
			retorno = true;
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
	public int getFlag(long idPro) {
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int retorno = 0;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getFlag"));
			ps.setLong(1,idPro);
			rs=ps.executeQuery();
			while(rs.next()){
				retorno = rs.getInt(1);
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
		return retorno;
	}
	public List leerGastosExcel(String idRubro,InputStream stream){
		List lista =new ArrayList();
		GastosRubro gastos=new GastosRubro();

		Workbook workbook;
		try {
			workbook = Workbook.getWorkbook(stream);
			Sheet sheet = workbook.getSheet(0);
			Cell []listaCeldasA=sheet.getColumn(0);
			Cell []listaCeldasB=sheet.getColumn(1);
			Cell []listaCeldasC=sheet.getColumn(2);
			Cell []listaCeldasD=sheet.getColumn(3);
			for(int i=1;i<listaCeldasB.length;i++){
				gastos=new GastosRubro();
				gastos.setTipoGasto(1);
				gastos.setPara(1);
				gastos.setIdRubro(Long.parseLong(idRubro));
				if(i< listaCeldasA.length)
					gastos.setCodigo(listaCeldasA[i].getContents());
				gastos.setDescripcion(listaCeldasB[i].getContents());
				gastos.setValorGasto(listaCeldasC[i].getContents());
				if(i< listaCeldasD.length)
					gastos.setObservaciones(listaCeldasD[i].getContents());
				lista.add(gastos);
			}
		} catch (BiffException e) {
			// TODO Auto-generated catch block
			lanzaExcepcion(e);
			setMensaje("Error en la lectura de las celdas del archivo de excel");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			lanzaExcepcion(e);
			setMensaje("Error en la lectura del archivo");
		}
		return lista;
	}

	public boolean registraGastosExcel(List listaGastos, long idProyecto) {
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		GastosRubro gasto=null;
		Globales g =new Globales();
		g.getFechaSimpleHoy();
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("registraGasto"));
			for(int j=0;j<listaGastos.size();j++){
				i=1;
				gasto=(GastosRubro)listaGastos.get(j);
				ps.setLong(i++,idProyecto);
				ps.setLong(i++,gasto.getIdRubro());
				ps.setDouble(i++,Double.parseDouble(gasto.getValorGasto()));
				ps.setString(i++,gasto.getDescripcion());
				ps.setLong(i++,gasto.getTipoGasto());
				ps.setString(i++,""+g.getAnoHoy()+"-"+g.getMesHoy()+"-"+g.getDiaHoy());
				ps.setLong(i++,gasto.getPara());
				ps.setString(i++,gasto.getCodigo());
				ps.setString(i++,gasto.getObservaciones());
				ps.addBatch();
				ps.clearParameters();
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

	public List getListaGastosExcel(String idPro) {
		List listaRubros=new ArrayList();
		GastosRubro gastos=null;
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		BigInteger acumulado=BigInteger.valueOf(0);
		Globales global=new Globales();
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getGastosRubroExcel"));
			ps.setLong(1,Long.parseLong(idPro));
			rs=ps.executeQuery();
			gastos=new GastosRubro();
			while(rs.next()){
				i=1;
				gastos=new GastosRubro();
				gastos.setNombreRubro(rs.getString(i++));
				gastos.setFecha(rs.getString(i++));
				gastos.setDescripcion(rs.getString(i++));
				gastos.setValorGasto(rs.getString(i++));
				gastos.setCodigo(rs.getString(i++));
				gastos.setObservaciones(rs.getString(i++));
				listaRubros.add(gastos);
			}
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
		}
		return listaRubros;
	}

	public boolean cambiaEstado(Long idPro, String estado) {
		Connection cn=null;
		PreparedStatement ps=null;
		boolean retorno = false;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("cambiaEstadoProyecto"));
			ps.setInt(i++,Integer.parseInt(estado));
			ps.setLong(i++,idPro);
			ps.executeUpdate();
			retorno = true;
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

	public List getListaTotalGrupos() {
		List listaGrupos= new ArrayList();
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		GrupoInvestigacion grupo=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil); 
			ps=cn.prepareStatement(rb.getString("listaTotalGrupos"));
			rs=ps.executeQuery();
			while(rs.next()){
				i=1;
				grupo=new GrupoInvestigacion();
				grupo.setCodigo(rs.getLong(i++));
				grupo.setNombre(rs.getString(i++).toLowerCase());
				grupo.setDirNombre(rs.getString(i++));
				grupo.setEstado(rs.getInt(i++));
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

	public boolean entregarElementosProyecto(Devolutivo listaElementos) {
		Connection cn=null;
		PreparedStatement ps=null;
		boolean retorno = false;
		int i=1;
		try {
			
			if(listaElementos.getIdGasto()!=null && listaElementos.getUbicar()!=null){
				cn=cursor.getConnection(super.perfil);
				ps=cn.prepareStatement(rb.getString("EntergaElementoProyecto"));
				for(int x=0;x<listaElementos.getIdGasto().length;x++){
					i=1;
					ps.setString(i++, listaElementos.getUbicar()[x]);
					ps.setLong(i++, listaElementos.getGrupoAcargo()[x]);					
					ps.setString(i++, listaElementos.getObservacionEntrega()[x]);
					ps.setString(i++,listaElementos.getFechaEntrega()[x]);
					if(listaElementos.getIdGasto()[x]!=0)
						ps.setLong(i++, listaElementos.getIdGasto()[x]);
					else
						ps.setLong(i++, Types.NULL);
					ps.addBatch();
				}
				ps.executeBatch();
				retorno = true;
			}else
				setMensaje("No hay elementos a Entregar");
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
