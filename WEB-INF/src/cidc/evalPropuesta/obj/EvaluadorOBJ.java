package cidc.evalPropuesta.obj;

import java.util.List;

public class EvaluadorOBJ {
	
	private long id;
	private int orden;
	private int tipo;
	private int idFac;
	private int idGrupo;
	private int idProyCur;
	private String codigo;
	private String numDoc;
	private int tipoDoc;
	private String tipoEvaluador;
	private String nombres ;
	private String apellidos;
	private String mail;
	private String direccion;
	private String telefono;
	private String celular;
	private String areasTrabajo;
	private String facultad;
	private String grupoInvest;
	private String proyectoCur;
	
	private int tipoTitulo;
	private String titulo;
	
	private List titulos;
	
	public List getTitulos() {
		return titulos;
	}
	public void setTitulos(List titulos) {
		this.titulos = titulos;
	}
	public String getApellidos() {
		return apellidos;
	}
	public String getAreasTrabajo() {
		return areasTrabajo;
	}
	public String getCelular() {
		return celular;
	}
	public String getCodigo() {
		return codigo;
	}
	public String getFacultad() {
		return facultad;
	}
	public String getMail() {
		return mail;
	}
	public String getNombres() {
		return nombres;
	}
	public String getProyectoCur() {
		return proyectoCur;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public void setAreasTrabajo(String areasTrabajo) {
		this.areasTrabajo = areasTrabajo;
	}
	public void setCelular(String celular) {
		this.celular = celular;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public void setFacultad(String facultad) {
		this.facultad = facultad;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public void setNombres(String nombres) {
		this.nombres = nombres;
	}
	public void setProyectoCur(String proyectoCur) {
		this.proyectoCur = proyectoCur;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public int getTipo() {
		return tipo;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}
	public String getGrupoInvest() {
		return grupoInvest;
	}
	public void setGrupoInvest(String grupoInvest) {
		this.grupoInvest = grupoInvest;
	}
	public String getNumDoc() {
		return numDoc;
	}
	public int getTipoDoc() {
		return tipoDoc;
	}
	public void setNumDoc(String numDoc) {
		this.numDoc = numDoc;
	}
	public void setTipoDoc(int tipoDoc) {
		this.tipoDoc = tipoDoc;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public int getIdFac() {
		return idFac;
	}
	public int getIdGrupo() {
		return idGrupo;
	}
	public int getIdProyCur() {
		return idProyCur;
	}
	public void setIdFac(int idFac) {
		this.idFac = idFac;
	}
	public void setIdGrupo(int idGrupo) {
		this.idGrupo = idGrupo;
	}
	public void setIdProyCur(int idProyCur) {
		this.idProyCur = idProyCur;
	}
	public int getOrden() {
		return orden;
	}
	public void setOrden(int orden) {
		this.orden = orden;
	}
	public String getTipoEvaluador() {
		return tipoEvaluador;
	}
	public void setTipoEvaluador(String tipoEvaluador) {
		this.tipoEvaluador = tipoEvaluador;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public int getTipoTitulo() {
		return tipoTitulo;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTipoTitulo(int tipoTitulo) {
		this.tipoTitulo = tipoTitulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	
}

