package cidc.proyectosGeneral.obj;

import java.io.Serializable;

public class CoInvest implements Serializable{
	private int id;
	private String nombre;
	private String apellido;
	private String documento;
	private String papel;
	private String fechaInicio;
	private String fechaFin;
	
	//NUEVOS DATOS SEGÚN REQUERIMIENTOS
	
	private String codigo;
	private int proyectocurricular;	
	private String proyectocnombre;
	
	
	public String getProyectocnombre() {
		return proyectocnombre;
	}
	public void setProyectocnombre(String proyectocnombre) {
		this.proyectocnombre = proyectocnombre;
	}
	public int getProyectocurricular() {
		return proyectocurricular;
	}
	public void setProyectocurricular(int proyectocurricular) {
		this.proyectocurricular = proyectocurricular;
	}
	public int getId() {
		return id;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getNombre() {
		return nombre;
	}
	public String getDocumento() {
		return documento;
	}
	public String getPapel() {
		return papel;
	}
	public String getFechaInicio() {
		return fechaInicio;
	}
	public String getFechaFin() {
		return fechaFin;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public void setDocumento(String documento) {
		this.documento = documento;
	}
	public void setPapel(String papel) {
		this.papel = papel;
	}
	public void setFechaInicio(String fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	public void setFechaFin(String fechaFin) {
		this.fechaFin = fechaFin;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}			
}

