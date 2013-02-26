package cidc.adminEvaluador.obj;

public class PropuestaOBJ {

	private long codPropuesta ;
	private String convocatoria;
	private String nomDirector;
	private String nomPropuesta;
	private int estadoEval;
	private int estadoPropuesta;

	public long getCodPropuesta() {
		return codPropuesta;
	}
	public String getConvocatoria() {
		return convocatoria;
	}
	public int getEstadoEval() {
		return estadoEval;
	}
	public String getNomDirector() {
		return nomDirector;
	}
	public String getNomPropuesta() {
		return nomPropuesta;
	}
	public void setCodPropuesta(long codPropuesta) {
		this.codPropuesta = codPropuesta;
	}
	public void setConvocatoria(String convocatoria) {
		this.convocatoria = convocatoria;
	}
	public void setEstadoEval(int estadoEval) {
		this.estadoEval = estadoEval;
	}
	public void setNomDirector(String nomDirector) {
		this.nomDirector = nomDirector;
	}
	public void setNomPropuesta(String nomPropuesta) {
		this.nomPropuesta = nomPropuesta;
	}
	public int getEstadoPropuesta() {
		return estadoPropuesta;
	}
	public void setEstadoPropuesta(int estadoPropuesta) {
		this.estadoPropuesta = estadoPropuesta;
	}
}
