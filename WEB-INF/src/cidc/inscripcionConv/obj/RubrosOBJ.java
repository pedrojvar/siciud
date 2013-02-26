package cidc.inscripcionConv.obj;

import java.io.Serializable;

public class RubrosOBJ implements Serializable{
	private long codigo;
	private String nombre="";
	private String valor="";

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
	public String getValor() {
		return valor;
	}
	public void setValor(String valor) {
		this.valor = valor;
	}
}
