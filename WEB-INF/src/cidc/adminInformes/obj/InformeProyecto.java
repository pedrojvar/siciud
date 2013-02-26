package cidc.adminInformes.obj;

import java.io.Serializable;

public class InformeProyecto implements Serializable{

	private long idProyecto;
	private long idInforme;
	private String fechaEntrega;
	private int estado;
	private int tipo;
	private String observaciones;
	private String nombreArchivo;

	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public String getFechaEntrega() {
		return fechaEntrega;
	}
	public void setFechaEntrega(String fechaEntrega) {
		this.fechaEntrega = fechaEntrega;
	}
	public long getIdInforme() {
		return idInforme;
	}
	public void setIdInforme(long idInforme) {
		this.idInforme = idInforme;
	}
	public long getIdProyecto() {
		return idProyecto;
	}
	public void setIdProyecto(long idProyecto) {
		this.idProyecto = idProyecto;
	}
	public int getTipo() {
		return tipo;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}
	public String getObservaciones() {
		return observaciones;
	}
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}
	public String getNombreArchivo() {
		return nombreArchivo;
	}
	public void setNombreArchivo(String nombreArchivo) {
		this.nombreArchivo = nombreArchivo;
	}
}

