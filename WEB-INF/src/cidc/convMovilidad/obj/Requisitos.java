package cidc.convMovilidad.obj;

import java.io.Serializable;

public class Requisitos implements Serializable{

	private long idProp ;
	private String []partiEvent;
	//corresponde a la justificacion del investigador
	private String compromisos1;
	private String compromisos2;
	//corresponde a la agenda de actividades del evento
	private String compromisos3;
	private String compromisos4;
	private String beneficiosGrupo1;
	private String beneficiosGrupo2;
	private String beneficiosGrupo3;
	private String beneficiosGrupo4;
	private String beneficiosGrupo5;
	private String interesInsti1;
	private String interesInsti2;
	private String interesInsti3;
	private String interesInsti4;

	public String getBeneficiosGrupo1() {
		return beneficiosGrupo1;
	}
	public String getBeneficiosGrupo2() {
		return beneficiosGrupo2;
	}
	public String getBeneficiosGrupo3() {
		return beneficiosGrupo3;
	}
	public String getBeneficiosGrupo4() {
		return beneficiosGrupo4;
	}
	public String getBeneficiosGrupo5() {
		return beneficiosGrupo5;
	}
	public String getCompromisos1() {
		return compromisos1;
	}
	public String getCompromisos2() {
		return compromisos2;
	}
	public String getCompromisos3() {
		return compromisos3;
	}
	public String getCompromisos4() {
		return compromisos4;
	}
	public String getInteresInsti1() {
		return interesInsti1;
	}
	public String getInteresInsti2() {
		return interesInsti2;
	}
	public String getInteresInsti3() {
		return interesInsti3;
	}
	public String getInteresInsti4() {
		return interesInsti4;
	}
	public String[] getPartiEvent() {
		return partiEvent;
	}
	public void setBeneficiosGrupo1(String beneficiosGrupo1) {
		this.beneficiosGrupo1 = beneficiosGrupo1;
	}
	public void setBeneficiosGrupo2(String beneficiosGrupo2) {
		this.beneficiosGrupo2 = beneficiosGrupo2;
	}
	public void setBeneficiosGrupo3(String beneficiosGrupo3) {
		this.beneficiosGrupo3 = beneficiosGrupo3;
	}
	public void setBeneficiosGrupo4(String beneficiosGrupo4) {
		this.beneficiosGrupo4 = beneficiosGrupo4;
	}
	public void setBeneficiosGrupo5(String beneficiosGrupo5) {
		this.beneficiosGrupo5 = beneficiosGrupo5;
	}
	public void setCompromisos1(String compromisos1) {
		this.compromisos1 = compromisos1;
	}
	public void setCompromisos2(String compromisos2) {
		this.compromisos2 = compromisos2;
	}
	public void setCompromisos3(String compromisos3) {
		this.compromisos3 = compromisos3;
	}
	public void setCompromisos4(String compromisos4) {
		this.compromisos4 = compromisos4;
	}
	public void setInteresInsti1(String interesInsti1) {
		this.interesInsti1 = interesInsti1;
	}
	public void setInteresInsti2(String interesInsti2) {
		this.interesInsti2 = interesInsti2;
	}
	public void setInteresInsti3(String interesInsti3) {
		this.interesInsti3 = interesInsti3;
	}
	public void setInteresInsti4(String interesInsti4) {
		this.interesInsti4 = interesInsti4;
	}
	public void setPartiEvent(String[] partiEvent) {
		this.partiEvent = partiEvent;
	}
	public long getIdProp() {
		return idProp;
	}
	public void setIdProp(long idProp) {
		this.idProp = idProp;
	}
}
