package cidc.proyectosAntiguos.obj;

import java.io.Serializable;

public class GeneralOBJ implements Serializable{

	private long idObservacion;
	private String observacion;
	private String usuario;
	private String fecha;
	private int flag;

	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public long getIdObservacion() {
		return idObservacion;
	}
	public void setIdObservacion(long idObservacion) {
		this.idObservacion = idObservacion;
	}
	public String getObservacion() {
		return observacion;
	}
	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
}
