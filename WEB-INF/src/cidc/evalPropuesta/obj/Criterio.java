package cidc.evalPropuesta.obj;

import java.util.List;

public class Criterio {

	private long idCriterio;
	private String nombre;
	private String observaciones;
	private double valor;
	private List aspectos;
	private List aspectos2;

	public List getAspectos() {
		return aspectos;
	}
	public long getIdCriterio() {
		return idCriterio;
	}
	public double getValor() {
		return valor;
	}
	public void setAspectos(List aspectos) {
		this.aspectos = aspectos;
	}
	public void setIdCriterio(long idCriterio) {
		this.idCriterio = idCriterio;
	}
	public void setValor(double valor) {
		this.valor = valor;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getObservaciones() {
		return observaciones;
	}
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}
	public List getAspectos2() {
		return aspectos2;
	}
	public void setAspectos2(List aspectos2) {
		this.aspectos2 = aspectos2;
	}

}
