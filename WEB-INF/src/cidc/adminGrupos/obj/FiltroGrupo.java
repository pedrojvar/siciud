package cidc.adminGrupos.obj;

import java.io.Serializable;

public class FiltroGrupo implements Serializable{

	private int facultad;
	private int tipo;
	private int regporpag;
	
	public int getFacultad() {
		return facultad;
	}
	public void setFacultad(int facultad) {
		this.facultad = facultad;
	}
	public int getTipo() {
		return tipo;
	}
	public void setTipo(int tipo) {
		this.tipo = tipo;
	}
	public int getRegporpag() {
		return regporpag;
	}
	public void setRegporpag(int regporpag) {
		this.regporpag = regporpag;
	}
	
	
}
