package cidc.evalPropuesta.obj;

public class CapturaEvalOBJ {

	private long prop;
	private int []idAspecto;
	private double []valAspecto;
	private int []idCriterio;
	private String []observaciones;


	public int[] getIdAspecto() {
		return idAspecto;
	}
	public String [] getObservaciones() {
		return observaciones;
	}
	public long getProp() {
		return prop;
	}
	public double[] getValAspecto() {
		return valAspecto;
	}
	public void setIdAspecto(int[] idAspecto) {
		this.idAspecto = idAspecto;
	}
	public void setObservaciones(String [] observaciones) {
		this.observaciones = observaciones;
	}
	public void setProp(long prop) {
		this.prop = prop;
	}
	public void setValAspecto(double[] valAspecto) {
		this.valAspecto = valAspecto;
	}
	public int[] getIdCriterio() {
		return idCriterio;
	}
	public void setIdCriterio(int[] idCriterio) {
		this.idCriterio = idCriterio;
	}
}
