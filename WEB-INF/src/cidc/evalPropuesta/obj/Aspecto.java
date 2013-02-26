package cidc.evalPropuesta.obj;

public class Aspecto {
	
	private long idAspecto;
	private String nombre;
	private double valor;
	private double maxValor;
	private long idCriterio;
	
	public long getIdAspecto() {
		return idAspecto;
	}
	public double getValor() {
		return valor;
	}
	public void setIdAspecto(long idAspecto) {
		this.idAspecto = idAspecto;
	}
	public void setValor(double valor) {
		this.valor = valor;
	}
	public long getIdCriterio() {
		return idCriterio;
	}
	public String getNombre() {
		return nombre;
	}
	public void setIdCriterio(long idCriterio) {
		this.idCriterio = idCriterio;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public double getMaxValor() {
		return maxValor;
	}
	public void setMaxValor(double maxValor) {
		this.maxValor = maxValor;
	}
	
}
