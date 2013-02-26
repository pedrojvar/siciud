package cidc.proyectosAntiguos.obj;

import java.io.Serializable;

public class CoinvestigadoresOBJ implements Serializable{

	private int id;
	private int proyecto;
	private String nombres = null;
	private String apellidos = null;
	private String rol = null;
	private String fechaIngreso = null;
	private String fechaSalida = null;


	public String getFechaIngreso() {
		return fechaIngreso;
	}
	public void setFechaIngreso(String fechaIngreso) {
		this.fechaIngreso = fechaIngreso;
	}
	public String getFechaSalida() {
		return fechaSalida;
	}
	public void setFechaSalida(String fechaSalida) {
		this.fechaSalida = fechaSalida;
	}
	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombres() {
		return nombres;
	}
	public void setNombres(String nombres) {
		this.nombres = nombres;
	}
	public int getProyecto() {
		return proyecto;
	}
	public void setProyecto(int proyecto) {
		this.proyecto = proyecto;
	}
	public String getRol() {
		return rol;
	}
	public void setRol(String rol) {
		this.rol = rol;
	}



}
