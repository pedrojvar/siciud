package cidc.inventario.obj;

import java.io.Serializable;

public class Elemento implements Serializable{

	private int idGrupo;
	private int idProyecto;	
	private int idElemento;
	private int tipoInventario;
	private int categoria;
		
	private String codProyecto;	
	private String nombreElemento;
	private String nombreDirector;
	private String nombreProyecto;
	private String categoriaTxt;
	
	private String fecha;
	private int tipo;
	private long valor;
	private String codigo;
	private String observacion;
	private String tipoElemento;
	//Declarar la variable de observaciones grpobserventrega
	private String grpobserventrega;

	public String getCodProyecto() {
		return codProyecto;
	}
	public String getTipoElemento() {
		return tipoElemento;
	}
	public void setTipoElemento(String tipoElemento) {
		this.tipoElemento = tipoElemento;
	}
	public void setCodProyecto(String codProyecto) {
		this.codProyecto = codProyecto;
	}
	public String getNombreProyecto() {
		return nombreProyecto;
	}
	public void setNombreProyecto(String nombreProyecto) {
		this.nombreProyecto = nombreProyecto;
	}
	public int getIdProyecto() {
		return idProyecto;
	}
	public void setIdProyecto(int idProyecto) {
		this.idProyecto = idProyecto;
	}
	public int getIdGrupo() {
		return idGrupo;
	}
	public void setIdGrupo(int idGrupo) {
		this.idGrupo = idGrupo;
	}
	public int getIdElemento() {
		return idElemento;
	}
	public void setIdElemento(int idElemento) {
		this.idElemento = idElemento;
	}
	public int getTipoInventario() {
		return tipoInventario;
	}
	public void setTipoInventario(int tipoInventario) {
		this.tipoInventario = tipoInventario;
	}
	public String getNombreElemento() {
		return nombreElemento;
	}
	public void setNombreElemento(String nombreElemento) {
		this.nombreElemento = nombreElemento;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public int getTipo() {
		return tipo;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}
	public long getValor() {
		return valor;
	}
	public void setValor(long valor) {
		this.valor = valor;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getObservacion() {
		return observacion;
	}
	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}
	public String getNombreDirector() {
		return nombreDirector;
	}
	public void setNombreDirector(String nombreDirector) {
		this.nombreDirector = nombreDirector;
	}
	public int getCategoria() {
		return categoria;
	}
	public void setCategoria(int categoria) {
		this.categoria = categoria;
	}
	public String getCategoriaTxt() {
		return categoriaTxt;
	}
	public void setCategoriaTxt(String categoriaTxt) {
		this.categoriaTxt = categoriaTxt;
	}
	public String getGrpobserventrega() {
		return grpobserventrega;
	}
	public void setGrpobserventrega(String grpobserventrega) {
		this.grpobserventrega = grpobserventrega;
	}
}
