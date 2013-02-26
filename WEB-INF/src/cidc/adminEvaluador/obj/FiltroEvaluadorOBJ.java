package cidc.adminEvaluador.obj;

public class FiltroEvaluadorOBJ {
	
	private String codigo;
	private String documento;
	private String nombres;
	private String apellidos;
	private String camposTrabajo;
	private int tipEval;
	private int orden;

	public String getCamposTrabajo() {
		return (camposTrabajo!=null)?camposTrabajo:"%";
	}
	public void setCamposTrabajo(String camposTrabajo) {
		this.camposTrabajo = "%"+camposTrabajo+"%";
	}
	public String getCodigo() {
		return (codigo!=null) ? codigo:"%";
	}
	public String getDocumento() {
		return (documento!=null) ? documento:"%";
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public void setDocumento(String documento) {
		this.documento = documento;
	}
	public String getApellidos() {
		return (apellidos!=null)? apellidos:"%";
	}
	public void setApellidos(String apellidos) {
		this.apellidos = "%"+apellidos+"%";
	}
	public int getTipEval() {
		return tipEval;
	}
	public void setTipEval(int tipEval) {
		this.tipEval = tipEval;
	}
	public String getNombres() {
		return (nombres!=null) ? nombres:"%";
	}
	public void setNombres(String nombres) {
		this.nombres = "%"+nombres+"%";
	}
	public int getOrden() {
		return orden;
	}
	public void setOrden(int orden) {
		this.orden = orden;
	}
	/*public int getProyectCurricular() {
		return proyectCurricular;
	}
	public void setProyectCurricular(int proyectCurricular) {
		this.proyectCurricular = proyectCurricular;
	}*/
	
}
