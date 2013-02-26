package cidc.adminGrupos.obj;

import java.io.Serializable;
import java.util.List;

public class Integrante implements Serializable{

	private long id;
	private long idGrupo;
	private String nombreGrupo;	
	private long idProyectoCurr;
	private String codigoUd;
	private int codFacultad;
	private String nombreFacultad;
	private int codproyCurr;
	private String nombreProyCurr;
	private int estado;
	private String nombreEstado;
	private int tipoPer;
	private String nombreTipoPer;
	private boolean perActualizado;
	private int tipoCed;
	private String nombreTipoCed;
	private String contrasena;
	private String cedula;
	private String deCed;
	private String direccion;
	private String nombres;
	private String apellidos;
	private String tel1;
	private String tel2;
	private String cel1;
	private String cel2;
	private String mailInst;
	private String mail;
	private String fechaNacimiento;
	private String fechaIngreso;
	private String fechaSalida;
	private int genero;
	private String nombreGenero;
	private int flag;//1=encontrado en post actulizado  0=post null  2=encontrado en post NO Actulizado
	private int flagFn;//0=no tiene fechaNacimiento  1=tiene fechaNacimiento
	private int flagPyc;//0=no tiene proyectoCurricular   1=tiene proyecto curricular
	private List proyectosCurriculares;
	private List areasSNIES;

	private String fechaVinculacion;
	private String fechaSalidaGrupo;
	private int papel;
	private long grupo;
	private String ultimaActua;
	private String cvlac;
	private int codareasnies;	
	
	public String getNombreGrupo() {
		return nombreGrupo;
	}
	public void setNombreGrupo(String nombreGrupo) {
		this.nombreGrupo = nombreGrupo;
	}
	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public String getCedula() {
		return cedula;
	}
	public void setCedula(String cedula) {
		this.cedula = cedula;
	}
	public String getCel1() {
		return cel1;
	}
	public void setCel1(String cel1) {
		this.cel1 = cel1;
	}
	public int getCodFacultad() {
		return codFacultad;
	}
	public void setCodFacultad(int codFacultad) {
		this.codFacultad = codFacultad;
	}
	public String getCodigoUd() {
		return codigoUd;
	}
	public void setCodigoUd(String codigoUd) {
		this.codigoUd = codigoUd;
	}
	public int getCodproyCurr() {
		return codproyCurr;
	}
	public void setCodproyCurr(int codproyCurr) {
		this.codproyCurr = codproyCurr;
	}
	public String getContrasena() {
		return contrasena;
	}
	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}
	public String getCvlac() {
		return cvlac;
	}
	public void setCvlac(String cvlac) {
		this.cvlac = cvlac;
	}
	public String getDeCed() {
		return deCed;
	}
	public void setDeCed(String deCed) {
		this.deCed = deCed;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public String getFechaIngreso() {
		return fechaIngreso;
	}
	public void setFechaIngreso(String fechaIngreso) {
		this.fechaIngreso = fechaIngreso;
	}
	public String getFechaNacimiento() {
		return fechaNacimiento;
	}
	public void setFechaNacimiento(String fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}
	public String getFechaSalida() {
		return fechaSalida;
	}
	public void setFechaSalida(String fechaSalida) {
		this.fechaSalida = fechaSalida;
	}
	public String getFechaVinculacion() {
		return fechaVinculacion;
	}
	public void setFechaVinculacion(String fechaVinculacion) {
		this.fechaVinculacion = fechaVinculacion;
	}
	public int getGenero() {
		return genero;
	}
	public void setGenero(int genero) {
		this.genero = genero;
	}
	public long getGrupo() {
		return grupo;
	}
	public void setGrupo(long grupo) {
		this.grupo = grupo;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getIdGrupo() {
		return idGrupo;
	}
	public void setIdGrupo(long idGrupo) {
		this.idGrupo = idGrupo;
	}
	public long getIdProyectoCurr() {
		return idProyectoCurr;
	}
	public void setIdProyectoCurr(long idProyectoCurr) {
		this.idProyectoCurr = idProyectoCurr;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getMailInst() {
		return mailInst;
	}
	public void setMailInst(String mailInst) {
		this.mailInst = mailInst;
	}
	public String getNombreEstado() {
		return nombreEstado;
	}
	public void setNombreEstado(String nombreEstado) {
		this.nombreEstado = nombreEstado;
	}
	public String getNombreFacultad() {
		return nombreFacultad;
	}
	public void setNombreFacultad(String nombreFacultad) {
		this.nombreFacultad = nombreFacultad;
	}
	public String getNombreGenero() {
		return nombreGenero;
	}
	public void setNombreGenero(String nombreGenero) {
		this.nombreGenero = nombreGenero;
	}
	public String getNombreProyCurr() {
		return nombreProyCurr;
	}
	public void setNombreProyCurr(String nombreProyCurr) {
		this.nombreProyCurr = nombreProyCurr;
	}
	public String getNombres() {
		return nombres;
	}
	public void setNombres(String nombres) {
		this.nombres = nombres;
	}
	public String getNombreTipoCed() {
		return nombreTipoCed;
	}
	public void setNombreTipoCed(String nombreTipoCed) {
		this.nombreTipoCed = nombreTipoCed;
	}
	public String getNombreTipoPer() {
		return nombreTipoPer;
	}
	public void setNombreTipoPer(String nombreTipoPer) {
		this.nombreTipoPer = nombreTipoPer;
	}
	public int getPapel() {
		return papel;
	}
	public void setPapel(int papel) {
		this.papel = papel;
	}
	public boolean isPerActualizado() {
		return perActualizado;
	}
	public void setPerActualizado(boolean perActualizado) {
		this.perActualizado = perActualizado;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public int getTipoCed() {
		return tipoCed;
	}
	public void setTipoCed(int tipoCed) {
		this.tipoCed = tipoCed;
	}
	public int getTipoPer() {
		return tipoPer;
	}
	public void setTipoPer(int tipoPer) {
		this.tipoPer = tipoPer;
	}
	public String getUltimaActua() {
		return ultimaActua;
	}
	public void setUltimaActua(String ultimaActua) {
		this.ultimaActua = ultimaActua;
	}
	public String getCel2() {
		return cel2;
	}
	public void setCel2(String cel2) {
		this.cel2 = cel2;
	}
	public String getFechaSalidaGrupo() {
		return fechaSalidaGrupo;
	}
	public void setFechaSalidaGrupo(String fechaSalidaGrupo) {
		this.fechaSalidaGrupo = fechaSalidaGrupo;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public int getFlagFn() {
		return flagFn;
	}
	public void setFlagFn(int flagFn) {
		this.flagFn = flagFn;
	}
	public int getFlagPyc() {
		return flagPyc;
	}
	public void setFlagPyc(int flagPyc) {
		this.flagPyc = flagPyc;
	}
	public List getProyectosCurriculares() {
		return proyectosCurriculares;
	}
	public void setProyectosCurriculares(List proyectosCurriculares) {
		this.proyectosCurriculares = proyectosCurriculares;
	}
	public int getCodareasnies() {
		return codareasnies;
	}
	public void setCodareasnies(int codareasnies) {
		this.codareasnies = codareasnies;
	}
	public List getAreasSNIES() {
		return areasSNIES;
	}
	public void setAreasSNIES(List areasSNIES) {
		this.areasSNIES = areasSNIES;
	}
}
