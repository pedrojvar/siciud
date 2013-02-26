package cidc.inscripSistema.obj;

public class Persona {

	public long idUserSis;
	public long idPersona;
	public int facultad;
	public long grupo;
	public int tipoDoc;
	public int tipoGrupo;
	public int papel;
	public long proyCur;
	public long idNombre;
	public String nombre;// nombre completo
	public String nombres;
	public String apellidos;
	public String nombFacultad;
	public int idGrupo;
	
	public String nombGrupo;
	public String nombProyecto;
	public String mail;
	public String telefono;
	public String celular;
	public String codigo;
	public String documento;
	public String deDoc;
	public String mailBase;
	public String nick;
	public String cvlac;
	private boolean estado;

	public int getIdGrupo() {
		return idGrupo;
	}
	public void setIdGrupo(int idGrupo) {
		this.idGrupo = idGrupo;
	}
	public String getNombGrupo() {
		return nombGrupo;
	}
	public void setNombGrupo(String nombGrupo) {
		this.nombGrupo = nombGrupo;
	}
	public boolean isEstado() {
		return estado;
	}
	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	public int getFacultad() {
		return facultad;
	}
	public long getGrupo() {
		return grupo;
	}
	public String getMail() {
		return mail;
	}
	public String getNombre() {
		return nombre;
	}
	public long getProyCur() {
		return proyCur;
	}
	public void setFacultad(int facultad) {
		this.facultad = facultad;
	}
	public void setGrupo(long grupo) {
		this.grupo = grupo;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public void setProyCur(long proyCur) {
		this.proyCur = proyCur;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public long getIdPersona() {
		return idPersona;
	}
	public String getNombFacultad() {
		return nombFacultad;
	}
	
	public String getNombProyecto() {
		return nombProyecto;
	}
	public void setIdPersona(long idPersona) {
		this.idPersona = idPersona;
	}
	public void setNombFacultad(String nombFacultad) {
		this.nombFacultad = nombFacultad;
	}
	
	public void setNombProyecto(String nombProyecto) {
		this.nombProyecto = nombProyecto;
	}
	public long getIdNombre() {
		return idNombre;
	}
	public void setIdNombre(long idNombre) {
		this.idNombre = idNombre;
	}
	public String getMailBase() {
		return mailBase;
	}
	public void setMailBase(String mailBase) {
		this.mailBase = mailBase;
	}
	public long getIdUserSis() {
		return idUserSis;
	}
	public void setIdUserSis(long idUserSis) {
		this.idUserSis = idUserSis;
	}
	public String getCelular() {
		return celular;
	}
	public String getDocumento() {
		return documento;
	}
	public String getTelefono() {
		return telefono;
	}
	public int getTipoDoc() {
		return tipoDoc;
	}
	public void setCelular(String celular) {
		this.celular = celular;
	}
	public void setDocumento(String documento) {
		this.documento = documento;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public void setTipoDoc(int tipoDoc) {
		this.tipoDoc = tipoDoc;
	}
	public int getPapel() {
		return papel;
	}
	public void setPapel(int papel) {
		this.papel = papel;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getApellidos() {
		return apellidos;
	}
	public String getNombres() {
		return nombres;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public void setNombres(String nombres) {
		this.nombres = nombres;
	}
	public String getDeDoc() {
		return deDoc;
	}
	public void setDeDoc(String deDoc) {
		this.deDoc = deDoc;
	}
	public String getCvlac() {
		return cvlac;
	}
	public void setCvlac(String cvlac) {
		this.cvlac = cvlac;
	}
	public int getTipoGrupo() {
		return tipoGrupo;
	}
	public void setTipoGrupo(int tipoGrupo) {
		this.tipoGrupo = tipoGrupo;
	}
}
