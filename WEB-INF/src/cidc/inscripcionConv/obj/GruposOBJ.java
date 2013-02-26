package cidc.inscripcionConv.obj;

import java.io.Serializable;

public class GruposOBJ implements Serializable{
	private long codigo;
	private String nombre;
	private int estado;
	private boolean movilidad;
	
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
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public boolean isMovilidad() {
		return movilidad;
	}
	public void setMovilidad(boolean movilidad) {
		this.movilidad = movilidad;
	}
		
}
