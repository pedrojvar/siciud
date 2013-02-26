package cidc.proyectos.obj;

import java.io.Serializable;

public class Devolutivo implements Serializable{
	
	private long idProyecto;
	private long idRubro;
	private long [] idGasto;
	private long [] grupoAcargo;
	private String [] ubicar;
	private String [] descripcion;
	private String [] fechaEntrega;
	private String [] observacionEntrega;
	
	public long getIdProyecto() {
		return idProyecto;
	}
	public void setIdProyecto(long idProyecto) {
		this.idProyecto = idProyecto;
	}
	public long getIdRubro() {
		return idRubro;
	}
	public void setIdRubro(long idRubro) {
		this.idRubro = idRubro;
	}
	public long[] getIdGasto() {
		return idGasto;
	}
	public void setIdGasto(long[] idGasto) {
		this.idGasto = idGasto;
	}
	public long[] getGrupoAcargo() {
		return grupoAcargo;
	}
	public void setGrupoAcargo(long[] grupoAcargo) {
		this.grupoAcargo = grupoAcargo;
	}
	
	public String[] getUbicar() {
		return ubicar;
	}
	public void setUbicar(String[] ubicar) {
		this.ubicar = ubicar;
	}
	public String[] getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String[] descripcion) {
		this.descripcion = descripcion;
	}
	public String[] getFechaEntrega() {
		return fechaEntrega;
	}
	public void setFechaEntrega(String[] fechaEntrega) {
		this.fechaEntrega = fechaEntrega;
	}
	public String[] getObservacionEntrega() {
		return observacionEntrega;
	}
	public void setObservacionEntrega(String[] observacionEntrega) {
		this.observacionEntrega = observacionEntrega;
	}
	
}
