package cidc.docsIndicadores.obj;

public class InfoRAE
{
	int idrae;
	int iddoc;
	String apellidos;
	String nombres;
	String titulo;
	String fechapublicacion;
	String ciudad;
	String editorial;
	int numeropaginas;
	String dirweb;
	String fechaacceso;
	String sintesisglobal;
	String ideacentral;
	int paginaideacentral;
	String conceptoscategorias;
	String ref1;
	String ref2;
	String ref3;
	String ref4;
	String valoracioncritica;
	int volumen;
	int numcapitulo;

	public String getApellidos() {
		return (apellidos!=null)? apellidos:"";
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public String getCiudad() {
		return (ciudad!=null)? ciudad:"";
	}
	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}
	public String getConceptoscategorias() {
		return (conceptoscategorias!=null)? conceptoscategorias:"";
	}
	public void setConceptoscategorias(String conceptoscategorias) {
		this.conceptoscategorias = conceptoscategorias;
	}
	public String getDirweb() {
		return (dirweb!=null)? dirweb:"";
	}
	public void setDirweb(String dirweb) {
		this.dirweb = dirweb;
	}
	public String getEditorial() {
		return (editorial!=null)? editorial:"";
	}
	public void setEditorial(String editorial) {
		this.editorial = editorial;
	}
	public String getFechaacceso() {
		return (fechaacceso!=null)? fechaacceso:"";
	}
	public void setFechaacceso(String fechaacceso) {
		this.fechaacceso = fechaacceso;
	}
	public String getFechapublicacion() {
		return (fechapublicacion!=null)? fechapublicacion:"";
	}
	public void setFechapublicacion(String fechapublicacion) {
		this.fechapublicacion = fechapublicacion;
	}
	public int getIddoc() {
		return iddoc;
	}
	public void setIddoc(int iddoc) {
		this.iddoc = iddoc;
	}
	public String getIdeacentral() {
		return ideacentral;
	}
	public void setIdeacentral(String ideacentral) {
		this.ideacentral = ideacentral;
	}
	public int getIdrae() {
		return idrae;
	}
	public void setIdrae(int idrae) {
		this.idrae = idrae;
	}
	public String getNombres() {
		return (nombres!=null)? nombres:"";
	}
	public void setNombres(String nombres) {
		this.nombres = nombres;
	}
	public int getNumcapitulo() {
		return numcapitulo;
	}
	public void setNumcapitulo(int numcapitulo) {
		this.numcapitulo = numcapitulo;
	}
	public int getNumeropaginas() {
		return numeropaginas;
	}
	public void setNumeropaginas(int numeropaginas) {
		this.numeropaginas = numeropaginas;
	}
	public int getPaginaideacentral() {
		return paginaideacentral;
	}
	public void setPaginaideacentral(int paginaideacentral) {
		this.paginaideacentral = paginaideacentral;
	}
	public String getRef1() {
		return (ref1!=null)? ref1:"";
	}
	public void setRef1(String ref1) {
		this.ref1 = ref1;
	}
	public String getRef2() {
		return (ref2!=null)? ref2:"";
	}
	public void setRef2(String ref2) {
		this.ref2 = ref2;
	}
	public String getRef3() {
		return (ref3!=null)? ref3:"";
	}
	public void setRef3(String ref3) {
		this.ref3 = ref3;
	}
	public String getRef4() {
		return (ref4!=null)? ref4:"";
	}
	public void setRef4(String ref4) {
		this.ref4 = ref4;
	}
	public String getSintesisglobal() {
		return (sintesisglobal!=null)? sintesisglobal:"";
	}
	public void setSintesisglobal(String sintesisglobal) {
		this.sintesisglobal = sintesisglobal;
	}
	public String getTitulo() {
		return (titulo!=null)? titulo:"";
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getValoracioncritica() {
		return (valoracioncritica!=null)? valoracioncritica:"";
	}
	public void setValoracioncritica(String valoracioncritica) {
		this.valoracioncritica = valoracioncritica;
	}
	public int getVolumen() {
		return volumen;
	}
	public void setVolumen(int volumen) {
		this.volumen = volumen;
	}
}