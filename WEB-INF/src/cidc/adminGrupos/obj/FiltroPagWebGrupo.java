package cidc.adminGrupos.obj;

import java.io.Serializable;

public class FiltroPagWebGrupo implements Serializable{

	private String facultad;
	private String categoria;
	private String tipo;
	private String nombreDirector;
	private String apellidoDirector;	
	private String nombreGrupo;
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
	public String getCategoria() {
		return (categoria!=null)?categoria:"%";
	}
	public void setCategoria(String categoria) {
		if(categoria.equals("0"))
			this.categoria="%";
		else
			this.categoria = categoria;
	}
	public String getNombreDirector() {
		return (nombreDirector!=null)?nombreDirector:"%";
	}
	public void setNombreDirector(String nombreDirector) {
		this.nombreDirector = "%"+nombreDirector+"%";
	}
	public String getNombreGrupo() {
		return nombreGrupo;
	}
	public String getNombreGrupo2() {
		if(nombreGrupo==null)
		{
			return "%";
		}
		else
		{
			return "%" + nombreGrupo + "%";
		}
	}
	public void setNombreGrupo(String nombreGrupo) {
		this.nombreGrupo = nombreGrupo;
	}
}
