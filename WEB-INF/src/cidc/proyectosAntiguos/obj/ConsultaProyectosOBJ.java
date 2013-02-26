package cidc.proyectosAntiguos.obj;

import java.io.Serializable;

public class ConsultaProyectosOBJ implements Serializable{

	private String facultad=null;
	private String grupo=null;
	private String proycurri=null;
	private String investigador=null;
	private String codigo=null;
	private String ano=null;
	private String nombre= null;
	private String estado=null;
	private String tipo=null;


	public String getGrupo() {
		return (grupo!=null)?grupo:"%";
	}
	public void setGrupo(String grupo) {
		if(!grupo.equals("0"))
		this.grupo = grupo;
	}
	public String getAno() {
		return (ano!=null)?ano:"%";
	}
	public void setAno(String ano) {
		if(!ano.equals("0"))
			this.ano = ano;
	}
	public String getCodigo() {
		return (codigo!=null)?codigo:"%";
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getEstado() {
		return (estado!=null)?estado:"%";
	}
	public void setEstado(String estado) {
		if(!estado.equals("0"))
	        this.estado = estado;
	}
	public String getFacultad() {
		return (facultad!=null)?facultad:"%";
	}
	public void setFacultad(String facultad) {
		if(!facultad.equals("0"))
	        this.facultad = facultad;
	}
	public String getInvestigador() {
		return (investigador!=null)?investigador:"%";
	}
	public void setInvestigador(String investigador) {
		if(!investigador.equals("0"))
			this.investigador = investigador;
	}
	public String getNombre() {
		return (nombre!=null)?nombre:"%";
	}
	public void setNombre(String nombre) {
		this.nombre = "%"+nombre+"%";
	}
	public String getProycurri() {
		return proycurri;
	}
	public void setProycurri(String proycurri) {
		this.proycurri = proycurri;
	}
	public String getTipo() {
		return (tipo!=null)?tipo:"%";
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
}