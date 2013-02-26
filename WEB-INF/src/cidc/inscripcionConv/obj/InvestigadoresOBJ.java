package cidc.inscripcionConv.obj;

import java.io.Serializable;

public class InvestigadoresOBJ implements Serializable{
	private long codigo;
	private String nombre;
	
	//Tutor del proyecto de investigacion
	
	private String director;
	private long idDirector;
	
	public long getCodigo() {
		return codigo;
	}
	public void setCodigo(long codigo) {
		this.codigo = codigo;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public long getIdDirector() {
		return idDirector;
	}
	public void setIdDirector(long idDirector) {
		this.idDirector = idDirector;
	}
}
