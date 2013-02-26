package cidc.notificaciones.obj;

import java.io.Serializable;

public class FiltroPersona implements Serializable{

	private int para;
	private int prioridad;
	private String documento;
	private String nombres;
	private String apellidos;
	private int perfil;
	private int []persona;
	private String descripcion;

	public int getPerfil() {
		return perfil;
	}
	public void setPerfil(int perfil) {
		this.perfil = perfil;
	}
	public String getApellidos() {
		return apellidos !=null ? apellidos:"%";
	}
	public void setApellidos(String apellidos) {
		this.apellidos = "%"+apellidos+"%";
	}
	public String getDocumento() {
		return documento !=null ? documento:"%";
	}
	public void setDocumento(String documento) {
		this.documento = "%"+documento+"%";
	}
	public String getNombres() {
		return nombres !=null ? nombres:"%";
	}
	public void setNombres(String nombres) {
		this.nombres = "%"+nombres+"%";
	}
	public int getPara() {
		return para;
	}
	public void setPara(int para) {
		this.para = para;
	}
	public int[] getPersona() {
		return persona;
	}
	public void setPersona(int[] persona) {
		this.persona = persona;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public int getPrioridad() {
		return prioridad;
	}
	public void setPrioridad(int prioridad) {
		this.prioridad = prioridad;
	}

}
