package cidc.evalPropuesta.obj;

public class PorEvaluar {

	private long id;
	private String nombre;
	private String urlArchivo;
	private int estado;
	private String convocatoria;

	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public long getId() {
		return id;
	}
	public String getNombre() {
		return nombre;
	}
	public String getUrlArchivo() {
		return urlArchivo;
	}
	public void setId(long id) {
		this.id = id;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public void setUrlArchivo(String urlArchivo) {
		this.urlArchivo = urlArchivo;
	}
	public String getConvocatoria() {
		return convocatoria;
	}
	public void setConvocatoria(String convocatoria) {
		this.convocatoria = convocatoria;
	}

}
