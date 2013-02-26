package cidc.proyectosAntiguos.obj;

public class DocumentosOBJ {

	 private String tipo = null;
	 private int idProyecto;
	 private String nombre = null;
	 private String observacion = null;
     private String fecha = null;
     private int numero;



	public String getFecha() {
		return fecha;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public int getIdProyecto() {
		return idProyecto;
	}
	public void setIdProyecto(int idProyecto) {
		this.idProyecto = idProyecto;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int getNumero() {
		return numero;
	}
	public void setNumero(int numero) {
		this.numero = numero;
	}
	public String getObservacion() {
		return observacion;
	}
	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}

}
