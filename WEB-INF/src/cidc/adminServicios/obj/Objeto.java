package cidc.adminServicios.obj;

public class Objeto {

	private int id;
	private String nombre;
	private int idCat;
	private int idServ;
	private int[] lsPerfiles;

	public int getIdCat() {
		return idCat;
	}
	public int getIdServ() {
		return idServ;
	}
	public void setIdCat(int idCat) {
		this.idCat = idCat;
	}
	public void setIdServ(int idServ) {
		this.idServ = idServ;
	}
	public int getId() {
		return id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int[] getLsPerfiles() {
		return lsPerfiles;
	}
	public void setLsPerfiles(int[] lsPerfiles) {
		this.lsPerfiles = lsPerfiles;
	}
}
