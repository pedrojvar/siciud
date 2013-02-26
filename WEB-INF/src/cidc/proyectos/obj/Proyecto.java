package cidc.proyectos.obj;

import java.io.Serializable;
import java.util.List;

public class Proyecto implements Serializable{
	private String id;
	private String ano;
	private String consecContrato;
	private String consecActa;
	private String codigo;
	private String director;
	private String proyecto;
	private String facultad;
	private String proyCurricular;
	private String fecAprobacion;
	private String fecActaInicio;
	private String fecActaFin;
	private String fecContrato;
	private String grupoInvestigacion;
	private String idGrupo;	
	private String cedulaDir;
	private String cedulaDirDe;
	private String duracion;
	private String duracionLetras;
	private String ejecucion;
	private String ejecucionLetras;
	private String informes;
	private String informesLetras;
	private String evaluacion;
	private String evaluacionLetras;
	private String valor;
	private String valorLetras;
	private String sesion;
	private String convocatoria;
	private String numConvocatoria;
	private String compromisosConv;
	private String objContrato;
	private String archivo;
	private String termRefConvo;
	private List coInvestigadores;
	private int principal;
	private String []papel;
	private int estado;
	
	
	private int idActaFin;
	private String anCortoActa;
	private String anCortoContrato;
	private int flag;

	private List listaObservaciones=null;


	public String getIdGrupo() {
		return idGrupo;
	}
	public void setIdGrupo(String idGrupo) {
		this.idGrupo = idGrupo;
	}	
	public int getIdActaFin() {
		return idActaFin;
	}
	public void setIdActaFin(int idActaFin) {
		this.idActaFin = idActaFin;
	}
	public int getPrincipal() {
		return principal;
	}
	public void setPrincipal(int principal) {
		this.principal = principal;
	}
	public String getCedulaDir() {
		return (cedulaDir!=null)?cedulaDir:"--";
	}
	public String getCedulaDirDe() {
		return (cedulaDirDe!=null)?cedulaDirDe:"--";
	}
	public String getCodigo() {
		return (codigo!=null)?codigo:"--";
	}
	public String getCompromisosConv() {
		return (compromisosConv!=null)?compromisosConv:"--";
	}
	public String getConsecContrato() {
		return (consecContrato!=null)?consecContrato:"--";
	}
	public String getConvocatoria() {
		return convocatoria;
	}
	public String getDirector() {
		return (director!=null)?director:"--";
	}
	public String getDuracion() {
		return (duracion!=null)?duracion:"--";
	}
	public String getDuracionLetras() {
		return (duracionLetras!=null)?duracionLetras:"--";
	}
	public String getEjecucion() {
		return (ejecucion!=null)?ejecucion:"--";
	}
	public String getEjecucionLetras() {
		return (ejecucionLetras!=null)?ejecucionLetras:"--";
	}
	public String getEvaluacion() {
		return (evaluacion!=null)?evaluacion:"--";
	}
	public String getEvaluacionLetras() {
		return (evaluacionLetras!=null)?evaluacionLetras:"--";
	}
	public String getFecActaFin() {
		return (fecActaFin!=null)?fecActaFin:"--";
	}
	public String getFecActaInicio() {
		return (fecActaInicio!=null)?fecActaInicio:"--";
	}
	public String getFecAprobacion() {
		return (fecAprobacion!=null)?fecAprobacion:"--";
	}
	public String getFecContrato() {
		return (fecContrato!=null)?fecContrato:"--";
	}
	public String getGrupoInvestigacion() {
		return (grupoInvestigacion!=null)?grupoInvestigacion:"--";
	}
	public String getId() {
		return (id!=null)?id:"--";
	}
	public String getInformes() {
		return (informes!=null)?informes:"--";
	}
	public String getInformesLetras() {
		return (informesLetras!=null)?informesLetras:"--";
	}
	public String getNumConvocatoria() {
		return (numConvocatoria!=null)?numConvocatoria:"--";
	}
	public String getObjContrato() {
		return (objContrato!=null)?objContrato:"--";
	}
	public String getProyecto() {
		return (proyecto!=null)?proyecto:"--";
	}
	public String getSesion() {
		return (sesion!=null)?sesion:"--";
	}
	public String getValor() {
		return (valor!=null)?valor:"--";
	}
	public String getValorLetras() {
		return (valorLetras!=null)?valorLetras:"--";
	}
	public String getConsecActa() {
		return (consecActa!=null)?consecActa:"--";
	}
	public void setCedulaDir(String cedulaDir) {
		this.cedulaDir = cedulaDir;
	}
	public void setCedulaDirDe(String cedulaDirDe) {
		this.cedulaDirDe = cedulaDirDe;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public void setCompromisosConv(String compromisosConv) {
		this.compromisosConv = compromisosConv;
	}
	public void setConsecContrato(String consecContrato) {
		this.consecContrato = consecContrato;
	}
	public void setConvocatoria(String convocatoria) {
		this.convocatoria = convocatoria;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public void setDuracion(String duracion) {
		this.duracion = duracion;
	}
	public void setDuracionLetras(String duracionLetras) {
		this.duracionLetras = duracionLetras;
	}
	public void setEjecucion(String ejecucion) {
		this.ejecucion = ejecucion;
	}
	public void setEjecucionLetras(String ejecucionLetras) {
		this.ejecucionLetras = ejecucionLetras;
	}
	public void setEvaluacion(String evaluacion) {
		this.evaluacion = evaluacion;
	}
	public void setEvaluacionLetras(String evaluacionLetras) {
		this.evaluacionLetras = evaluacionLetras;
	}
	public void setFecActaFin(String fecActaFin) {
		this.fecActaFin = fecActaFin;
	}
	public void setFecActaInicio(String fecActaInicio) {
		this.fecActaInicio = fecActaInicio;
		setAnCortoActa(fecActaInicio.substring(2,4));
	}
	public void setFecAprobacion(String fecAprobacion) {
		this.fecAprobacion = fecAprobacion;
	}
	public void setFecContrato(String fecContrato) {
		this.fecContrato = fecContrato;
		setAnCortoContrato(fecContrato.substring(2,4));
	}
	public void setGrupoInvestigacion(String grupoInvestigacion) {
		this.grupoInvestigacion = grupoInvestigacion;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setInformes(String informes) {
		this.informes = informes;
	}
	public void setInformesLetras(String informesLetras) {
		this.informesLetras = informesLetras;
	}
	public void setNumConvocatoria(String numConvocatoria) {
		this.numConvocatoria = numConvocatoria;
	}
	public void setObjContrato(String objContrato) {
		this.objContrato = objContrato;
	}
	public void setProyecto(String proyecto) {
		this.proyecto = proyecto;
	}
	public void setSesion(String sesion) {
		this.sesion = sesion;
	}
	public void setValor(String valor) {
		this.valor = valor;
	}
	public void setValorLetras(String valorLetras) {
		this.valorLetras = valorLetras;
	}
	public List getCoInvestigadores() {
		return coInvestigadores;
	}
	public void setCoInvestigadores(List coInvestigadores) {
		this.coInvestigadores = coInvestigadores;
	}
	public String getArchivo() {
		return archivo;
	}
	public void setArchivo(String archivo) {
		this.archivo = archivo;
	}
	public String[] getPapel() {
		return papel;
	}
	public void setPapel(String[] papel) {
		this.papel = papel;
	}

	public void setConsecActa(String consecActa) {
		this.consecActa = consecActa;
	}
	public String getAno() {
		return ano;
	}
	public void setAno(String ano) {
		this.ano = ano;
	}
	public String getAnCortoActa() {
		return anCortoActa;
	}
	public void setAnCortoActa(String anCortoActa) {
		this.anCortoActa = anCortoActa;
	}
	public String getAnCortoContrato() {
		return anCortoContrato;
	}
	public void setAnCortoContrato(String anCortoContrato) {
		this.anCortoContrato = anCortoContrato;
	}
	public String getFacultad() {
		return facultad;
	}
	public void setFacultad(String facultad) {
		this.facultad = facultad;
	}
	public String getProyCurricular() {
		return proyCurricular;
	}
	public void setProyCurricular(String proyCurricular) {
		this.proyCurricular = proyCurricular;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public List getListaObservaciones() {
		return listaObservaciones;
	}
	public void setListaObservaciones(List listaObservaciones) {
		this.listaObservaciones = listaObservaciones;
	}
	public String getTermRefConvo() {
		return termRefConvo;
	}
	public void setTermRefConvo(String termRefConvo) {
		this.termRefConvo = termRefConvo;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}

}

