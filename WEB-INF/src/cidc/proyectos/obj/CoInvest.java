package cidc.proyectos.obj;

import java.io.Serializable;

public class CoInvest implements Serializable{
	private String id;
	private String nombre;
	private String papel;

	public String getId() {
		return id;
	}
	public String getNombre() {
		return nombre!=null?nombre:"";
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getPapel() {
		return papel;
	}
	public void setPapel(String papel) {
		this.papel = papel;
	}
}

