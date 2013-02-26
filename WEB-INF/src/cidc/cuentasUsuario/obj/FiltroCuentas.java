package cidc.cuentasUsuario.obj;

public class FiltroCuentas {

	private String nombre;
	private String apellido;
	private String nick;
	private String perfil;
	private int orden;

	public String getApellido(){
		return apellido!=null?apellido:"%";
	}
	public String getPerfil(){
		return perfil!=null?perfil:"%";
	}
	public void setApellido(String apellido){
		this.apellido = "%"+apellido+"%";
	}
	public void setPerfil(String perfil){
		this.perfil = perfil;
	}
	public String getNick(){
		return nick!=null?nick:"%";
	}
	public String getNombre(){
		return nombre!=null?nombre:"%";
	}
	public int getOrden(){
		return orden;
	}
	public void setNick(String nick){
		this.nick = "%"+nick+"%";
	}
	public void setNombre(String nombre){
		this.nombre = "%"+nombre+"%";
	}
	public void setOrden(int orden){
		this.orden = orden;
	}
}
