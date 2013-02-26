package cidc.proyectos.obj;

import java.io.Serializable;

public class CambiosProy implements Serializable{

	private int id;
	private int tipo;
	private String tipoTxt;
	private String solicitud;
	private String respuesta;
	private String descripcion;
	private String observacion;


	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getObservacion() {
		return observacion;
	}
	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}
	public String getRespuesta() {
		return respuesta;
	}
	public void setRespuesta(String respuesta) {
		this.respuesta = respuesta;
	}
	public String getSolicitud() {
		return solicitud;
	}
	public void setSolicitud(String solicitud) {
		this.solicitud = solicitud;
	}
	public int getTipo() {
		return tipo;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}
	public String getTipoTxt() {
		return tipoTxt;
	}
	public void setTipoTxt(String tipoTxt) {
		this.tipoTxt = tipoTxt;
	}
}


