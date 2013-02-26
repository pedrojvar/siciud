package cidc.indicadores.bancoVariables.obj;

import java.io.Serializable;
import java.sql.Date;

public class InfoVariables implements Serializable
{
	private String identificador;
	private String nombre;
	private int responsable;
	private String nombreresponsable;
	private String descripcion;
	private int periodo;
	private int unidad;
	private String [] tipografica;
	private String tipograficatexto;
	private String fechacreacion;
	private String fechaactualizacion;
	private Long dato;
	private long creador;
	private long modificador;
	private String nombrecreador;

	public long getModificador() {
		return modificador;
	}
	public void setModificador(long modificador) {
		this.modificador = modificador;
	}
	public long getCreador() {
		return creador;
	}
	public void setCreador(long creador) {
		this.creador = creador;
	}
	public Long getDato() {
		return dato;
	}
	public void setDato(Long dato) {
		this.dato = dato;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getFechaactualizacion() {
		return fechaactualizacion;
	}
	public void setFechaactualizacion(String fechaactualizacion) {
		this.fechaactualizacion = fechaactualizacion;
	}
	public String getFechacreacion() {
		return fechacreacion;
	}
	public void setFechacreacion(String fechacreacion) {
		this.fechacreacion = fechacreacion;
	}
	public int getResponsable() {
		return responsable;
	}
	public void setResponsable(int responsable) {
		this.responsable = responsable;
	}
	public String getNombrecreador() {
		return nombrecreador;
	}
	public void setNombrecreador(String nombrecreador) {
		this.nombrecreador = nombrecreador;
	}
	public String getNombreresponsable() {
		return nombreresponsable;
	}
	public void setNombreresponsable(String nombreresponsable) {
		this.nombreresponsable = nombreresponsable;
	}
	public String getIdentificador() {
		return identificador;
	}
	public void setIdentificador(String identificador) {
		this.identificador = identificador;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int getPeriodo() {
		return periodo;
	}
	public void setPeriodo(int periodo) {
		this.periodo = periodo;
	}
	public String[] getTipografica() {
		return tipografica;
	}
	public void setTipografica(String[] tipografica) {
		this.tipografica = tipografica;
	}
	public String getTipograficatexto() {
		return tipograficatexto;
	}
	public void setTipograficatexto(String tipograficatexto) {
		this.tipograficatexto = tipograficatexto;
	}
	public int getUnidad() {
		return unidad;
	}
	public void setUnidad(int unidad) {
		this.unidad = unidad;
	}
}