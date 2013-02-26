package cidc.indicadores.fichasIndicadores.obj;

public class FiltroFichas
{
	private String identificador;
	private String modelo;
	private String nombre;
	private String responsable;

	public String getIdentificador() {
		return identificador !=null ? identificador:"%";
	}
	public void setIdentificador(String identificador) {
		this.identificador = "%"+identificador+"%";
	}
	public String getModelo() {
		return modelo !=null ? modelo:"%";
	}
	public void setModelo(String modelo) {
		if(modelo.equals("0"))
			this.modelo="%";
		else
			this.modelo = modelo;
	}
	public String getNombre() {
		return nombre !=null ? nombre:"%";
	}
	public void setNombre(String nombre) {
		this.nombre = "%"+nombre+"%";
	}
	public String getResponsable() {
		return responsable !=null ? responsable:"%";
	}
	public void setResponsable(String responsable) {
		if(responsable.equals("0"))
			this.responsable="%";
		else
			this.responsable = responsable;
	}
}
