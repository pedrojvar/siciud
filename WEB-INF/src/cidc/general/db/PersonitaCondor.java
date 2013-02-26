package cidc.general.db;

import java.sql.Date;

public class PersonitaCondor implements Cloneable{

	private long codigo;
	private int facultad;
	private int proyCurr;
	private int estado;
	private int perfil;
	private int tipoDoc;
	private long documento;
	private String proceDocumento;
	private String contrasena;
	private String nombres;
	private String apellidos;
	private String telefono;
	private String celular;
	private String mailPersonal;
	private String mailInstitucional;
	private Date fechaNacimiento;
	private Date fechaIngreso;
	private Date fechaSalida;
	private int genero;

	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public String getCelular() {
		return celular;
	}
	public void setCelular(String celular) {
		this.celular = celular;
	}
	public long getCodigo() {
		return codigo;
	}
	public void setCodigo(long codigo) {
		this.codigo = codigo;
	}
	public String getContrasena() {
		return contrasena;
	}
	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}
	public long getDocumento() {
		return documento;
	}
	public void setDocumento(long documento) {
		this.documento = documento;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public int getFacultad() {
		return facultad;
	}
	public void setFacultad(int facultad) {
		this.facultad = facultad;
	}
	public Date getFechaIngreso() {
		return fechaIngreso;
	}
	public void setFechaIngreso(Date fechaIngreso) {
		this.fechaIngreso = fechaIngreso;
	}
	public Date getFechaNacimiento() {
		return fechaNacimiento;
	}
	public void setFechaNacimiento(Date fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}
	public Date getFechaSalida() {
		return fechaSalida;
	}
	public void setFechaSalida(Date fechaSalida) {
		this.fechaSalida = fechaSalida;
	}
	public int getGenero() {
		return genero;
	}
	public void setGenero(int genero) {
		this.genero = genero;
	}
	public String getMailInstitucional() {
		return mailInstitucional;
	}
	public void setMailInstitucional(String mailInstitucional) {
		this.mailInstitucional = mailInstitucional;
	}
	public String getMailPersonal() {
		return mailPersonal;
	}
	public void setMailPersonal(String mailPersonal) {
		this.mailPersonal = mailPersonal;
	}
	public String getNombres() {
		return nombres;
	}
	public void setNombres(String nombres) {
		this.nombres = nombres;
	}
	public int getPerfil() {
		return perfil;
	}
	public void setPerfil(int perfil) {
		this.perfil = perfil;
	}
	public String getProceDocumento() {
		return proceDocumento;
	}
	public void setProceDocumento(String proceDocumento) {
		this.proceDocumento = proceDocumento;
	}
	public int getProyCurr() {
		return proyCurr;
	}
	public void setProyCurr(int proyCurr) {
		this.proyCurr = proyCurr;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public int getTipoDoc() {
		return tipoDoc;
	}
	public void setTipoDoc(int tipoDoc) {
		this.tipoDoc = tipoDoc;
	}


}
