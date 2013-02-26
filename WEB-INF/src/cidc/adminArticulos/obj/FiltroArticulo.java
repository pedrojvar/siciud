package cidc.adminArticulos.obj;

public class FiltroArticulo {

	private int tipo;
	private int interno;
	private int evento;

	public int getEvento() {
		return evento;
	}
	public int getTipo() {
		return tipo;
	}
	public void setEvento(int evento) {
		this.evento = evento;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}
	public int getInterno() {
		return interno;
	}
	public void setInterno(int interno) {
		this.interno = interno;
	}
}
