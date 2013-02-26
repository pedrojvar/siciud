package cidc.adminArticulos.obj;

public class Articulo {

	private long idArticulo;
	private int estado;
	private int tipo;
	private int facultad;
	private int grupoInvest;
	private int proyCurr;
	private String tituloArticulo;
	private String presentador;
	private String autores;
	private String direccionPostal;
	private String direccionElect;
	private String palabClaves;
	private String temaInteres;
	private int tipoPresentacion;
	private String archivo;
	private String universidad;
	private String resumen;
	private String fechaRecibido;

	public String getAutores(){
		return autores;
	}
	public String getDireccionElect(){
		return direccionElect;
	}
	public String getDireccionPostal(){
		return direccionPostal;
	}
	public long getIdArticulo(){
		return idArticulo;
	}
	public String getPalabClaves(){
		return palabClaves;
	}
	public String getPresentador() {
		return presentador;
	}
	public String getTemaInteres() {
		return temaInteres;
	}
	public int getTipoPresentacion() {
		return tipoPresentacion;
	}
	public void setAutores(String autores) {
		this.autores = autores;
	}
	public void setDireccionElect(String direccionElect) {
		this.direccionElect = direccionElect;
	}
	public void setDireccionPostal(String direccionPostal) {
		this.direccionPostal = direccionPostal;
	}
	public void setIdArticulo(long idArticulo) {
		this.idArticulo = idArticulo;
	}
	public void setPalabClaves(String palabClaves) {
		this.palabClaves = palabClaves;
	}
	public void setPresentador(String presentador) {
		this.presentador = presentador;
	}
	public String getArchivo() {
		return archivo;
	}
	public void setArchivo(String archivo) {
		this.archivo = archivo;
	}
	public void setTemaInteres(String temaInteres) {
		this.temaInteres = temaInteres;
	}
	public void setTipoPresentacion(int tipoPresentacion) {
		this.tipoPresentacion = tipoPresentacion;
	}
	public int getFacultad() {
		return facultad;
	}
	public int getGrupoInvest() {
		return grupoInvest;
	}
	public int getProyCurr() {
		return proyCurr;
	}
	public void setFacultad(int facultad) {
		this.facultad = facultad;
	}
	public void setGrupoInvest(int grupoInvest) {
		this.grupoInvest = grupoInvest;
	}
	public void setProyCurr(int proyCurr) {
		this.proyCurr = proyCurr;
	}
	public int getTipo() {
		return tipo;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}
	public String getResumen() {
		return resumen;
	}
	public String getUniversidad() {
		return universidad;
	}
	public void setResumen(String resumen) {
		this.resumen = resumen;
	}
	public void setUniversidad(String universidad) {
		this.universidad = universidad;
	}
	public String getTituloArticulo() {
		return tituloArticulo;
	}
	public void setTituloArticulo(String tituloArticulo) {
		this.tituloArticulo = tituloArticulo;
	}
	public String getFechaRecibido() {
		return fechaRecibido;
	}
	public void setFechaRecibido(String fechaRecibido) {
		this.fechaRecibido = fechaRecibido;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
}
