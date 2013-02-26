package cidc.adminGrupos.obj;

import java.io.Serializable;

public class FiltroPersona implements Serializable{

	private String nombres;
	private String apellidos;
	private String mail;
	private String cedula;
	private long idPersona;

	public String getApellidos() {
		return apellidos !=null ? apellidos:"%";
	}
	public String getCedula() {
		return cedula !=null ? cedula:"%";
	}
	public long getIdPersona() {
		return idPersona;
	}
	public String getMail() {
		return mail != null ? mail:"%";
	}
	public String getNombres() {
		return nombres != null ? nombres:"%";
	}
	public void setApellidos(String apellidos) {
		this.apellidos = "%"+apellidos+"%";
	}
	public void setCedula(String cedula) {
		this.cedula = "%"+cedula+"%";
	}
	public void setIdPersona(long idPersona) {
		this.idPersona = idPersona;
	}
	public void setMail(String mail) {
		this.mail = "%"+mail+"%";
	}
	public void setNombres(String nombres) {
		this.nombres = "%"+nombres+"%";
	}

}
