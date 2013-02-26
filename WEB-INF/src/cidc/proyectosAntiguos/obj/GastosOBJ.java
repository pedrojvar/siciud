package cidc.proyectosAntiguos.obj;

import java.io.Serializable;

public class GastosOBJ implements Serializable{

   private int idGastos;
   private int idproyecto;
   private String fecha =null;
   private String descripcion = null;
   private String observ=null;
   private String valor = null;
   private int tipo;
   private int rubro;

   private int idElemento;
   private String placa = null;
   private String marca = null;
   private String serie=null;
   private String observacion = null;
   private String nombreRubro = null;

   private boolean devuelto;


public boolean isDevuelto() {
	return devuelto;
}
public void setDevuelto(boolean devuelto) {
	this.devuelto = devuelto;
}
public String getNombreRubro() {
	return nombreRubro;
}
public void setNombreRubro(String nombreRubro) {
	this.nombreRubro = nombreRubro;
}
public int getRubro() {
	return rubro;
}
public void setRubro(int rubro) {
	this.rubro = rubro;
}
public int getTipo() {
	return tipo;
}
public void setTipo(int tipo) {
	this.tipo = tipo;
}
public String getDescripcion() {
	return descripcion;
}
public void setDescripcion(String descripcion) {
	this.descripcion = descripcion;
}
public String getFecha() {
	return fecha;
}
public void setFecha(String fecha) {
	this.fecha = fecha;
}
public String getValor() {
	return valor;
}
public void setValor(String valor) {
	this.valor = valor;
}
public int getIdGastos() {
	return idGastos;
}
public void setIdGastos(int idGastos) {
	this.idGastos = idGastos;
}
public int getIdElemento() {
	return idElemento;
}
public void setIdElemento(int idElemento) {
	this.idElemento = idElemento;
}
public String getMarca() {
	return marca;
}
public void setMarca(String marca) {
	this.marca = marca;
}
public String getObservacion() {
	return observacion;
}
public void setObservacion(String observacion) {
	this.observacion = observacion;
}
public String getPlaca() {
	return placa;
}
public void setPlaca(String placa) {
	this.placa = placa;
}
public String getSerie() {
	return serie;
}
public void setSerie(String serie) {
	this.serie = serie;
}
public String getObserv() {
	return observ;
}
public void setObserv(String observ) {
	this.observ = observ;
}
public int getIdproyecto() {
	return idproyecto;
}
public void setIdproyecto(int idproyecto) {
	this.idproyecto = idproyecto;
}

}
