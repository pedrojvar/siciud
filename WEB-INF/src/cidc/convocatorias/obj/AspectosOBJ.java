package cidc.convocatorias.obj;

public class AspectosOBJ {
	public int codigo;
	public int criterio;
	public long prop;
	public String nombre;
	public double valor;
	
	public double getValor() {
		return valor;
	}
	public void setValor(double valor) {
		this.valor = valor;
	}
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int getCriterio() {
		return criterio;
	}
	public void setCriterio(int criterio) {
		this.criterio = criterio;
	}
	public long getProp() {
		return prop;
	}
	public void setProp(long prop) {
		this.prop = prop;
	}
}
