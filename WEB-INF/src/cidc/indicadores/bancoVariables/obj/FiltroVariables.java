package cidc.indicadores.bancoVariables.obj;

import java.io.Serializable;

public class FiltroVariables implements Serializable
{
	private String identificador;
	private String nombre;
	private String responsable;

	public String getIdentificador() {
		return identificador !=null ? identificador:"%";
	}
	public void setIdentificador(String identificador) {
		this.identificador = "%"+identificador+"%";
	}
	public String getNombre() {
		return nombre !=null ? nombre:"%";
	}
	public void setNombre(String nombre) {
		this.nombre = "%"+nombre+"%";
	}
	public String getResponsable() {
		return responsable !=null ? responsable:"%";
	}
	public void setResponsable(String responsable) {
		if(responsable.equals("0"))
			this.responsable="%";
		else
			this.responsable = responsable;
	}
}
