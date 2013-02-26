package cidc.general.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;
import cidc.general.obj.Parametros;

public class CursorDB {
	private String msg;
	private String motor, driver, host, puerto, bd, usuario, password, url;
	private String mansito = "";

	public CursorDB() {

	}

	public Connection getConnection(int id) throws Exception {
		Connection con = null;
		try {
			switch (id) {
			case Parametros.userAdministrador:
				mansito = "conexion.usuario1";
				break;
			case Parametros.userVisitante:
				mansito = "conexion.usuario2";
				break;
			case Parametros.userComite:
				mansito = "conexion.usuario3";
				break;
			case Parametros.userFuncionarioA:
				mansito = "conexion.usuario4";
				break;
			case Parametros.userFuncionarioB:
				mansito = "conexion.usuario5";
				break;
			case Parametros.userFuncionarioC:
				mansito = "conexion.usuario6";
				break;
			case Parametros.userFuncionarioD:
				mansito = "conexion.usuario7";
				break;
			case Parametros.userInvestigador:
				mansito = "conexion.usuario8";
				break;
			case Parametros.userEvaluador:
				mansito = "conexion.usuario9";
				break;
			case Parametros.userDirector:
				mansito = "conexion.usuario10";
				break;
			default:
				mansito = "conexion.usuario11";
				break;
			}
			// System.out.println("Entra: "+mansito);
			con = this.abrir();
		} catch (Exception e) {
			throw new Exception(e);
		}
		return con;
	}

	public Connection abrir() throws Exception {
		Connection cn = null;
		try {
			ResourceBundle rb = java.util.ResourceBundle
					.getBundle("cidc.general.conect");
			motor = rb.getString("conexion.motor");
			driver = rb.getString("conexion.driver");
			host = rb.getString("conexion.host");
			puerto = rb.getString("conexion.puerto");
			bd = rb.getString("conexion.bd");
			usuario = rb.getString(this.mansito);
			password = rb.getString("conexion.password");
			Class.forName(driver);
			cn = DriverManager.getConnection(getUrl(), usuario, password);
		} catch (ClassNotFoundException cnfe) {
			setMensaje("Error buscando los controladores: "
					+ String.valueOf(cnfe));
			throw new Exception(cnfe);
		} catch (SQLException sqle) {
			setMensaje("Error intentando abrir la conexion: "
					+ String.valueOf(sqle));
			throw new Exception(sqle);
		}
		return cn;
	}

	public String getUrl() {
		if (motor.equals("postgresql") && host != null && puerto != null
				&& bd != null)
			return ("jdbc:postgresql://" + host + ":" + puerto + "/" + bd);
		return "";
	}

	public void setMensaje(String s) {
		this.msg += s;
	}

	public Connection abrirOracle() {
		Connection cn = null;
		ResourceBundle rb = java.util.ResourceBundle
				.getBundle("cidc.general.conect");

		try {
			DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());

			// host= "localhost";
			host = "10.20.0.4";
			puerto = "1521";
			url = "jdbc:oracle:thin:@" + host + ":" + puerto + ":"
					+ rb.getString("conexionOracle.db");
		
			usuario = rb.getString("conexionOracle.usuario");
			password = rb.getString("conexionOracle.clave");
		

			cn = DriverManager.getConnection(url, usuario, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return cn;
	}

}
