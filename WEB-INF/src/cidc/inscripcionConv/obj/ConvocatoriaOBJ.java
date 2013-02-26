package cidc.inscripcionConv.obj;

import java.io.Serializable;

public class ConvocatoriaOBJ implements Serializable{
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
	public String observacion;


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
}
