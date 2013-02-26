package cidc.evalPropuesta.obj;

import java.util.List;

public class EvalVaciaComite {

	private long idPropuesta;
	private String nombPropuesta;
	private String valorPorcentaje;
	private String nombConvocatoria;
	private List listaAspectos;


	public long getIdPropuesta() {
		return idPropuesta;
	}
	public String getNombPropuesta() {
		return nombPropuesta;
	}
	public String getValorPorcentaje() {
		return valorPorcentaje;
	}
	public List getListaAspectos() {
		return listaAspectos;
	}
	public void setListaAspectos(List listaAspectos) {
		this.listaAspectos = listaAspectos;
	}
	public void setIdPropuesta(long idPropuesta) {
		this.idPropuesta = idPropuesta;
	}
	public void setNombPropuesta(String nombPropuesta) {
		this.nombPropuesta = nombPropuesta;
	}
	public void setValorPorcentaje(String valorPorcentaje) {
		this.valorPorcentaje = valorPorcentaje;
	}
	public String getNombConvocatoria() {
		return nombConvocatoria;
	}
	public void setNombConvocatoria(String nombConvocatoria) {
		this.nombConvocatoria = nombConvocatoria;
	}


}
