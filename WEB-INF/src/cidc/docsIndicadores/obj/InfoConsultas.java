package cidc.docsIndicadores.obj;

import java.io.Serializable;

public class InfoConsultas implements Serializable
{
	private String nombreusuario;
	private int iddoc;
	private String indnomdocumento;
	private String indnomimagen;
	private int indtipodoc;
	private int indcategoria;
	private int indtipo;
	private String inddescripcion;
	private String indobservaciones;

	public int getIddoc() {
		return iddoc;
	}
	public void setIddoc(int iddoc) {
		this.iddoc = iddoc;
	}
	public int getIndcategoria() {
		return indcategoria;
	}
	public void setIndcategoria(int indcategoria) {
		this.indcategoria = indcategoria;
	}
	public String getInddescripcion() {
		return inddescripcion;
	}
	public void setInddescripcion(String inddescripcion) {
		this.inddescripcion = inddescripcion;
	}
	public String getIndnomdocumento() {
		return indnomdocumento;
	}
	public void setIndnomdocumento(String indnomdocumento) {
		this.indnomdocumento = indnomdocumento;
	}
	public String getIndobservaciones() {
		return indobservaciones;
	}
	public void setIndobservaciones(String indobservaciones) {
		this.indobservaciones = indobservaciones;
	}
	public int getIndtipo() {
		return indtipo;
	}
	public void setIndtipo(int indtipo) {
		this.indtipo = indtipo;
	}
	public int getIndtipodoc() {
		return indtipodoc;
	}
	public void setIndtipodoc(int indtipodoc) {
		this.indtipodoc = indtipodoc;
	}
	public String getNombreusuario() {
		return nombreusuario;
	}
	public void setNombreusuario(String nombreusuario) {
		this.nombreusuario = nombreusuario;
	}
	public String getIndnomimagen() {
		return indnomimagen;
	}
	public void setIndnomimagen(String indnomimagen) {
		this.indnomimagen = indnomimagen;
	}

}
