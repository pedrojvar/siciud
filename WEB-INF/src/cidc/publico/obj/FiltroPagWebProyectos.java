package cidc.publico.obj;

import java.io.Serializable;

public class FiltroPagWebProyectos implements Serializable{

	// Datos del Filtro //
	private String nombreProyecto;
	private String facultad;
	private String idGrupo;
	private String nombreDirector;
	private String apellidoDirector;
	
	// Datos adicionales para reporte //
	private int idDirector;
	private int idCodigoProyecto;
	private String codigoProyecto;
	private String nombreCompletoDirector;
	private String fecha_inicio;
	private String nombre_grupo;
	private String resumen;
	private String estado;
	private int tipo_proyecto;
	private String tipo_proyecto_nombre;
	private String nombre_convocatoria_convenio;
	private int tabla;
	private String cvlac;
	
	public String getCvlac() {
		return cvlac;
	}
	public void setCvlac(String cvlac) {
		this.cvlac = cvlac;
	}
	public String getNombreCompletoDirector() {
		return nombreCompletoDirector;
	}
	public void setNombreCompletoDirector(String nombreCompletoDirector) {
		this.nombreCompletoDirector = nombreCompletoDirector;
	}
	public String getNombre_convocatoria_convenio() {
		return nombre_convocatoria_convenio;
	}
	public void setNombre_convocatoria_convenio(String nombreConvocatoriaConvenio) {
		nombre_convocatoria_convenio = nombreConvocatoriaConvenio;
	}
	public int getTabla() {
		return tabla;
	}
	public void setTabla(int tabla) {
		this.tabla = tabla;
	}
	public int getIdCodigoProyecto() {
		return idCodigoProyecto;
	}
	public void setIdCodigoProyecto(int idCodigoProyecto) {
		this.idCodigoProyecto = idCodigoProyecto;
	}
	public int getIdDirector() {
		return idDirector;
	}
	public void setIdDirector(int idDirector) {
		this.idDirector = idDirector;
	}
	public String getCodigoProyecto() {
		return codigoProyecto;
	}
	public void setCodigoProyecto(String codigoProyecto) {
		this.codigoProyecto = codigoProyecto;
	}
	public String getFecha_inicio() {
		return fecha_inicio;
	}
	public void setFecha_inicio(String fechaInicio) {
		fecha_inicio = fechaInicio;
	}
	public String getNombre_grupo() {
		return nombre_grupo;
	}
	public void setNombre_grupo(String nombreGrupo) {
		nombre_grupo = nombreGrupo;
	}
	public String getResumen() {
		return resumen;
	}
	public void setResumen(String resumen) {
		this.resumen = resumen;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public int getTipo_proyecto() {
		return tipo_proyecto;
	}
	public void setTipo_proyecto(int tipoProyecto) {
		tipo_proyecto = tipoProyecto;
	}
	public String getTipo_proyecto_nombre() {
		return tipo_proyecto_nombre;
	}
	public void setTipo_proyecto_nombre(String tipoProyectoNombre) {
		tipo_proyecto_nombre = tipoProyectoNombre;
	}
	public String getApellidoDirector() {
		return (apellidoDirector!=null)?apellidoDirector:"%";
	}
	public void setApellidoDirector(String apellidoDirector) {
		this.apellidoDirector = "%"+apellidoDirector+"%";
	}
	public String getFacultad() {
		return (facultad!=null)?facultad:"%";
	}
	public void setFacultad(String facultad) {
		if(facultad.equals("0"))
			this.facultad="%";
		else
			this.facultad = facultad;
	}
	
	public String getIdGrupo() {
		return (idGrupo!=null)?idGrupo:"%";
	}
	public void setIdGrupo(String idGrupo) {
		if(idGrupo.equals("0"))
			this.idGrupo="%";
		else
			this.idGrupo = idGrupo;
	}
	
	public String getNombreDirector() {
		return (nombreDirector!=null)?nombreDirector:"%";
	}
	public void setNombreDirector(String nombreDirector) {
		this.nombreDirector = "%"+nombreDirector+"%";
	}
	public String getNombreProyecto() {
		return nombreProyecto;
	}
	public String getNombreProyecto2() {
		if(nombreProyecto==null)
		{
			return "%";
		}
		else
		{
			return "%" + nombreProyecto + "%";
		}
	}
	public void setNombreProyecto(String nombreProyecto) {
		this.nombreProyecto = nombreProyecto;
	}
}