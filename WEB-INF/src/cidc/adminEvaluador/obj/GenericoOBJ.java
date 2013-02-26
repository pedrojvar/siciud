package cidc.adminEvaluador.obj;

public class GenericoOBJ {

	private long codigo;
	private String nombre;
	private String estadoCed;
	private String estadoRut;


	public String getEstadoCed() {
		return estadoCed;
	}
	public void setEstadoCed(String estadoCed) {
		this.estadoCed = estadoCed;
	}
	public String getEstadoRut() {
		return estadoRut;
	}
	public void setEstadoRut(String estadoRut) {
		this.estadoRut = estadoRut;
	}
	public long getCodigo() {
		return codigo;
	}
	public String getNombre() {
		return nombre;
	}
	public void setCodigo(long codigo) {
		this.codigo = codigo;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

}

