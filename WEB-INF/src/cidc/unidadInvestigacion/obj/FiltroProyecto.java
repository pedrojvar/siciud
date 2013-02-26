package cidc.unidadInvestigacion.obj;

import java.io.Serializable;

public class FiltroProyecto implements Serializable {

	private String idGrupo;
	private String idProyCurr;
	private String tipo;
	private String estado;

	public String getEstado() {
		return (!estado.equals("0"))? estado:"%";
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getIdGrupo() {
		return (!idGrupo.equals("0"))?idGrupo:"%";
	}
	public void setIdGrupo(String idGrupo) {
		this.idGrupo = idGrupo;
	}
	public String getIdProyCurr() {
		return (!idProyCurr.equals("0"))?idProyCurr:"%";
	}
	public void setIdProyCurr(String idProyCurr) {
		this.idProyCurr = idProyCurr;
	}
	public String getTipo() {
		return (!tipo.equals("0"))?tipo:"%";
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

}
