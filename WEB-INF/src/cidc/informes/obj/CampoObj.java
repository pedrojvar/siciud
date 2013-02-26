package cidc.informes.obj;

import java.util.ArrayList;
import java.util.List;

public class CampoObj {
	
	/**** clase que contiene la estructura de los campos select para mostrar en el filtro ****/
	public static class campoSeleccion{
		String nombre;
		String valor;
		
		public String getNombre() {
			return nombre;
		}
		public void setNombre(String nombre) {
			this.nombre = nombre;
		}
		public String getValor() {
			return valor;
		}
		public void setValor(String valor) {
			this.valor = valor;
		}		
	}
	
	int idTabla;
	int idCampo;
	String etiquetaCampo;
	String nombreCampo;
	String tipoCampo;
	String etiquetaTabla;
	String caso;
	String opciones;
	List<campoSeleccion> campoSelect=new ArrayList<campoSeleccion>(); // está variable será usada solo con los campos de tipo select y boolean 
	
	
	public List<campoSeleccion> getCampoSelect() {
		return campoSelect;
	}
	public void setCampoSelect(List<campoSeleccion> campoSelect) {
		this.campoSelect = campoSelect;
	}
	public String getCaso() {
		return caso;
	}
	public void setCaso(String caso) {
		this.caso = caso;
	}
	public String getOpciones() {
		return opciones;
	}
	public void setOpciones(String opciones) {
		this.opciones = opciones;
	}
	public String getEtiquetaTabla() {
		return etiquetaTabla;
	}
	public void setEtiquetaTabla(String etiquetaTabla) {
		this.etiquetaTabla = etiquetaTabla;
	}
	public int getIdTabla() {
		return idTabla;
	}
	public void setIdTabla(int idTabla) {
		this.idTabla = idTabla;
	}
	public int getIdCampo() {
		return idCampo;
	}
	public void setIdCampo(int idCampo) {
		this.idCampo = idCampo;
	}
	public String getEtiquetaCampo() {
		return etiquetaCampo;
	}
	public void setEtiquetaCampo(String etiquetaCampo) {
		this.etiquetaCampo = etiquetaCampo;
	}
	public String getNombreCampo() {
		return nombreCampo;
	}
	public void setNombreCampo(String nombreCampo) {
		this.nombreCampo = nombreCampo;
	}
	public String getTipoCampo() {
		return tipoCampo;
	}
	public void setTipoCampo(String tipoCampo) {
		this.tipoCampo = tipoCampo;
	}
	
		
}
