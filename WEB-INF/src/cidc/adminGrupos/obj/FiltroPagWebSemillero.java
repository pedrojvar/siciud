package cidc.adminGrupos.obj;

import java.io.Serializable;

public class FiltroPagWebSemillero implements Serializable{

	private String facultad;
	private String tipo;
	private String nombreDirector;
	private String apellidoDirector;
	private String nombreSemillero;
	private Long codigo;
	private String sigla;
	
	public String getSigla() {
		return sigla;
	} 
	public void setSigla(String sigla) {
		this.sigla = sigla;
	}
	public Long getCodigo() {
		return codigo;
	}
	public void setCodigo(Long codigo) {
		this.codigo = codigo;
	}
	public String getApellidoDirector() {
		return (apellidoDirector!=null)?apellidoDirector:"%";
	}
	public void setApellidoDirector(String apellidoDirector) {
		this.apellidoDirector = "%"+apellidoDirector+"%";
	}
	public String getFacultad() {
		return (facultad!=null)?facultad:"%";
	}
	public void setFacultad(String facultad) {
		if(facultad.equals("0"))
			this.facultad="%";
		else
			this.facultad = facultad;
	}
	public String getTipo() {
		return (tipo!=null)?tipo:"%";
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getNombreDirector() {
		return (nombreDirector!=null)?nombreDirector:"%";
	}
	public void setNombreDirector(String nombreDirector) {
		this.nombreDirector = "%"+nombreDirector+"%";
	}
	public String getNombreSemillero() {
		return nombreSemillero;
	}
	public String getNombreSemillero2() {
		if(nombreSemillero==null)
		{
			return "%";
		}
		else
		{
			return "%" + nombreSemillero + "%";
		}
	}
	public void setNombreSemillero(String nombreSemillero) {
		this.nombreSemillero = nombreSemillero;
	}
}