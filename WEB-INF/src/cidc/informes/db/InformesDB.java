package cidc.informes.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.TreeMap;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import com.sun.org.apache.bcel.internal.generic.GETSTATIC;


import cidc.evalPrueba.obj.DatosArtic;
import cidc.evalPrueba.obj.Formulario;
import cidc.evalPrueba.obj.PorEvaluar;

import cidc.general.db.BaseDB;
import cidc.general.db.CursorDB;
import cidc.informes.obj.CampoObj;
import cidc.informes.obj.CampoObj.campoSeleccion;
import cidc.informes.obj.ParametrosInformeObj;
import cidc.informes.obj.SQLObj;
import cidc.informes.obj.TablaObj;

public class InformesDB extends BaseDB {

	private Map<String,CampoObj>mapaCampos=new TreeMap<String,CampoObj>();// mapa que contendrá el listado de campos encontrados para las tablas seleccionadas
	public String sqlEjecutar=null;
	public ParametrosInformeObj parametros=null;
	
	
	public ParametrosInformeObj getParametros() {
		return parametros;
	}
	public void setParametros(ParametrosInformeObj parametros) {
		this.parametros = parametros;
	}
	public String getSqlEjecutar() {
		return sqlEjecutar;
	}
	public void setSqlEjecutar(String sqlEjecutar) {
		this.sqlEjecutar = sqlEjecutar;
	}
	public InformesDB(CursorDB c, int perfil) {
		super(c,perfil);
		rb=ResourceBundle.getBundle("cidc.informes.consultas");
	}
	/*** Método encargado de traer todas las tablas que se encuentran en el SICIUD (del negocio) para pintarlas en el primer combo de la JSP de configuración ****/
	public List<TablaObj> getListadoTablas(){
		List<TablaObj> lstTablas=new ArrayList<TablaObj>();
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		TablaObj tabla=null;
		int i=0;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getTotalTablas"));
			rs=ps.executeQuery();
			while(rs.next()){	
				i=1;
				tabla=new TablaObj();
				tabla.setIdTabla(rs.getInt(i++));
				tabla.setNombreTabla(rs.getString(i++));
				tabla.setEtiquetaTabla(rs.getString(i++));
				lstTablas.add(tabla);
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
		return lstTablas;
	}
	/**** método encargado de traer el listado de tablas que se encuentran relacionadas a la tabla que llega como parámetro ****/
	public List<TablaObj> getTablasRelacionadas(String idTabla){
		List<TablaObj> lstTablas=new ArrayList<TablaObj>();
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		TablaObj tabla=null;
		int i=0;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getTablasRelacionadas"));		
			ps.setInt(1,Integer.parseInt(idTabla));// en caso que se encuentre como primera tabla en la relación
			ps.setInt(2,Integer.parseInt(idTabla));// en caso que se encuentre como segunda tabla en la relación
			rs=ps.executeQuery();
			if(rs.next())	
				i=1;
				tabla=new TablaObj();
				tabla.setIdTabla(rs.getInt(i++));
				tabla.setNombreTabla(rs.getString(i++));
				tabla.setEtiquetaTabla(rs.getString(i++));
				lstTablas.add(tabla);
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return lstTablas;
	}
	/*** Método encargado de capturar el listado completo de las tablas seleccionadas para el informe ***/
	public List<CampoObj> verCampos(ParametrosInformeObj tablasSeleccionadas){
		List<CampoObj> lstCampos=new ArrayList<CampoObj>();
		if(tablasSeleccionadas.getTablasSeleccionadas()!=null ){
			for(String tabla:tablasSeleccionadas.getTablasSeleccionadas()){
				lstCampos.addAll(getCamposTabla(tabla));// se añaden todos los elementos retornados por el método getCamposTabla
			}
			
			/**** llenar el mapa con el listado de campos encontrados*/
			for(CampoObj campo: lstCampos){
				mapaCampos.put(campo.getNombreCampo(), campo);
			}
		}
		return lstCampos;
	}
	/*** Metodo encargado de  traer el listado de campos asociados a una tabla específica ****/
	public List<CampoObj> getCamposTabla(String idTabla){
		List<CampoObj> lstCampos=new ArrayList<CampoObj>();
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		CampoObj campo=null;
		int i=0;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getCamposTabla"));		
			ps.setInt(1,Integer.parseInt(idTabla));
			rs=ps.executeQuery();
			System.out.println("--ps campos->"+ps);
			while(rs.next()){	
				i=1;
				campo=new CampoObj();
				campo.setIdCampo(rs.getInt(i++));
				campo.setIdTabla(rs.getInt(i++));
				campo.setEtiquetaCampo(rs.getString(i++));
				campo.setNombreCampo(rs.getString(i++));	
				campo.setTipoCampo(rs.getString(i++));
				campo.setEtiquetaTabla(rs.getString(i++));
				campo.setCaso(rs.getString(i++));
				campo.setOpciones(rs.getString(i++));				
				if(campo.getOpciones()!=null)
					campo.setCampoSelect(crearSelect(campo.getOpciones()));

				lstCampos.add(campo);
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
		return lstCampos;
	}
	/**** método para crear los select de la interfase de configuración para los campos con pocas opciones como verdadero/falso, etc */
	public List<CampoObj.campoSeleccion> crearSelect(String opciones){
		List<CampoObj.campoSeleccion> select=new ArrayList<CampoObj.campoSeleccion>();
		CampoObj.campoSeleccion item=null;
		for(String op: opciones.split(";")){
			item=new CampoObj.campoSeleccion();
			item.setNombre(op.split(",")[0]);
			item.setValor(op.split(",")[1]);
			select.add(item);
		}
		return select;
	}
	
	
	/** clase pequeña encargada de almacenar una lista con los datos de cada registro encontrado como resultado del informe *****/
	public class RegistroInforme{
		
		List<String> registro=new ArrayList<String>();

		public List<String> getRegistro() {
			return registro;
		}

		public void setRegistro(List<String> registro) {
			this.registro = registro;
		}
	}
	/***************************************************************************************************************************/
	
	/****** Método encargado de ejecutar la SQL para la generación del informe y retornar los registros encontrados*****************/
	public List<RegistroInforme> getInforme(ParametrosInformeObj parametros){
		List<RegistroInforme> lstRegistros=new ArrayList<RegistroInforme>();
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
	
		//la variable se llena desde el llamado del servlet al método CrearSQL
		
		if(sqlEjecutar!=null){		
			RegistroInforme reg=null;
			try {
				cn=cursor.getConnection(super.perfil);
				ps=cn.prepareStatement(sqlEjecutar);		
				rs=ps.executeQuery();
				while(rs.next()){
					reg=new RegistroInforme();
					for(int j=1;j<=parametros.getEtiquetasCamposMostrar().size();j++){						
						reg.registro.add(rs.getString(j));
					}
				/*	for(String r:reg.registro)
						System.out.print(""+r+"\t");*/
					lstRegistros.add(reg);
					//System.out.println("");
				}
			}catch (SQLException e) {
				lanzaExcepcion(e);
				setMensaje(e.getMessage());
			}catch (Exception e) {
				lanzaExcepcion(e);
			}finally{
				cerrar(rs);
				cerrar(ps);
				cerrar(cn);
			}
		}
		return lstRegistros;
	}
	
	
	
	/**Método encargado de crear la sentencia SQL a partir de la información relacionada en la JSP de Configuración del Informe ****/
	
	public String CrearSql(ParametrosInformeObj parametros){
		String sqlResultado="select ";
		String tablasInvolucradas=""; //variable que contendrá el listado de tablas seleccionadas en la JSP de Configuración del Informe
		String camposWhere=""; //variable que contendrá las restricciones de la SQL 
		String camposParaMostrar=""; //Variable que contiene la lista de campos que aparecerán en el informe
		
		/****Recorriendo la lista de checks para armar el String con únicamente los checks que tiene valor*****/
		CampoObj campo=null;
		for(String p: parametros.getCamposParaMostrar()){
			if(!p.equals("-")){
				campo=mapaCampos.get(p);
				if(campo.getCaso()!=null)
					camposParaMostrar+=","+campo.getCaso();
				else
					camposParaMostrar+=","+campo.getNombreCampo();
			}
		}
		if(camposParaMostrar.length()>0){
			camposParaMostrar="select distinct "+camposParaMostrar.substring(1,camposParaMostrar.length());
		}
		/******************************************************************************************************/
				
		/** Recoriendo el listado de tablas seleccionadas en la JSP de Configuración *****/
		for(String id: parametros.getTablasSeleccionadas()){
			tablasInvolucradas+=","+getNombreTablas(Integer.parseInt(id)).getNombreTabla();
		}
		if(tablasInvolucradas.length()>0)
			tablasInvolucradas=" from "+tablasInvolucradas.substring(1,tablasInvolucradas.length());
		
		/******************************************************************************************************/
		

		/** Recoriendo el listado de campos seleccionadas para la clausula "where" de la SQL *****/
		for(int i=0; i<parametros.getEstadoValorCampoFiltro().length;i++){
			if(parametros.getEstadoValorCampoFiltro()[i]!=0){
				switch(parametros.getEstadoValorCampoFiltro()[i]){
					case 1:camposWhere+="and "+parametros.getCamposFiltroConsulta()[i]+" is null ";	break;
					case 2:camposWhere+="and "+parametros.getCamposFiltroConsulta()[i]+" is not null "; break;
					case 3:
						campo=mapaCampos.get(parametros.getCamposFiltroConsulta()[i]);
						if(campo.getTipoCampo().equals("numero")||campo.getTipoCampo().equals("boolean"))
							camposWhere+="and "+parametros.getCamposFiltroConsulta()[i]+" = "+parametros.getValoresFiltroConsulta()[i];
						else if(campo.getTipoCampo().equals("string"))
							camposWhere+="and "+parametros.getCamposFiltroConsulta()[i]+" like '"+parametros.getValoresFiltroConsulta()[i]+"'";
					break;
				}
			}
		}
		if(camposWhere.length()>0)
			camposWhere=" where "+camposWhere.substring(3,camposWhere.length());
		
		/******************************************************************************************************/

		sqlResultado=camposParaMostrar+ tablasInvolucradas+ camposWhere;
		
		System.out.println("-----SQL resultante---->"+sqlResultado);
		
		return sqlResultado;
	}
	
	/*** Método encargado de obtener las etiquetas de los campos a mostrar **/
	public ParametrosInformeObj getNewObjParametros(ParametrosInformeObj parametros, List<CampoObj>lstCampos){
		
		/**** llenar el mapa con el listado de campos encontrados*/
		for(CampoObj campo: lstCampos){
			mapaCampos.put(campo.getNombreCampo(), campo);
		}
		CampoObj campo;
		for(int i=0; i<parametros.getCamposParaMostrar().length;i++){
			campo=mapaCampos.get(parametros.getCamposFiltroConsulta()[i]); //capturar el objeto campo a partir del nombre del campo
			parametros.getEtiquetasCamposMostrar().add(campo.getEtiquetaCampo()); // agregar la etiqueta de ese campo en el listado de etiquetas
		}
		return parametros;
	}
	
	/******************************************************************************************************/
	
	/*** Método encargado de traer los datos de una tabla específica ****/
	public TablaObj getNombreTablas(int idTabla){
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		TablaObj tabla=null;
		int i=0;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getTabla"));
			ps.setInt(1, idTabla);
			rs=ps.executeQuery();
			while(rs.next()){	
				i=1;
				tabla=new TablaObj();
				tabla.setIdTabla(rs.getInt(i++));
				tabla.setEtiquetaTabla(rs.getString(i++));
				tabla.setNombreTabla(rs.getString(i++));
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
		return tabla;
	}
	
	
	public void analizaSQL(String sql){
		String []camposSelect=null;
		this.parametros=new ParametrosInformeObj();
		List<String> etiquetasCamposMostrar=new ArrayList<String>();
		sqlEjecutar=sql;
	//	System.out.println("----------->"+sqlEjecutar);
		if(sql.contains("union all")){
			sql=sql.substring(0,sql.indexOf("union all")).trim(); //dejar únicamente la primera SQL del join para sacar los campos a mostrar 
		}
		if(sql.contains("select") && sql.contains("from")){
			sql=sql.substring(6,sql.lastIndexOf("from")).trim(); //separar los campos a mostrar en el informe
			if(sql.contains(","))
				camposSelect=sql.split(",");
			else
				camposSelect=new String[]{sql};
		}
		if(camposSelect!=null)
			if(camposSelect.length>0){
				for(String campo:camposSelect){
					campo=campo.trim();
					if(campo.contains("case"))
						campo=campo.substring(4,campo.indexOf(" ")); //tomar la primera palabra que se encuentra despues de la palabra CASE 
					campo=campo.trim(); // quitar los caracteres en blanco que puedan quedar en el nombre del campo
					etiquetasCamposMostrar.add(getEtiquetaCampo(campo)); //buscar el nombre de la etiqueta
				}
				parametros.setEtiquetasCamposMostrar(etiquetasCamposMostrar);
			}
	}
	
	/*** método para obtener el nombre de una etiqueta a partir del nombre del campo ****/
	public String getEtiquetaCampo(String nombreCampo){
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String etiqueta=null;
		int i=0;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getEtiqueta"));
			ps.setString(1, nombreCampo);
			rs=ps.executeQuery();
			while(rs.next()){	
				i=1;
				etiqueta=rs.getString(1);
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
		return etiqueta;
	}
	/*** Método encargado de almacenar las SQL que son guardadas como informes ****/
	public boolean insertaSQL(SQLObj sqlNueva){
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		boolean retorno=true;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("insertaSQL"));
			ps.setString(i++, sqlNueva.getSql());
			ps.setString(i++, sqlNueva.getNombreInforme());
			ps.setString(i++, sqlNueva.getDescripcion());
			ps.executeUpdate();
					
		}catch (SQLException e) {
			lanzaExcepcion(e);
			retorno=false;
		}catch (Exception e) {
			lanzaExcepcion(e);
			retorno=false;
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return retorno;
	}
	
	
	/*** Método encargado de consultar el listado de las SQL que son guardadas como informes ****/
	public List<SQLObj> consultaInformesSQL(){
		System.out.println("Ingreso a consutlar las sentencias almacenadas");
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		SQLObj sql=null;
		List<SQLObj> lstSQL=new ArrayList<SQLObj>();
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("consultaInformesSQL"));			
			rs=ps.executeQuery();
			while(rs.next()){	
				i=1;
				sql=new SQLObj();
				sql.setId(rs.getInt(i++));
				sql.setFechaCreacion(rs.getString(i++));
				sql.setNombreInforme(rs.getString(i++));
				sql.setDescripcion(rs.getString(i++));
				sql.setSql(rs.getString(i++));
				System.out.println(sql.getSql());
				lstSQL.add(sql);
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
		return lstSQL;
	}
	/***** método encargado de consultar una SQL almacenada previamente*/
	public String getSql(String id){
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql=null;
		int i=0;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getSQL"));
			ps.setInt(1, Integer.parseInt(id));
			rs=ps.executeQuery();
			while(rs.next()){	
				i=1;
				sql=rs.getString(1);
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
		return sql;
	}
}
