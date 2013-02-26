package cidc.unidadInvestigacion.obj;

import java.io.Serializable;

public class Proyecto implements Serializable{

	private int id;
	private int flag;
	private int tipo;
	private String proyecto;
	private String director;
	private String estado;
	private String codigo;
	private String fechaAprobado;
	private String fechaInicio;
	private String totalFinanciado;
	private String nombreGrupo;
	private String nombreProyCurr;
	private String nombreConvocatoria;
	private String duracion;
	private String fechaTerminado;

	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProyecto() {
		return proyecto;
	}
	public void setProyecto(String proyecto) {
		this.proyecto = proyecto;
	}
	public int getTipo() {
		return tipo;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getDuracion() {
		return duracion;
	}
	public void setDuracion(String duracion) {
		this.duracion = duracion;
	}
	public String getFechaAprobado() {
		return fechaAprobado;
	}
	public void setFechaAprobado(String fechaAprobado) {
		this.fechaAprobado = fechaAprobado;
	}
	public String getNombreGrupo() {
		return nombreGrupo;
	}
	public void setNombreGrupo(String nombreGrupo) {
		this.nombreGrupo = nombreGrupo;
	}
	public String getNombreProyCurr() {
		return nombreProyCurr;
	}
	public void setNombreProyCurr(String nombreProyCurr) {
		this.nombreProyCurr = nombreProyCurr;
	}
	public String getTotalFinanciado() {
		return totalFinanciado;
	}
	public void setTotalFinanciado(String totalFinanciado) {
		this.totalFinanciado = totalFinanciado;
	}
	public String getFechaInicio() {
		return fechaInicio;
	}
	public void setFechaInicio(String fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	public String getNombreConvocatoria() {
		return nombreConvocatoria;
	}
	public void setNombreConvocatoria(String nombreConvocatoria) {
		this.nombreConvocatoria = nombreConvocatoria;
	}
	public String getFechaTerminado() {
		return fechaTerminado;
	}
	public void setFechaTerminado(String fechaTerminado) {
		this.fechaTerminado = fechaTerminado;
	}


}
