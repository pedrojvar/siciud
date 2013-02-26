package cidc.resultados.obj;

public class ListaPropuesta {

	private long idPropuesta;
	private String nombreInvestigador;
	private String nombrePropuesta;
	private int estado;

	public long getIdPropuesta() {
		return idPropuesta;
	}
	public String getNombreInvestigador() {
		return nombreInvestigador;
	}
	public String getNombrePropuesta() {
		return nombrePropuesta;
	}
	public void setIdPropuesta(long idPropuesta) {
		this.idPropuesta = idPropuesta;
	}
	public void setNombreInvestigador(String nombreInvestigador) {
		this.nombreInvestigador = nombreInvestigador;
	}
	public void setNombrePropuesta(String nombrePropuesta) {
		this.nombrePropuesta = nombrePropuesta;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}

}

