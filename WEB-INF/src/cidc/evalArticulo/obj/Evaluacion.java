package cidc.evalArticulo.obj;

public class Evaluacion {

	private long id;
	private float []idAspectos;
	private float []valores;

	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public float[] getValores() {
		return valores;
	}
	public void setValores(float[] valores) {
		this.valores = valores;
	}
	public float[] getIdAspectos() {
		return idAspectos;
	}
	public void setIdAspectos(float[] idAspectos) {
		this.idAspectos = idAspectos;
	}

}
