package cidc.inventario.db;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cidc.general.db.BaseDB;
import cidc.general.db.CursorDB;
import cidc.general.mails.EnvioMail2;
import cidc.general.mails.Reporte;
import cidc.general.obj.CrearClaves;
import cidc.general.obj.Globales;
import cidc.inscripcionConv.obj.GruposOBJ;
import cidc.inventario.obj.Elemento;
//import cidc.util.*;
import cidc.inventario.*;



public class InventarioDB extends BaseDB{

	public InventarioDB(CursorDB c, int perfil) {
		super(c, perfil);
		// TODO Auto-generated constructor stub
		rb=ResourceBundle.getBundle("cidc.inventario.consultas");
	}

	public List AjaxGruposInvestigacion(int facultad){
		List l=new ArrayList();
		Connection cn=null;
		PreparedStatement ps=null; 
		ResultSet rs=null;
		int i=0;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("ajaxGrupos"));
			ps.setLong(1,facultad);
			rs=ps.executeQuery();
			while(rs.next()){
				i=1;
				GruposOBJ gruposOBJ=new GruposOBJ();
				gruposOBJ.setCodigo(rs.getInt(i++));
				gruposOBJ.setNombre(rs.getString(i++));
				l.add(gruposOBJ);
	//			System.out.println(gruposOBJ.getNombre());
			}
		//	System.out.println("la cantidad de grupos encontrados es:"+l.size());
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
	
	public boolean insertaElementoGrupo(Elemento elemento) {
		Connection cn=null;
		PreparedStatement ps=null;
		boolean retorno=false;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("insertaElementoGrupo"));
			ps.setInt(i++, elemento.getIdGrupo());
			ps.setString(i++, elemento.getNombreElemento());
			ps.setString(i++, elemento.getFecha());			
			ps.setInt(i++, elemento.getTipo());
			ps.setString(i++, elemento.getCodigo());
			ps.setLong(i++, elemento.getValor());
			ps.setString(i++, elemento.getObservacion());
			ps.executeUpdate();
			retorno=true;
		//	System.out.println("Inserta Correctamente "+per.getIdNombre());
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
	
	//Consulta 
	public List<Elemento> listaElementosProyecto(String idGrupo) {
		Connection cn=null;
		PreparedStatement ps=null;
		String ruta="C:/Users/";
		ResultSet rs=null;
		Elemento elem=null;
		List<Elemento> lista=new ArrayList<Elemento>();
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			
			ps=cn.prepareStatement(rb.getString("ListaElementosPorProyecto"));
			ps.setInt(1,Integer.parseInt(idGrupo));
			ps.setInt(2,Integer.parseInt(idGrupo));
			rs=ps.executeQuery();
			while(rs.next()){
				i=1;
				elem=new Elemento();
				elem.setIdProyecto(rs.getInt(i++));
				elem.setCodProyecto(rs.getString(i++));
				elem.setNombreProyecto(rs.getString(i++));
				elem.setNombreDirector(rs.getString(i++));
				elem.setNombreElemento(rs.getString(i++));
				elem.setFecha(rs.getString(i++));
				elem.setCodigo(rs.getString(i++));				
				elem.setValor(rs.getLong(i++));
				elem.setObservacion(rs.getString(i++));
				lista.add(elem);
			}
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(ps);
			cerrar(cn);
		}
		System.out.printf("Antes de invocar la clase de generación del Excel");
		
		return lista;
	}
	
	
	public List<Elemento> buscarElemento(Elemento filtro) {
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		Elemento elem=null;
		String placa="",nombre="";
		int op1=0,op2=0,op3=0,op4=0,op5=0; // valores de rubros para el inventario de los proyectos
		int opg1=0,opg2=0,opg3=0;			// valores de categorias para el inventario de los grupos 
		
		opg1=opg2=opg3=filtro.getCategoria();
		if(filtro.getCategoria()==1){
			op1=op2=op3=op4=op5=7; //el valor 7 corresponde al Id del rubro bibliografía segun tabla b_rubros
		}else if(filtro.getCategoria()==2){
			op1=op2=op3=op4=op5=8; //el valor 8 corresponde al Id del rubro software segun tabla b_rubros
		}else if(filtro.getCategoria()==3){
			op1=18;op2=19;op3=5;op4=op5=5;
		}else{
			op1=18;op2=19;op3=5;op4=7;op5=8;
			opg1=1;opg2=2;opg3=3;
		}
		
		List <Elemento>lista=new ArrayList<Elemento>();
		
		
		if(filtro.getCodigo()!=null){
			if(filtro.getCodigo().trim().equals(""))
				placa="%";
			else
				placa="%"+filtro.getCodigo()+"%";
		}else
			placa="%";
		if(filtro.getNombreElemento()!=null){
			if(filtro.getNombreElemento().trim().equals(""))
				nombre="%";
			else
				nombre="%"+filtro.getNombreElemento()+"%";
		}else
			nombre="%";
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("buscarElemento"));
			//insertando valores para la SQL de inventario para proyectos nuevos
			ps.setString(i++,nombre);
			ps.setString(i++,placa);			
			ps.setInt(i++, op1);
			ps.setInt(i++, op2);
			ps.setInt(i++, op3);
			ps.setInt(i++, op4);
			ps.setInt(i++, op5);
			//insertando valores para la SQL de inventario para proyectos digitalizados
			ps.setString(i++,nombre);
			ps.setString(i++,placa);
			ps.setInt(i++, op1);
			ps.setInt(i++, op2);
			ps.setInt(i++, op3);
			ps.setInt(i++, op4);
			ps.setInt(i++, op5);
			//insertando valores para la SQL de inventario para Grupos y Semilleros
			
			ps.setString(i++,nombre);
			ps.setString(i++,placa);
			ps.setInt(i++, opg1);
			ps.setInt(i++, opg2);
			ps.setInt(i++, opg3);

			rs=ps.executeQuery();
			while(rs.next()){
				i=1;
				elem=new Elemento();
				elem.setFecha(rs.getString(i++));
				elem.setNombreElemento(rs.getString(i++));
				elem.setCodigo(rs.getString(i++));				
				elem.setValor(rs.getLong(i++));
				elem.setObservacion(rs.getString(i++));
				elem.setTipoElemento(rs.getString(i++));
				elem.setGrpobserventrega((rs.getString(i++)));
				lista.add(elem);
			}			
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(ps);
			cerrar(cn);
		}
		filtro.setNombreElemento("");
		filtro.setCodigo("");
		return lista;
	}

	public List<Elemento> listaElementosGrupo(String idGrupo) {
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		Elemento elem=null;
		List<Elemento> lista=new ArrayList<Elemento>();
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("ListaElementosPorGrupo"));
			ps.setInt(1,Integer.parseInt(idGrupo));
			rs=ps.executeQuery();
		//	System.out.println("----->"+ps);
			while(rs.next()){
				i=1;
				elem=new Elemento();
				elem.setFecha(""+rs.getDate(i++));
				elem.setNombreElemento(rs.getString(i++));
				elem.setCodigo(rs.getString(i++));				
				elem.setValor(rs.getLong(i++));
				elem.setObservacion(rs.getString(i++));
				lista.add(elem);
			}			
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(ps);
			cerrar(cn);
		}
		return lista;
	}
}

