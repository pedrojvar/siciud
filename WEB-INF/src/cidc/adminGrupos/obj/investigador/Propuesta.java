package cidc.adminGrupos.obj.investigador;

import java.io.Serializable;

public class Propuesta implements Serializable{

	private long idProp;
	private int estado;
	private boolean activa;
	private String convocatoria;
	private String nombre;

	public String getConvocatoria() {
		return convocatoria;
	}
	public int getEstado() {
		return estado;
	}
	public long getIdProp() {
		return idProp;
	}
	public String getNombre() {
		return nombre;
	}
	public void setConvocatoria(String convocatoria) {
		this.convocatoria = convocatoria;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public void setIdProp(long idProp) {
		this.idProp = idProp;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public boolean getActiva() {
		return activa;
	}
	public void setActiva(boolean activa) {
		this.activa = activa;
	}
}
