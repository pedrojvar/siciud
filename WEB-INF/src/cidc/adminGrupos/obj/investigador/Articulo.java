package cidc.adminGrupos.obj.investigador;

import java.io.Serializable;

public class Articulo implements Serializable{

	private long idArticulo;
	private int estado;
	private int para;
	private int tema;
	private int tipoPre;
	private String tituloArticulo;
	private String presentador;
	private String autores;
	private String palabClaves;
	private String temaInteres;
	private String archivo;
	private String fechaRecibido;
	private int ano;
	public String getArchivo() {
		return archivo;
	}
	public String getAutores() {
		return autores;
	}
	public int getEstado() {
		return estado;
	}
	public String getFechaRecibido() {
		return fechaRecibido;
	}
	public long getIdArticulo() {
		return idArticulo;
	}
	public String getPalabClaves() {
		return palabClaves;
	}
	public String getPresentador() {
		return presentador;
	}
	public int getTema() {
		return tema;
	}
	public String getTemaInteres() {
		return temaInteres;
	}
	public String getTituloArticulo() {
		return tituloArticulo;
	}
	public void setArchivo(String archivo) {
		this.archivo = archivo;
	}
	public void setAutores(String autores) {
		this.autores = autores;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public void setFechaRecibido(String fechaRecibido) {
		this.fechaRecibido = fechaRecibido;
	}
	public void setIdArticulo(long idArticulo) {
		this.idArticulo = idArticulo;
	}
	public void setPalabClaves(String palabClaves) {
		this.palabClaves = palabClaves;
	}
	public void setPresentador(String presentador) {
		this.presentador = presentador;
	}
	public void setTema(int tema) {
		this.tema = tema;
	}
	public void setTemaInteres(String temaInteres) {
		this.temaInteres = temaInteres;
	}
	public void setTituloArticulo(String tituloArticulo) {
		this.tituloArticulo = tituloArticulo;
	}
	public int getPara() {
		return para;
	}
	public void setPara(int para) {
		this.para = para;
	}
	public int getTipoPre() {
		return tipoPre;
	}
	public void setTipoPre(int tipoPre) {
		this.tipoPre = tipoPre;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}

}
