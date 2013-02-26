package cidc.adminArticulos.obj;

import java.util.List;

public class ArticRevista {

	private long idArticulo;
	private int estado;
	private int tipo;
	private String titulo;
	private String nombreAutor;
	private String apellidoAutor;
	private long investigador;
	private String archivo;
	private String de;
	private String fechaRecibido;
	private String fechaDocumentos;
	private String fechaEvaluado;
	private List listaEval;
	private String idEval;

	public String getApellidoAutor() {
		return apellidoAutor;
	}
	public String getArchivo() {
		return archivo;
	}
	public String getDe() {
		return de;
	}
	public int getEstado() {
		return estado;
	}
	public String getFechaRecibido() {
		return fechaRecibido;
	}
	public long getIdArticulo() {
		return idArticulo;
	}
	public long getInvestigador() {
		return investigador;
	}
	public String getNombreAutor() {
		return nombreAutor;
	}
	public int getTipo() {
		return tipo;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setApellidoAutor(String apellidoAutor) {
		this.apellidoAutor = apellidoAutor;
	}
	public void setArchivo(String archivo) {
		this.archivo = archivo;
	}
	public void setDe(String de) {
		this.de = de;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public void setFechaRecibido(String fechaRecibido) {
		this.fechaRecibido = fechaRecibido;
	}
	public void setIdArticulo(long idArticulo) {
		this.idArticulo = idArticulo;
	}
	public void setInvestigador(long investigador) {
		this.investigador = investigador;
	}
	public void setNombreAutor(String nombreAutor) {
		this.nombreAutor = nombreAutor;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public List getListaEval() {
		return listaEval;
	}
	public void setListaEval(List listaEval) {
		this.listaEval = listaEval;
	}
	public String getIdEval() {
		return idEval;
	}
	public void setIdEval(String idEval) {
		this.idEval = idEval;
	}
	public String getFechaEvaluado() {
		return fechaEvaluado;
	}
	public void setFechaEvaluado(String fechaEvaluado) {
		this.fechaEvaluado = fechaEvaluado;
	}
	public String getFechaDocumentos() {
		return fechaDocumentos;
	}
	public void setFechaDocumentos(String fechaDocumentos) {
		this.fechaDocumentos = fechaDocumentos;
	}




}
