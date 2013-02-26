package cidc.convenios.obj;

public class Convenio {

	private long idConvenio;
	private int estado;
	private int tipo;
	private int numero;
	private int ano;
	private String nombreConvenio;
	private String entidades;
	private String fecha;
	private String valor;
	private String compromisos;
	private String observaciones;

	public String getEntidades() {
		return entidades;
	}
	public void setEntidades(String entidades) {
		this.entidades = entidades;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public long getIdConvenio() {
		return idConvenio;
	}
	public void setIdConvenio(long idConvenio) {
		this.idConvenio = idConvenio;
	}
	public String getNombreConvenio() {
		return nombreConvenio;
	}
	public void setNombreConvenio(String nombreConvenio) {
		this.nombreConvenio = nombreConvenio;
	}
	public int getNumero() {
		return numero;
	}
	public void setNumero(int numero) {
		this.numero = numero;
	}
	public int getTipo() {
		return tipo;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}
	public String getValor() {
		return valor;
	}
	public void setValor(String valor) {
		this.valor = valor;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getCompromisos() {
		return compromisos;
	}
	public void setCompromisos(String compromisos) {
		this.compromisos = compromisos;
	}
	public String getObservaciones() {
		return observaciones;
	}
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

}
