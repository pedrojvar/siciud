package cidc.inscripcionConv.obj;

import java.io.Serializable;

public class CoInvestigadorOBJ implements Serializable{

	private String documento;
	private String nombres;
	private String apellidos;
	private String papel;
	private String horas;

	public String getApellidos(){
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public String getDocumento() {
		return documento;
	}
	public void setDocumento(String documento) {
		this.documento = documento;
	}
	public String getPapel() {
		return papel;
	}
	public void setPapel(String papel) {
		this.papel = papel;
	}
	public String getNombres() {
		return nombres;
	}
	public void setNombres(String nombres) {
		this.nombres = nombres;
	}
	public String getHoras() {
		return horas;
	}
	public void setHoras(String horas) {
		this.horas = horas;
	}

}
