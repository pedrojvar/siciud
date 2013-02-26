package cidc.proyectos.obj;

import java.io.Serializable;

public class GastosRubro implements Serializable{
	private long idProyecto;
	private String idGasto;
	private long idRubro;
	private String nombreRubro;
	private String codigo;
	private String valorGasto;
	private String descripcion;
	private String fecha;
	private int tipoGasto;
	private int para;
	private String observaciones;
	
	private String ubicacion;
	private int grupoAcargo;
	private String observacionEntrega;
	private String fechaEntrega;
	
	

	public String getUbicacion() {
		return ubicacion;
	}
	public void setUbicacion(String ubicacion) {
		this.ubicacion = ubicacion;
	}
	public int getGrupoAcargo() {
		return grupoAcargo;
	}
	public void setGrupoAcargo(int grupoAcargo) {
		this.grupoAcargo = grupoAcargo;
	}
	public String getObservacionEntrega() {
		return observacionEntrega;
	}
	public void setObservacionEntrega(String observacionEntrega) {
		this.observacionEntrega = observacionEntrega;
	}
	public String getFechaEntrega() {
		return fechaEntrega;
	}
	public void setFechaEntrega(String fechaEntrega) {
		this.fechaEntrega = fechaEntrega;
	}
	public String getDescripcion(){
		return descripcion;
	}
	public String getFecha(){
		return fecha;
	}
	public String getIdGasto() {
		return idGasto;
	}
	public long getIdRubro() {
		return idRubro;
	}
	public String getValorGasto() {
		return valorGasto;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public void setIdGasto(String idGasto) {
		this.idGasto = idGasto;
	}
	public void setIdRubro(long idRubro) {
		this.idRubro = idRubro;
	}
	public void setValorGasto(String valorGasto) {
		this.valorGasto = valorGasto;
	}
	public int getTipoGasto() {
		return tipoGasto;
	}
	public void setTipoGasto(int tipoGasto) {
		this.tipoGasto = tipoGasto;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getObservaciones() {
		return observaciones;
	}
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}
	public int getPara() {
		return para;
	}
	public void setPara(int para) {
		this.para = para;
	}
	public long getIdProyecto() {
		return idProyecto;
	}
	public void setIdProyecto(long idProyecto) {
		this.idProyecto = idProyecto;
	}
	public String getNombreRubro() {
		return nombreRubro;
	}
	public void setNombreRubro(String nombreRubro) {
		this.nombreRubro = nombreRubro;
	}
}
