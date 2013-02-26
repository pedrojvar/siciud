package cidc.indicadores.fichasIndicadores.obj;

public class FichaIndicadores
{
	private int id;
	private String identificador;
	private int modelo;
	private int proceso;
	private int subproceso;
	private String nombre;
	private String descripcion;
	private String objetivo;
	private String metodologia;
	private String fechacorte;
	private int responsable;
	private String fuente;
	private String docsoporte;
	private String [] tipografica;
	private String tipograficatexto;
	private String observaciones;
	private String [] variables;
	private String variablestexto;
	private String formula;
	private long creador;
	private String fechacreacion;
	private Long modificador;
	private String fechamodificacion;
	private String nombrecreador;

	public String getNombrecreador() {
		return nombrecreador;
	}
	public void setNombrecreador(String nombrecreador) {
		this.nombrecreador = nombrecreador;
	}
	public long getCreador() {
		return creador;
	}
	public void setCreador(long creador) {
		this.creador = creador;
	}
	public String getFormula() {
		return formula;
	}
	public void setFormula(String formula) {
		this.formula = formula;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getDocsoporte() {
		return docsoporte;
	}
	public void setDocsoporte(String docsoporte) {
		this.docsoporte = docsoporte;
	}
	public String getFechacorte() {
		return fechacorte;
	}
	public void setFechacorte(String fechacorte) {
		this.fechacorte = fechacorte;
	}
	public String getFuente() {
		return fuente;
	}
	public void setFuente(String fuente) {
		this.fuente = fuente;
	}
	public String getIdentificador() {
		return identificador;
	}
	public void setIdentificador(String identificador) {
		this.identificador = identificador;
	}
	public String getMetodologia() {
		return metodologia;
	}
	public void setMetodologia(String metodologia) {
		this.metodologia = metodologia;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getObjetivo() {
		return objetivo;
	}
	public void setObjetivo(String objetivo) {
		this.objetivo = objetivo;
	}
	public int getResponsable() {
		return responsable;
	}
	public void setResponsable(int responsable) {
		this.responsable = responsable;
	}
	public String[] getTipografica() {
		return tipografica;
	}
	public void setTipografica(String[] tipografica) {
		this.tipografica = tipografica;
	}
	public String[] getVariables() {
		return variables;
	}
	public void setVariables(String[] variables) {
		this.variables = variables;
	}
	public String getObservaciones() {
		return observaciones;
	}
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}
	public String getTipograficatexto() {
		return tipograficatexto;
	}
	public void setTipograficatexto(String tipograficatexto) {
		this.tipograficatexto = tipograficatexto;
	}
	public String getVariablestexto() {
		return variablestexto;
	}
	public void setVariablestexto(String variablestexto) {
		this.variablestexto = variablestexto;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProceso() {
		return proceso;
	}
	public void setProceso(int proceso) {
		this.proceso = proceso;
	}
	public String getFechacreacion() {
		return fechacreacion;
	}
	public void setFechacreacion(String fechacreacion) {
		this.fechacreacion = fechacreacion;
	}
	public String getFechamodificacion() {
		return fechamodificacion;
	}
	public void setFechamodificacion(String fechamodificacion) {
		this.fechamodificacion = fechamodificacion;
	}
	public Long getModificador() {
		return modificador;
	}
	public void setModificador(Long modificador) {
		this.modificador = modificador;
	}
	public int getModelo() {
		return modelo;
	}
	public void setModelo(int modelo) {
		this.modelo = modelo;
	}
	public int getSubproceso() {
		return subproceso;
	}
	public void setSubproceso(int subproceso) {
		this.subproceso = subproceso;
	}
}