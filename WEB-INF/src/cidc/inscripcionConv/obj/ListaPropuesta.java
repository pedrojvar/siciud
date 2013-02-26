package cidc.inscripcionConv.obj;

import java.io.Serializable;

public class ListaPropuesta implements Serializable {

	private long idPropuesta;
	private String nombrePropuesta;

	public long getIdPropuesta() {
		return idPropuesta;
	}
	public void setIdPropuesta(long idPropuesta) {
		this.idPropuesta = idPropuesta;
	}
	public String getNombrePropuesta() {
		return nombrePropuesta;
	}
	public void setNombrePropuesta(String nombrePropuesta) {
		this.nombrePropuesta = nombrePropuesta;
	}

}
