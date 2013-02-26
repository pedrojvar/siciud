package cidc.proyectos.obj;

import java.io.Serializable;
import java.util.List;

public class BalanceGeneral implements Serializable{
	long idProyecto;
	List listaRubros;

	public long getIdProyecto() {
		return idProyecto;
	}
	public List getListaRubros() {
		return listaRubros;
	}
	public void setIdProyecto(long idProyecto) {
		this.idProyecto = idProyecto;
	}
	public void setListaRubros(List listaRubros) {
		this.listaRubros = listaRubros;
	}
}
