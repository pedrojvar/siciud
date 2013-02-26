package cidc.inscripcionConv.obj;

public class ConvCorte {

	public int idCorte;
	public int numCorte;
	public long convId;
	public String fechaApertura;
	public String fechaCierre;
	public String auxApertura;
	public String auxCierre;

	public String getAuxApertura() {
		return auxApertura;
	}
	public void setAuxApertura(String auxApertura) {
		this.auxApertura = auxApertura;
	}
	public String getAuxCierre() {
		return auxCierre;
	}
	public void setAuxCierre(String auxCierre) {
		this.auxCierre = auxCierre;
	}
	public long getConvId() {
		return convId;
	}
	public void setConvId(long convId) {
		this.convId = convId;
	}
	public String getFechaApertura() {
		return fechaApertura;
	}
	public void setFechaApertura(String fechaApertura) {
		this.fechaApertura = fechaApertura;
	}
	public String getFechaCierre() {
		return fechaCierre;
	}
	public void setFechaCierre(String fechaCierre) {
		this.fechaCierre = fechaCierre;
	}
	public int getIdCorte() {
		return idCorte;
	}
	public void setIdCorte(int idCorte) {
		this.idCorte = idCorte;
	}
	public int getNumCorte() {
		return numCorte;
	}
	public void setNumCorte(int numCorte) {
		this.numCorte = numCorte;
	}

}
