package cidc.evalPropuesta.obj;

import java.util.List;

public class EvalVacia {

	private String idPropuesta;
	private String nombEvaluador;
	private List criterios;
	private List critComite;

	public List getCriterios() {
		return criterios;
	}
	public String getIdPropuesta() {
		return idPropuesta;
	}
	public void setCriterios(List criterios) {
		this.criterios = criterios;
	}
	public void setIdPropuesta(String idPropuesta) {
		this.idPropuesta = idPropuesta;
	}
	public String getNombEvaluador() {
		return nombEvaluador;
	}
	public void setNombEvaluador(String nombEvaluador) {
		this.nombEvaluador = nombEvaluador;
	}
	public List getCritComite() {
		return critComite;
	}
	public void setCritComite(List critComite) {
		this.critComite = critComite;
	}
}
