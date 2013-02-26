package cidc.adminArticulos.obj;

public class DatEvaluador {

	private int tipo;
	private long id;
	private String nombre;
	private String mail;
	private String asignacion;
	private String respuesta;
	private String estado;
	private String cancela;

	public String getAsignacion() {
		return asignacion;
	}
	public String getCancela() {
		return cancela;
	}
	public String getEstado() {
		return estado;
	}
	public long getId() {
		return id;
	}
	public String getMail() {
		return mail;
	}
	public String getNombre() {
		return nombre;
	}
	public int getTipo() {
		return tipo;
	}
	public void setAsignacion(String asignacion) {
		this.asignacion = asignacion;
	}
	public void setCancela(String cancela) {
		this.cancela = cancela;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public void setId(long id) {
		this.id = id;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}
	public String getRespuesta() {
		return respuesta;
	}
	public void setRespuesta(String respuesta) {
		this.respuesta = respuesta;
	}




}

