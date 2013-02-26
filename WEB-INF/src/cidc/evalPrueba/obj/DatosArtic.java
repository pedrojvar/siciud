package cidc.evalPrueba.obj;

public class DatosArtic {

	private long idArtic;
	private long idEval;
	private String nombArtic;
	private String urlArchivo;
	private String nombEval;
	private int estado;

	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public long getIdArtic() {
		return idArtic;
	}
	public long getIdEval() {
		return idEval;
	}
	public String getNombArtic() {
		return nombArtic;
	}
	public String getNombEval() {
		return nombEval;
	}
	public String getUrlArchivo() {
		return urlArchivo;
	}
	public void setIdArtic(long idArtic) {
		this.idArtic = idArtic;
	}
	public void setIdEval(long idEval) {
		this.idEval = idEval;
	}
	public void setNombArtic(String nombArtic) {
		this.nombArtic = nombArtic;
	}
	public void setNombEval(String nombEval) {
		this.nombEval = nombEval;
	}
	public void setUrlArchivo(String urlArchivo) {
		this.urlArchivo = urlArchivo;
	}



}
