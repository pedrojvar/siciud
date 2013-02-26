package cidc.informes.obj;

import java.util.ArrayList;
import java.util.List;

public class ParametrosInformeObj {

	String []tablasSeleccionadas;//id de las tablas seleccionadas en el filtro
	String []camposFiltroConsulta; //total de campos de las tablas seleccionadas
	String []valoresFiltroConsulta; //valores digitados como filtro para la SQL
	String []camposParaMostrar; //checks de los campos que deben aparecer en el PDF a imprimir
	List<String> etiquetasCamposMostrar=new ArrayList<String>(); //listado de etiquetas de los campos que se van a imprimir en el informe
	int []estadoValorCampoFiltro;  //vacio, no vacio, valor, ----, el ultimo indica que el campo no se tiene en cuenta en la clausula where
	
	
	
	public List<String> getEtiquetasCamposMostrar() {
		return etiquetasCamposMostrar;
	}
	public void setEtiquetasCamposMostrar(List<String> etiquetasCamposMostrar) {
		this.etiquetasCamposMostrar = etiquetasCamposMostrar;
	}
	public int[] getEstadoValorCampoFiltro() {
		return estadoValorCampoFiltro;
	}
	public void setEstadoValorCampoFiltro(int[] estadoValorCampoFiltro) {
		this.estadoValorCampoFiltro = estadoValorCampoFiltro;
	}
	public String[] getTablasSeleccionadas() {
		return tablasSeleccionadas;
	}
	public void setTablasSeleccionadas(String[] tablasSeleccionadas) {
		this.tablasSeleccionadas = tablasSeleccionadas;
	}
	public String[] getCamposFiltroConsulta() {
		return camposFiltroConsulta;
	}
	public void setCamposFiltroConsulta(String[] camposFiltroConsulta) {
		this.camposFiltroConsulta = camposFiltroConsulta;
	}
	public String[] getValoresFiltroConsulta() {
		return valoresFiltroConsulta;
	}
	public void setValoresFiltroConsulta(String[] valoresFiltroConsulta) {
		this.valoresFiltroConsulta = valoresFiltroConsulta;
	}
	public String[] getCamposParaMostrar() {
		return camposParaMostrar;
	}
	public void setCamposParaMostrar(String[] camposParaMostrar) {
		this.camposParaMostrar = camposParaMostrar;
	}
	
	
}
