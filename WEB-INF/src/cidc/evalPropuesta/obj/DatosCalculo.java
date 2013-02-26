package cidc.evalPropuesta.obj;

import java.util.List;

public class DatosCalculo {

	private String propuesta;
	private String porcentComite;
	private String porcentInt;
	private String porcentExt;
	private double sumaComite;
	private double sumaInt;
	private double sumaExt;
	private double finalComite;
	private List listaAspectoComite;

	public List getListaAspectoComite() {
		return listaAspectoComite;
	}
	public String getPorcentComite() {
		return porcentComite;
	}
	public String getPorcentExt() {
		return porcentExt;
	}
	public String getPorcentInt() {
		return porcentInt;
	}
	public String getPropuesta() {
		return propuesta;
	}
	public void setListaAspectoComite(List listaAspectoComite) {
		this.listaAspectoComite = listaAspectoComite;
	}
	public void setPorcentComite(String porcentComite) {
		this.porcentComite = porcentComite;
	}
	public void setPorcentExt(String porcentExt) {
		this.porcentExt = porcentExt;
	}
	public void setPorcentInt(String porcentInt) {
		this.porcentInt = porcentInt;
	}
	public void setPropuesta(String propuesta) {
		this.propuesta = propuesta;
	}
	public double getSumaComite() {
		return sumaComite;
	}
	public double getSumaExt() {
		return sumaExt;
	}
	public double getSumaInt() {
		return sumaInt;
	}
	public void setSumaComite(double sumaComite) {
		this.sumaComite = sumaComite;
	}
	public void setSumaExt(double sumaExt) {
		this.sumaExt = sumaExt;
	}
	public void setSumaInt(double sumaInt) {
		this.sumaInt = sumaInt;
	}
	public double getFinalComite() {
		return finalComite;
	}
	public void setFinalComite(double finalComite) {
		this.finalComite = finalComite;
	}

}
