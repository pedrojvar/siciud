package cidc.notificaciones.obj;

import java.io.Serializable;

public class DatosPersona implements Serializable{

	private long idPersona;
	private String documento;
	private String nombres;
	private String apellidos;
	private String tipo;

	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public String getDocumento() {
		return documento;
	}
	public void setDocumento(String documento) {
		this.documento = documento;
	}
	public long getIdPersona() {
		return idPersona;
	}
	public void setIdPersona(long idPersona) {
		this.idPersona = idPersona;
	}
	public String getNombres() {
		return nombres;
	}
	public void setNombres(String nombres) {
		this.nombres = nombres;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}


}
