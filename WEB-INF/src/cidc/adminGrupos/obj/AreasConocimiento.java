package cidc.adminGrupos.obj;

import java.io.Serializable;

public class AreasConocimiento implements Serializable{
	
	private int codigo;
	private String nombre;	
	private boolean subarea;
	
	
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public boolean isSubarea() {
		return subarea;
	}
	public void setSubarea(boolean subarea) {
		this.subarea = subarea;
	}
	
	
}
