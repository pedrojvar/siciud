package cidc.general.obj;

public class Paginacion {

	private int inicio=0;
	private int fin=0;
	
	private int totalRegistros=0;
	private int desde=0;
	
	private int cantPaginas=0;
	private int regPorPag=0;
	
	private int cantSet=10;
	private int offset=1;
	
	
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getCantSet() {
		return cantSet;
	}
	public void setCantSet(int cantSet) {
		this.cantSet = cantSet;
	}
	public int getInicio() {
		return inicio;
	}
	public void setInicio(int inicio) {
		this.inicio = inicio;
	}
	public int getFin() {
		return fin;
	}
	public void setFin(int fin) {
		this.fin = fin;
	}
	public int getTotalRegistros() {
		return totalRegistros;
	}
	public void setTotalRegistros(int totalRegistros) {
		this.totalRegistros = totalRegistros;
	}
	public int getDesde() {
		return desde;
	}
	public void setDesde(int desde) {
		this.desde = desde;
	}
	public int getCantPaginas() {
		return cantPaginas;
	}
	public void setCantPaginas(int cantPaginas) {
		this.cantPaginas = cantPaginas;
	}
	public int getRegPorPag() {
		return regPorPag;
	}
	public void setRegPorPag(int regPorPag) {
		this.regPorPag = regPorPag;
	}
	

}
