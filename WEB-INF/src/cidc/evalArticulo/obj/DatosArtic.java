package cidc.evalArticulo.obj;

import java.util.List;

public class DatosArtic {

	private long idArtic;
	private String nombPresentador;
	private String nombArtic;
	private String urlArchivo;
	private int estado;
	private String imgArchivo;
	private double calificacion;

	private List aspectosEvaluar;

	public int getEstado() {
		return estado;
	}
	public List getAspectosEvaluar() {
		return aspectosEvaluar;
	}
	public void setAspectosEvaluar(List aspectosEvaluar) {
		this.aspectosEvaluar = aspectosEvaluar;
	}
	public long getIdArtic() {
		return idArtic;
	}
	public String getNombArtic() {
		return nombArtic;
	}
	public String getUrlArchivo() {
		return urlArchivo;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public void setIdArtic(long idArtic) {
		this.idArtic = idArtic;
	}
	public void setNombArtic(String nombArtic) {
		this.nombArtic = nombArtic;
	}
	public void setUrlArchivo(String urlArchivo) {
		this.urlArchivo = urlArchivo;
	}
	public String getNombPresentador() {
		return nombPresentador;
	}
	public void setNombPresentador(String nombPresentador) {
		this.nombPresentador = nombPresentador;
	}
	public double getCalificacion() {
		return calificacion;
	}
	public void setCalificacion(double calificacion) {
		this.calificacion = calificacion;
	}
	public String getImgArchivo() {
		return imgArchivo;
	}
	public void setImgArchivo(String imgArchivo) {
		this.imgArchivo = imgArchivo;
	}



}
