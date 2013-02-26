package cidc.general.inicio;

import java.io.Serializable;
import cidc.general.obj.EncriptarURL;

public class Menu implements Serializable{

	private String recurso;
	private String encriptado;
	private String item;
	private String categoria;
	private boolean primario;
	private boolean visible;
	EncriptarURL crypto=new EncriptarURL();

	public String getCategoria() {
		return categoria;
	}
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public boolean isPrimario() {
		return primario;
	}
	public void setPrimario(boolean primario) {
		this.primario = primario;
	}
	public String getRecurso() {
		return recurso;
	}
	public void setRecurso(String recurso) {
		this.recurso = recurso;
	}
	public boolean isVisible() {
		return visible;
	}
	public void setVisible(boolean visible) {
		this.visible = visible;
	}
	public String getEncriptado() {
		encriptado=crypto.encrypt(recurso);
		return encriptado;
	}
	public void setEncriptado(String encriptado) {
		this.encriptado = encriptado;
	}


}
