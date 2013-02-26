package cidc.notificaciones.obj;

import java.io.Serializable;

public class Notificacion implements Serializable{

	private long idNotificacion;
	private long idPersona;
	private int perfil;
	private String descripcion;
	private String fechaPublicacion;
	private String fechaAtencion;
	private String asigPor;
	private int estado;
	private int nivel;

	private long []listaPersonas;
	private long []para;

	public String getAsigPor() {
		return asigPor;
	}
	public void setAsigPor(String asigPor) {
		this.asigPor = asigPor;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public String getFechaAtencion() {
		return fechaAtencion;
	}
	public void setFechaAtencion(String fechaAtencion) {
		this.fechaAtencion = fechaAtencion;
	}
	public String getFechaPublicacion() {
		return fechaPublicacion;
	}
	public void setFechaPublicacion(String fechaPublicacion) {
		this.fechaPublicacion = fechaPublicacion;
	}
	public long getIdNotificacion() {
		return idNotificacion;
	}
	public void setIdNotificacion(long idNotificacion) {
		this.idNotificacion = idNotificacion;
	}
	public long getIdPersona() {
		return idPersona;
	}
	public void setIdPersona(long idPersona) {
		this.idPersona = idPersona;
	}
	public long[] getListaPersonas() {
		return listaPersonas;
	}
	public void setListaPersonas(long[] listaPersonas) {
		this.listaPersonas = listaPersonas;
	}
	public int getNivel() {
		return nivel;
	}
	public void setNivel(int nivel) {
		this.nivel = nivel;
	}
	public long[] getPara() {
		return para;
	}
	public void setPara(long[] para) {
		this.para = para;
	}
	public int getPerfil() {
		return perfil;
	}
	public void setPerfil(int perfil) {
		this.perfil = perfil;
	}


}
