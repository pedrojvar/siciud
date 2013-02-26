package cidc.proyectosAntiguos.obj;

public class CambiosOBJ {

	private int id;
	private int idProy;
	private String solicitud = null;
	private String respuesta = null;
	private String aprobacion = null;
	private int tipo;
	private String observaciones = null;

	public String getAprobacion() {
		return aprobacion;
	}
	public void setAprobacion(String aprobacion) {
		this.aprobacion = aprobacion;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIdProy() {
		return idProy;
	}
	public void setIdProy(int idProy) {
		this.idProy = idProy;
	}
	public String getObservaciones() {
		return observaciones;
	}
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
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

}
