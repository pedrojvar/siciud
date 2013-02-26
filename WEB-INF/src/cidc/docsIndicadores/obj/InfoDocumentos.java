package cidc.docsIndicadores.obj;

import java.io.Serializable;

public class InfoDocumentos implements Serializable
{
	private int categoria;
	private int tipo;
	private String observaciones;
	private String descripcion;
	private String nombre;
	private String imagen;
	private int tipodoc;
	private long usuario;

	public String getObservaciones() {
		return observaciones;
	}
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int getTipodoc() {
		return tipodoc;
	}
	public void setTipodoc(int tipodoc) {
		this.tipodoc = tipodoc;
	}
	public int getCategoria() {
		return categoria;
	}
	public void setCategoria(int categoria) {
		this.categoria = categoria;
	}
	public int getTipo() {
		return tipo;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}
	public long getUsuario() {
		return usuario;
	}
	public void setUsuario(long usuario) {
		this.usuario = usuario;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getImagen() {
		return imagen;
	}
	public void setImagen(String imagen) {
		this.imagen = imagen;
	}
}