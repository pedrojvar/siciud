package cidc.proyectos.obj;

import java.io.Serializable;

public class FiltroProyecto implements Serializable{
	private String facultad;
	private String proyCur;
	private String grupo;
	private String codigo;
	private String tipo;
	private String convAno;
	private String convNum;
	private String estado;

	public String getFacultad() {
		return (facultad!=null)?facultad:"%";
	}
	public void setFacultad(String facultad) {
		if(!facultad.equals("0"))
			this.facultad = facultad;
	}
	public String getGrupo() {
		return (grupo!=null)?grupo:"%";
	}
	public void setGrupo(String grupo) {
		this.grupo = grupo;
	}
	public String getProyCur() {
		return (proyCur!=null)?proyCur:"%";
	}
	public void setProyCur(String proyCur) {
		this.proyCur = proyCur;
	}
	public String getCodigo() {
		return (codigo!=null)?codigo:"%";
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getConvAno() {
		return (convAno!=null)?convAno:"%";
	}
	public String getConvNum() {
		return (convNum!=null)?convNum:"%";
	}
	public void setConvAno(String convAno) {
		this.convAno = convAno;
	}
	public void setConvNum(String convNum) {
		this.convNum = convNum;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getEstado() {
		return (estado!=null)?estado:"%";
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
}


