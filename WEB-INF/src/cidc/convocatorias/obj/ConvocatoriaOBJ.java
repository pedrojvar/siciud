package cidc.convocatorias.obj;

import java.util.ArrayList;
import java.util.List;

public class ConvocatoriaOBJ {
	public long convId;
	public int convAno;
	public int convNumero;
	public String convNombre;
	public String convCuantia;
	public int convDuracion;
	public String convFecInicio;
	public String convFecFin;
	public String convDirigido;
	public boolean convPublica;
	public String convArchivo;
	public String convResolucion;
	public String observacion;
	public int cantProduct;
	public String corteActual;
	public boolean inscripcion=false;// para saber si habilita o no el botón de inscripciones
	public List cortes;

	private List listaCortes=new ArrayList();

	public String getObservacion() {
		return (observacion!=null) ? observacion:"";
	}
	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}
	public int getConvAno() {
		return convAno;
	}
	public void setConvAno(int convAno) {
		this.convAno = convAno;
	}
	public String getConvArchivo() {
		return convArchivo;
	}
	public void setConvArchivo(String convArchivo) {
		this.convArchivo = convArchivo;
	}
	public String getConvCuantia() {
		return convCuantia;
	}
	public void setConvCuantia(String convCuantia) {
		this.convCuantia = convCuantia;
	}
	public String getConvDirigido() {
		return convDirigido;
	}
	public void setConvDirigido(String convDirigido) {
		this.convDirigido = convDirigido;
	}
	public int getConvDuracion() {
		return convDuracion;
	}
	public void setConvDuracion(int convDuracion) {
		this.convDuracion = convDuracion;
	}
	public String getConvFecFin() {
		return convFecFin;
	}
	public void setConvFecFin(String convFecFin) {
		this.convFecFin = convFecFin;
	}
	public String getConvFecInicio() {
		return convFecInicio;
	}
	public void setConvFecInicio(String convFecInicio) {
		this.convFecInicio = convFecInicio;
	}
	public long getConvId() {
		return convId;
	}
	public void setConvId(long convId) {
		this.convId = convId;
	}
	public String getConvNombre() {
		return convNombre;
	}
	public void setConvNombre(String convNombre){
		this.convNombre = convNombre;
	}
	public int getConvNumero() {
		return convNumero;
	}
	public void setConvNumero(int convNumero) {
		this.convNumero = convNumero;
	}
	public boolean isConvPublica() {
		return convPublica;
	}
	public void setConvPublica(boolean convPublica) {
		this.convPublica = convPublica;
	//	System.out.println("asigna publica  ="+convPublica);
	}
	public String getConvResolucion() {
		return convResolucion;
	}
	public void setConvResolucion(String convResolucion) {
		this.convResolucion = convResolucion;
	}
	public int getCantProduct() {
		return cantProduct;
	}
	public void setCantProduct(int cantProduct) {
		this.cantProduct = cantProduct;
	}
	public String getCorteActual() {
		return corteActual;
	}
	public void setCorteActual(String corteActual) {
		this.corteActual = corteActual;
	}
	public List getListaCortes() {
		return listaCortes;
	}
	public void setListaCortes(List listaCortes) {
		this.listaCortes = listaCortes;
	}
	public List getCortes() {
		return cortes;
	}
	public void setCortes(List cortes) {
		this.cortes = cortes;
	}
	public boolean isInscripcion() {
		return inscripcion;
	}
	public void setInscripcion(boolean inscripcion) {
		this.inscripcion = inscripcion;
	}

}
