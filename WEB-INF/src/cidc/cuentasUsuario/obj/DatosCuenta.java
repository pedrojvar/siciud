package cidc.cuentasUsuario.obj;

public class DatosCuenta {
	private long id;
	private String nombre;
	private String apellido;
	private String nick;
	private String mail;
	private String clave;
	private String perfiles;
	private String perf1;
	private String perf2;
	private String perf3;
	private String fecha;

	public String getClave() {
		return clave;
	}
	public String getMail() {
		return mail;
	}
	public String getNick() {
		return nick;
	}
	public String getNombre() {
		return nombre;
	}
	public void setClave(String clave) {
		this.clave = clave;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getPerfiles() {
		return perfiles;
	}
	public void setPerfiles(String perfiles) {
		this.perfiles = perfiles;
	}
	public String getPerf1() {
		return perf1;
	}
	public String getPerf2() {
		return perf2;
	}
	public String getPerf3() {
		return perf3;
	}
	public void setPerf1(String perf1) {
		this.perf1 = perf1;
	}
	public void setPerf2(String perf2) {
		this.perf2 = perf2;
	}
	public void setPerf3(String perf3) {
		this.perf3 = perf3;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
}
