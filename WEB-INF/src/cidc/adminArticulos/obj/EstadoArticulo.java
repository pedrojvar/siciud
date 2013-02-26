package cidc.adminArticulos.obj;

import java.util.List;

public class EstadoArticulo {

	private long idArticulo;
	private String codEval;
	private long idEvalAceptado;
	private String tituloArticulo;
	private String presentador;
	private String idEvaluador;
	private String nombreEvaluador;
	private String fecRecibido;
	private String fecAsigancion;
	private String fecRespuesta;
	private String fecCancelacion;
	private String fecMail;
	private String fecDocumentos;
	private String fecEvaluacion;
	private List listaEvaluador;
	private String archivo;

	public String getFecAsigancion() {
		return fecAsigancion;
	}
	public String getFecCancelacion() {
		return fecCancelacion;
	}
	public String getFecDocumentos() {
		return fecDocumentos;
	}
	public String getFecEvaluacion() {
		return fecEvaluacion;
	}
	public String getFecMail() {
		return fecMail;
	}
	public String getFecRespuesta() {
		return fecRespuesta;
	}
	public long getIdArticulo() {
		return idArticulo;
	}
	public String getIdEvaluador() {
		return idEvaluador;
	}
	public String getNombreEvaluador() {
		return nombreEvaluador;
	}
	public String getPresentador() {
		return presentador;
	}
	public String getTituloArticulo() {
		return tituloArticulo;
	}
	public void setFecAsigancion(String fecAsigancion) {
		this.fecAsigancion = fecAsigancion;
	}
	public void setFecCancelacion(String fecCancelacion) {
		this.fecCancelacion = fecCancelacion;
	}
	public void setFecDocumentos(String fecDocumentos) {
		this.fecDocumentos = fecDocumentos;
	}
	public void setFecEvaluacion(String fecEvaluacion) {
		this.fecEvaluacion = fecEvaluacion;
	}
	public void setFecMail(String fecMail) {
		this.fecMail = fecMail;
	}
	public void setFecRespuesta(String fecRespuesta) {
		this.fecRespuesta = fecRespuesta;
	}
	public void setIdArticulo(long idArticulo) {
		this.idArticulo = idArticulo;
	}
	public void setIdEvaluador(String idEvaluador) {
		this.idEvaluador = idEvaluador;
	}
	public void setNombreEvaluador(String nombreEvaluador) {
		this.nombreEvaluador = nombreEvaluador;
	}
	public void setPresentador(String presentador) {
		this.presentador = presentador;
	}
	public void setTituloArticulo(String tituloArticulo) {
		this.tituloArticulo = tituloArticulo;
	}
	public List getListaEvaluador() {
		return listaEvaluador;
	}
	public void setListaEvaluador(List listaEvaluador) {
		this.listaEvaluador = listaEvaluador;
	}
	public String getCodEval() {
		return codEval;
	}
	public void setCodEval(String codEval) {
		this.codEval = codEval;
	}
	public long getIdEvalAceptado() {
		return idEvalAceptado;
	}
	public void setIdEvalAceptado(long idEvalAceptado) {
		this.idEvalAceptado = idEvalAceptado;
	}
	public String getFecRecibido() {
		return fecRecibido;
	}
	public void setFecRecibido(String fecRecibido) {
		this.fecRecibido = fecRecibido;
	}
	public String getArchivo() {
		return archivo;
	}
	public void setArchivo(String archivo) {
		this.archivo = archivo;
	}
}
