package cidc.adminGrupos.obj;

public class ListaGrupos {

	private int idGrupo;
	private String nombreGrupo;
	private String tipoGrupoTxt;
	private int tipoGrupo;
	private int categoriaGrupo;	
	private String rolTxt;
	private int rol;
	private boolean director;
	private boolean estadoGrupo;
	private boolean estadoIntegrante;

	
	public int getCategoriaGrupo() {
		return categoriaGrupo;
	}
	public void setCategoriaGrupo(int categoriaGrupo) {
		this.categoriaGrupo = categoriaGrupo;
	}
	public boolean isEstadoIntegrante() {
		return estadoIntegrante;
	}
	public void setEstadoIntegrante(boolean estadoIntegrante) {
		this.estadoIntegrante = estadoIntegrante;
	}
	public int getIdGrupo() {
		return idGrupo;
	}
	public void setIdGrupo(int idGrupo) {
		this.idGrupo = idGrupo;
	}
	public String getNombreGrupo() {
		return nombreGrupo;
	}
	public void setNombreGrupo(String nombreGrupo) {
		this.nombreGrupo = nombreGrupo;
	}
	public int getRol() {
		return rol;
	}
	public void setRol(int rol) {
		this.rol = rol;
	}
	public String getRolTxt() {
		return rolTxt;
	}
	public void setRolTxt(String rolTxt) {
		this.rolTxt = rolTxt;
	}
	public int getTipoGrupo() {
		return tipoGrupo;
	}
	public void setTipoGrupo(int tipoGrupo) {
		this.tipoGrupo = tipoGrupo;
	}
	public String getTipoGrupoTxt() {
		return tipoGrupoTxt;
	}
	public void setTipoGrupoTxt(String tipoGrupoTxt) {
		this.tipoGrupoTxt = tipoGrupoTxt;
	}
	public boolean isEstadoGrupo() {
		return estadoGrupo;
	}
	public void setEstadoGrupo(boolean estadoGrupo) {
		this.estadoGrupo = estadoGrupo;
	}
	public boolean isDirector() {
		if(rolTxt.equals("Director"))
			director=true;
		else
			director=false;
		return director;
	}
	public void setDirector(boolean director) {
		this.director = director;
	}

}
