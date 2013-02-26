package cidc.general.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OracleDB {

	/**
	 * @param args
	 */
	static List listaOracle= new ArrayList();
	static List listaPostgresql= new ArrayList();

	  public static void main (String args [])
	  {
		  cosultaCondor();
	//	  cosultaPostgresql();
	//	  if(listaOracle.size()<listaPostgresql.size())
	//		  identificaFaltantes(listaOracle,listaPostgresql);
		//insercion();
		//modificacion();
		System.out.println ("Finalización de la tarea "+new java.util.Date());

	  }

	  public static void identificaFaltantes(List a,List b){
		  PersonitaCondor personaCondor=null;
		  PersonitaCondor personaPostgersql=null;
		  for(int i=0;i<a.size();i++){
			  personaCondor=(PersonitaCondor)a.get(i);
			  for(int j=0;j<b.size();j++){
				  personaPostgersql=(PersonitaCondor)b.get(i);
				  if(personaCondor.getCodigo()==personaPostgersql.getCodigo()){
					  a.remove(i);
					  b.remove(i);
				  }
			  }
		  }
		  System.out.println("--------------------------Lista de Sobrantes---------------------------------");
		  for(int i=0;i<a.size();i++){
			  personaCondor=(PersonitaCondor)a.get(i);
			  System.out.println("----->"+personaCondor.getCodigo()+" "+personaCondor.getNombres()+" "+personaCondor.getApellidos());
		  }
		  System.out.println("--------------------------Lista de Sobrantes---------------------------------");
	  }

	  public static void cosultaCondor(){
		  PersonitaCondor personita=null;
		  System.out.println ("Inicia proceso de prueba" +" "+new java.util.Date());

		  int i=0,cont=0;
		  try {
			DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
			Connection conn = DriverManager.getConnection
			//("jdbc:oracle:thin:@10.20.0.4:1521:sudd", "siciud", "cpnatas40");
			("jdbc:oracle:thin:@localhost:1521:xe", "system", "123456");
			 // driver@machineName:port:SID           ,  userid,  password

			  Statement stmt = conn.createStatement();
	/*		  ResultSet rs = stmt.executeQuery("select CODIGO_CARNET_UD,CODIGO_FACULTAD," +
			  		"CODIGO_PROYECTO_CURRICULAR,CODIGO_ESTADO,CODIGO_PERFIL,TIPO_DOCUMENTO_IDENTIDAD," +
			  		"CONTRASENA,DOCUMENTO_IDENTIDAD,PROCEDENCIA_DOCUMENTO,NOMBRES,APELLIDOS,TELEFONO_FIJO," +
			  		"TELEFONO_CELULAR,CORREO_INSTITUCIONAL,CORREO_PERSONAL,FECHA_NACIMIENTO,FECHA_INGRESO," +
			  		"FECHA_SALIDA,CODIGO_GENERO from v_personas where CODIGO_FACULTAD=32");
			//ResultSet rset = stmt.executeQuery("select count(*) from v_proyectos where estado=5");
			//stmt.executeQuery("select BANNER from SYS.V_$VERSION");

			while (rs.next()){
				i=1;
				personita=new PersonitaCondor();
				personita.setCodigo(rs.getLong(i++));
				personita.setFacultad(rs.getInt(i++));
				personita.setProyCurr(rs.getInt(i++));
				personita.setEstado(rs.getInt(i++));
				personita.setPerfil(rs.getInt(i++));
				personita.setTipoDoc(rs.getInt(i++));
				personita.setContrasena(rs.getString(i++));
				personita.setDocumento(rs.getLong(i++));
				personita.setProceDocumento(rs.getString(i++));
				personita.setNombres(rs.getString(i++));
				personita.setApellidos(rs.getString(i++));
				personita.setTelefono(rs.getString(i++));
				personita.setCelular(rs.getString(i++));
				personita.setMailInstitucional(rs.getString(i++));
				personita.setMailPersonal(rs.getString(i++));
				personita.setFechaNacimiento(rs.getDate(i++));
				personita.setFechaIngreso(rs.getDate(i++));
				personita.setFechaSalida(rs.getDate(i++));
				personita.setGenero(rs.getInt(i++));

				listaOracle.add(personita);
				cont++;
			}
			conn.close();
			stmt.close();
			rs.close();*/
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


		System.out.println ("Cantidad de registros encontrados en Condor= "+cont +" --"+new java.util.Date());
	  }


	  public static void cosultaPostgresql(){
		  PersonitaCondor personita=null;
		  System.out.println ("Inicia proceso de prueba" +" "+new java.util.Date());
		  Connection cn=null;
		  PreparedStatement stPost= null;
		  ResultSet rs=null;
		  int i=0,cont=0;
		  try {
			  Class.forName("org.postgresql.Driver");
			  cn=DriverManager.getConnection("jdbc:postgresql://localhost:5432/siciud3", "postgres", "metisj2ee");
			  stPost = cn.prepareStatement("select pccodcarnet,pcidfacultad,pcidproycurricular,pcidestado,pcidperfilud," +
			  		"pctipodoc,pcclave,pcdocumento,pcprocedoc,pcnombres,pcapellidos,pctelfijo,pctelcel,pcmailinstitucional," +
			  		"pcmailpersonal,pcfecnacimiento,pcfechaingreso,pcfechasalida,pcidgenero from personas where pcidfacultad=32");
			  rs=stPost.executeQuery();
			while (rs.next()){
				i=1;
				personita=new PersonitaCondor();
				personita.setCodigo(rs.getLong(i++));
				personita.setFacultad(rs.getInt(i++));
				personita.setProyCurr(rs.getInt(i++));
				personita.setEstado(rs.getInt(i++));
				personita.setPerfil(rs.getInt(i++));
				personita.setTipoDoc(rs.getInt(i++));
				personita.setContrasena(rs.getString(i++));
				personita.setDocumento(rs.getLong(i++));
				personita.setProceDocumento(rs.getString(i++));
				personita.setNombres(rs.getString(i++));
				personita.setApellidos(rs.getString(i++));
				personita.setTelefono(rs.getString(i++));
				personita.setCelular(rs.getString(i++));
				personita.setMailInstitucional(rs.getString(i++));
				personita.setMailPersonal(rs.getString(i++));
				personita.setFechaNacimiento(rs.getDate(i++));
				personita.setFechaIngreso(rs.getDate(i++));
				personita.setFechaSalida(rs.getDate(i++));
				personita.setGenero(rs.getInt(i++));

				listaPostgresql.add(personita);
				cont++;
			}
			cn.close();
			stPost.close();
			rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		System.out.println ("Cantidad de registros encontrados en Postgresql= "+cont +" --"+new java.util.Date());
	  }



	  public static void insercion(){
		  int i=1;
		  Connection cn=null;
		PreparedStatement stPost=null;
		PersonitaCondor personita=null;
		try {
				Class.forName("org.postgresql.Driver");

				cn=DriverManager.getConnection("jdbc:postgresql://localhost:5432/siciud3", "postgres", "metisj2ee");

			  stPost = cn.prepareStatement("insert into personas (pccodcarnet,pcidfacultad,pcidproycurricular," +
			  		"pcidestado,pcidperfilud,pctipodoc,pcclave,pcdocumento,pcprocedoc,pcnombres,pcapellidos,pctelfijo," +
			  		"pctelcel,pcmailinstitucional,pcmailpersonal,pcfecnacimiento,pcfechaingreso,pcfechasalida,pcidgenero) " +
			  		"values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			  for(int j=0;j<listaOracle.size();j++){
				  	i=1;
				  	personita=(PersonitaCondor)listaOracle.get(j);
				  	stPost.setLong(i++, personita.getCodigo());
				  	stPost.setInt(i++, personita.getFacultad());
				  	stPost.setLong(i++, personita.getProyCurr());
				  	stPost.setLong(i++, personita.getEstado());
				  	stPost.setLong(i++, personita.getPerfil());
				  	stPost.setLong(i++, personita.getTipoDoc());
				  	stPost.setString(i++, personita.getContrasena());
				  	stPost.setLong(i++, personita.getDocumento());
				  	stPost.setString(i++, personita.getProceDocumento());
				  	stPost.setString(i++, personita.getNombres());
				  	stPost.setString(i++, personita.getApellidos());
				  	stPost.setString(i++, personita.getTelefono());
				  	stPost.setString(i++, personita.getCelular());
				  	stPost.setString(i++, personita.getMailInstitucional());
				  	stPost.setString(i++, personita.getMailPersonal());
				  	stPost.setDate(i++, personita.getFechaNacimiento());
				  	stPost.setDate(i++, personita.getFechaIngreso());
				  	stPost.setDate(i++, personita.getFechaSalida());
				  	stPost.setInt(i++, personita.getGenero());

					if((j % 250)==0 || j==(listaOracle.size()-1)){
						stPost.addBatch();
						stPost.executeBatch();
						System.out.print(j+" - "+(j % 250)+" ");
						System.out.println(personita.getNombres()+" "+personita.getApellidos());
					}else{
						stPost.addBatch();
					}
				}
			  stPost.executeBatch();
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace() ;
				System.out.println("--"+e.getNextException());
			}
			catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

			}finally{
				try {
					stPost.close();
					cn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
	  }


	  public static void modificacion(){
		  int i=1;
		  Connection cn=null;
		PreparedStatement stPost=null;
		PersonitaCondor personita=null;
		try {
				Class.forName("org.postgresql.Driver");

				cn=DriverManager.getConnection("jdbc:postgresql://localhost:5432/siciud3", "postgres", "metisj2ee");

			  stPost = cn.prepareStatement("update personas set pccodcarnet=?,pcidfacultad=?,pcidproycurricular=?," +
			  		"pcidestado=?,pcidperfilud=?,pctipodoc=?,pcclave=?,pcdocumento=?,pcprocedoc=?,pcnombres=?,pcapellidos=?,pctelfijo=?," +
			  		"pctelcel=?,pcmailinstitucional=?,pcmailpersonal=?,pcfecnacimiento=?,pcfechaingreso=?,pcfechasalida=?,pcidgenero=? " +
			  		"where pcdocumento=?");
			  for(int j=0;j<listaOracle.size();j++){
				  	i=1;
				  	personita=(PersonitaCondor)listaOracle.get(j);
				  	stPost.setLong(i++, personita.getCodigo());
				  	stPost.setInt(i++, personita.getFacultad());
				  	stPost.setLong(i++, personita.getProyCurr());
				  	stPost.setLong(i++, personita.getEstado());
				  	stPost.setLong(i++, personita.getPerfil());
				  	stPost.setLong(i++, personita.getTipoDoc());
				  	stPost.setString(i++, personita.getContrasena());
				  	stPost.setLong(i++, personita.getDocumento());
				  	stPost.setString(i++, personita.getProceDocumento());
				  	stPost.setString(i++, personita.getNombres());
				  	stPost.setString(i++, personita.getApellidos());
				  	stPost.setString(i++, personita.getTelefono());
				  	stPost.setString(i++, personita.getCelular());
				  	stPost.setString(i++, personita.getMailInstitucional());
				  	stPost.setString(i++, personita.getMailPersonal());
				  	stPost.setDate(i++, personita.getFechaNacimiento());
				  	stPost.setDate(i++, personita.getFechaIngreso());
				  	stPost.setDate(i++, personita.getFechaSalida());
				  	stPost.setInt(i++, personita.getGenero());
				  	stPost.setLong(i++, personita.getDocumento());
					if((j % 250)==0 || j==(listaOracle.size()-1)){
						stPost.addBatch();
						stPost.executeBatch();
						System.out.print(j+" - "+(j % 250)+" ");
						System.out.println(personita.getNombres()+" "+personita.getApellidos());
					}else{
						stPost.addBatch();
					}
				}
			  stPost.executeBatch();
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace() ;
				System.out.println("--"+e.getNextException());
			}
			catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

			}finally{
				try {
					stPost.close();
					cn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
	  }
}
