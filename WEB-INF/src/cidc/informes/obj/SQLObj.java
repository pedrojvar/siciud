package cidc.informes.obj;

public class SQLObj {
	
	private String sql;
	private String nombreInforme;
	private String descripcion;
	private String fechaCreacion;
	private int id;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSql() {
		return sql;
	}
	public void setSql(String sql) {
		this.sql = sql;
	}
	public String getNombreInforme() {
		return nombreInforme;
	}
	public void setNombreInforme(String nombreInforme) {
		this.nombreInforme = nombreInforme;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getFechaCreacion() {
		return fechaCreacion;
	}
	public void setFechaCreacion(String fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}
	
	
}
