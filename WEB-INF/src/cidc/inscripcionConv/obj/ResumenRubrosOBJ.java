package cidc.inscripcionConv.obj;

import java.io.Serializable;

public class ResumenRubrosOBJ implements Serializable{

	private String nombre;
	private String cidc="";
	private String ud="";
	private String contra="";

	public String getCidc() {
		return cidc;
	}
	public void setCidc(String cidc) {
		this.cidc = cidc;
	}
	public String getContra() {
		return contra;
	}
	public void setContra(String contra) {
		this.contra = contra;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getUd() {
		return ud;
	}
	public void setUd(String ud) {
		this.ud = ud;
	}

}

