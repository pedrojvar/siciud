package cidc.inscripcionConv.obj;

import java.io.Serializable;
import java.util.List;

public class ResumenInscOBJ implements Serializable{

	private long idPropuesta;
	private String convocatoria;
	private String facultad;
	private String grupo;
	private String investigador;
	private String propuesta;
	private String propAbstract;
	private String palClaves;
	private String docCompleto;
	private String docAnexo;
	//Nuevos documentos
	private String docAvalGrupo;
	private String docAvalDir;
	private String docCerCurr;
	private String fechaInscripcion;	

	private List coInvestigadores;
	private List rubros;
	private List compromisos;

	public List getCompromisos() {
		return compromisos;
	}
	public void setCompromisos(List compromisos) {
		this.compromisos = compromisos;
	}
	public String getConvocatoria() {
		return convocatoria;
	}
	public void setConvocatoria(String convocatoria) {
		this.convocatoria = convocatoria;
	}
	public String getFacultad() {
		return facultad;
	}
	public void setFacultad(String facultad) {
		this.facultad = facultad;
	}
	public String getGrupo() {
		return grupo;
	}
	public void setGrupo(String grupo) {
		this.grupo = grupo;
	}
	public List getCoInvestigadores() {
		return coInvestigadores;
	}
	public void setCoInvestigadores(List coInvestigadores) {
		this.coInvestigadores = coInvestigadores;
	}
	public String getInvestigador() {
		return investigador;
	}
	public void setInvestigador(String investigador) {
		this.investigador = investigador;
	}
	public String getPropuesta() {
		return propuesta;
	}
	public void setPropuesta(String propuesta) {
		this.propuesta = propuesta;
	}
	public List getRubros() {
		return rubros;
	}
	public void setRubros(List rubros) {
		this.rubros = rubros;
	}
	public String getPalClaves() {
		return palClaves;
	}
	public void setPalClaves(String palClaves) {
		this.palClaves = palClaves;
	}
	public String getPropAbstract() {
		return propAbstract;
	}
	public void setPropAbstract(String propAbstract) {
		this.propAbstract = propAbstract;
	}
	public long getIdPropuesta() {
		return idPropuesta;
	}
	public void setIdPropuesta(long idPropuesta) {
		this.idPropuesta = idPropuesta;
	}
	public String getDocAnexo() {
		return docAnexo;
	}
	public String getDocCompleto() {
		return docCompleto;
	}
	public void setDocAnexo(String docAnexo) {
		this.docAnexo = docAnexo;
	}
	public void setDocCompleto(String docCompleto) {
		this.docCompleto = docCompleto;
	}

	public String getDocAvalGrupo() {
		return docAvalGrupo;
	}
	public void setDocAvalGrupo(String docAvalGrupo) {
		this.docAvalGrupo = docAvalGrupo;
	}
	public String getDocAvalDir() {
		return docAvalDir;
	}
	public void setDocAvalDir(String docAvalDir) {
		this.docAvalDir = docAvalDir;
	}
	public String getDocCerCurr() {
		return docCerCurr;
	}
	public void setDocCerCurr(String docCerCurr) {
		this.docCerCurr = docCerCurr;
	}
	public String getFechaInscripcion() {
		return fechaInscripcion;
	}
	public void setFechaInscripcion(String fechaInscripcion) {
		this.fechaInscripcion = fechaInscripcion;
	}
}
