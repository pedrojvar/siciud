package cidc.articulos_Conv.obj;

import java.io.Serializable;

//Serializable restaura los objetos, mantiene recuperar el estado del obj en las sesiones de los usuarios
public class InfoGeneral implements Serializable{

	private long idPropuesta;
	private long idPersona;
	private int convid;
	private int idGrupo;
	private int grupo;
	private int facultad;
	private int proycur;
	private String nombreart;
	private String archivoart;
	private String archradicado;
	private String proyinv;
	private String proypa;
	private String revista;
	private String issnrevista;
	private String resumen;
	private String palabrasnum;
	private String areacon;	
	private String subareacon;
	private String fechains;
	private String estado;
	public long getIdPropuesta() {
		return idPropuesta;
	}
	public void setIdPropuesta(long idPropuesta) {
		this.idPropuesta = idPropuesta;
	}
	public long getIdPersona() {
		return idPersona;
	}
	public void setIdPersona(long idPersona) {
		this.idPersona = idPersona;
	}
	public int getConvid() {
		return convid;
	}
	public void setConvid(int convid) {
		this.convid = convid;
	}
	public int getFacultad() {
		return facultad;
	}
	public void setFacultad(int facultad) {
		this.facultad = facultad;
	}
	public int getProycur() {
		return proycur;
	}
	public void setProycur(int proycur) {
		this.proycur = proycur;
	}
	public String getNombreart() {
		return nombreart;
	}
	public void setNombreart(String nombreart) {
		this.nombreart = nombreart;
	}
	public String getArchivoart() {
		return archivoart;
	}
	public void setArchivoart(String archivoart) {
		this.archivoart = archivoart;
	}
	public String getArchradicado() {
		return archradicado;
	}
	public void setArchradicado(String archradicado) {
		this.archradicado = archradicado;
	}
	public String getProyinv() {
		return proyinv;
	}
	public void setProyinv(String proyinv) {
		this.proyinv = proyinv;
	}
	public String getProypa() {
		return proypa;
	}
	public void setProypa(String proypa) {
		this.proypa = proypa;
	}
	public String getRevista() {
		return revista;
	}
	public void setRevista(String revista) {
		this.revista = revista;
	}
	public String getIssnrevista() {
		return issnrevista;
	}
	public void setIssnrevista(String issnrevista) {
		this.issnrevista = issnrevista;
	}
	public String getResumen() {
		return resumen;
	}
	public void setResumen(String resumen) {
		this.resumen = resumen;
	}
	public String getPalabrasnum() {
		return palabrasnum;
	}
	public void setPalabrasnum(String palabrasnum) {
		this.palabrasnum = palabrasnum;
	}
	public String getAreacon() {
		return areacon;
	}
	public void setAreacon(String areacon) {
		this.areacon = areacon;
	}
	public String getSubareacon() {
		return subareacon;
	}
	public void setSubareacon(String subareacon) {
		this.subareacon = subareacon;
	}
	public String getFechains() {
		return fechains;
	}
	public void setFechains(String fechains) {
		this.fechains = fechains;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public int getIdGrupo() {
		return idGrupo;
	}
	public void setIdGrupo(int idGrupo) {
		this.idGrupo = idGrupo;
	}
	public int getGrupo() {
		return grupo;
	}
	public void setGrupo(int grupo) {
		this.grupo = grupo;
	}

}
