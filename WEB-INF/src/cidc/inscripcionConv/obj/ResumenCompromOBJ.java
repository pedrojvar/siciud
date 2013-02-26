package cidc.inscripcionConv.obj;

import java.io.Serializable;

public class ResumenCompromOBJ implements Serializable{

	private String producto;
	private String indicador;
	private int cantidad;

	public int getCantidad() {
		return cantidad;
	}
	public String getIndicador() {
		return indicador;
	}
	public String getProducto() {
		return producto;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	public void setIndicador(String indicador) {
		this.indicador = indicador;
	}
	public void setProducto(String producto) {
		this.producto = producto;
	}




}

