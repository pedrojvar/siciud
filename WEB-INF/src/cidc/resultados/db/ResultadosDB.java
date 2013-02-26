package cidc.resultados.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;
import cidc.resultados.obj.DatosMovilidad;
import cidc.resultados.obj.ListaPropuesta;
import cidc.general.db.BaseDB;
import cidc.general.db.CursorDB;


public class ResultadosDB extends BaseDB {

	public static char sep=java.io.File.separatorChar;

	public ResultadosDB(CursorDB c, int perfil) {
		super(c, perfil);
		rb=ResourceBundle.getBundle("cidc.resultados.consultas");
	}

	/*public List getListaProyectos(String conv, String corte){
		List lista=new ArrayList();
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		Proyecto datos=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("resultConvCorte"));
			System.out.println("fac="+conv);
			System.out.println("pro="+corte);

	//		ps.setString(i++,filtro.getTipo());
	//		ps.setString(i++,filtro.getFacultad());

			rs=ps.executeQuery();
			i=1;
			while(rs.next()){
				i=1;
				datos=new Proyecto();
				datos.setId(rs.getString(i++));
				datos.setCodigo(rs.getString(i++));
				datos.setDirector(rs.getString(i++));
				datos.setProyecto(rs.getString(i++));
				lista.add(datos);
	//			System.out.println("A?ade pro");
			}
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return lista;
	}*/

	public DatosMovilidad getDatosMovilidad(String id,String datoFalg){
		DatosMovilidad datos=null;
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		int i=1, variable=0;;
		String fecha="";
		
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getDatosMovilidad"));
			ps.setLong(i++,Long.parseLong(id));
			rs=ps.executeQuery();
			double a=0, b=0, c=0, d=0, e=0, f=0;
			while(rs.next()){
				i=1;
				datos=new DatosMovilidad();
				datos.setNombrePonente(rs.getString(i++));
				datos.setNombrePonencia(rs.getString(i++));
				datos.setFechaEventoInicio(rs.getString(i++));
				datos.setFechaEventoFin(rs.getString(i++));
				datos.setGrupoInvestigacion(rs.getString(i++));
				datos.setEvento(rs.getString(i++));
				datos.setOrganizadorEvento(rs.getString(i++));
				datos.setPais(rs.getString(i++));
				datos.setArchivo(rs.getString(i++));
				datos.setObservaciones(rs.getString(i++));
				fecha=rs.getString(i++);
				fecha= fecha.substring(0,4);
				variable= Integer.parseInt(fecha);
				System.out.println("Fecha"+ variable);

			//	System.out.println("-->"+datos.getObservaciones());
				if(variable<2012){
					System.out.println("Fecha menor -->"+ variable);
					a=calculoFacultad(Long.parseLong(id), 3414);//3414 967
					b=calculoFacultad(Long.parseLong(id), 3415);//3414 968
					c=calculoFacultad(Long.parseLong(id), 3416);//3414 969
					d=calculoFacultad(Long.parseLong(id), 3417);//3414 970
					e=calculoFacultad(Long.parseLong(id), 3418);//3414 971
					f=calculoFacultad(Long.parseLong(id), 3419);//3414 972
				}
				else {
					System.out.println("Fecha mayor -->"+ variable);
					a=calculoFacultad2(Long.parseLong(id), 3414);//3414 967
					b=calculoFacultad2(Long.parseLong(id), 3415);//3414 968
					c=calculoFacultad2(Long.parseLong(id), 3416);//3414 969
					d=calculoFacultad2(Long.parseLong(id), 3417);//3414 970
					e=calculoFacultad2(Long.parseLong(id), 3418);//3414 971
					f=calculoFacultad2(Long.parseLong(id), 3419);//3414 972
				}

				int cont=0;
				if(a>0)
					cont++;
				if(b>0)
					cont++;
				if(c>0)
					cont++;
				if(d>0)
					cont++;
				if(e>0)
					cont++;
				if(f>0)
					cont++;


				datos.setPuntaje(""+((a+b+c+d+e+f)/cont));
			//	System.out.println("valor de suma="+datos.getPuntaje());
				if(datoFalg!=null){
					if(datoFalg.equals("0"))
						datos.setObservaciones("Propuesta registrada dos veces");
					else{
						if(datoFalg.equals("1"))
							datos.setObservaciones("El comit? de investigaciones informa al investigador(a) que esta propuesta ha sido aprobada satisfactoriamente, favor acercarse al Centro de Investigaciones para hacer los respectivos tr?mites ");
						else
							datos.setObservaciones("El comit? de investigaciones informa al investigador(a) que esta propuesta ser? tenida en cuenta solamente hasta el segundo corte de la convocatoria ya que la fecha del evento no aplica para este primer corte");
					}
				}
			}
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return datos;
	}

	public double calculoFacultad(long prop, long eval){
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		float []criB=new float[9];
		double crA=0,crB=0,crC=0,total=0;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getValor2"));
			ps.setLong(1, 1);
			ps.setLong(2, prop);
			ps.setLong(3, eval);
		//	System.out.println("");
			rs=ps.executeQuery();
			int a=0;
			while (rs.next()) {
				crA=rs.getInt(1);
			}

			ps=cn.prepareStatement(rb.getString("getValor2"));
			ps.setLong(1, 3);
			ps.setLong(2, prop);
			ps.setLong(3, eval);
			rs=ps.executeQuery();

			while (rs.next()) {
				crC=rs.getInt(1);
			}

			ps=cn.prepareStatement(rb.getString("getValor1"));
			ps.setLong(1, 2);
			ps.setLong(2, prop);
			ps.setLong(3, eval);
			rs=ps.executeQuery();
			a=0;
			while (rs.next()) {
				criB[a]=rs.getFloat(1);
				if(criB[a]!=0)
					a++;
			}

			crB=(criB[0]+criB[1])*0.25;
			crB=crB+(criB[2]+criB[3]+criB[4])*0.3;
			crB=crB+(criB[5]+criB[6]+criB[7]+criB[8])*0.45;

			total=(crA*0.5)+(crB*0.25)+(crC*0.25);

		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return total;
	}

	public double calculoFacultad2(long prop, long eval){
        Connection cn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        double total=0;
        try {
            cn=cursor.getConnection(super.perfil);
            ps=cn.prepareStatement(rb.getString("getValores"));
            ps.setLong(1, prop);
            ps.setLong(2, eval);
            rs=ps.executeQuery();
            while (rs.next()) {
                total=rs.getDouble(1);
            }
        }catch (SQLException e) {
            lanzaExcepcion(e);
        }catch (Exception e) {
            lanzaExcepcion(e);
        }finally{
            cerrar(rs);
            cerrar(ps);
            cerrar(cn);
        }
        System.out.println("retorno======>"+total);
        return total;
    }

	
	public DatosMovilidad getPonenciaMovilidad(String id) {
		DatosMovilidad datos=null;
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int i=1, variable=0;;
		String fecha="";
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getDatosMovilidad"));
			ps.setLong(i++,Long.parseLong(id));
			rs=ps.executeQuery();
			double a=0, b=0, c=0, d=0, e=0, f=0;
			i=1;
			while(rs.next()){
				i=1;
				datos=new DatosMovilidad();
				datos.setNombrePonente(rs.getString(i++));
				datos.setNombrePonencia(rs.getString(i++));
				datos.setFechaEventoInicio(rs.getString(i++));
				datos.setFechaEventoFin(rs.getString(i++));
				datos.setGrupoInvestigacion(rs.getString(i++));
				datos.setEvento(rs.getString(i++));
				datos.setOrganizadorEvento(rs.getString(i++));
				datos.setPais(rs.getString(i++));
				datos.setArchivo(rs.getString(i++));
				datos.setObservaciones(rs.getString(i++));
				fecha=rs.getString(i++);
				fecha= fecha.substring(0,4);
				variable= Integer.parseInt(fecha);
				System.out.println("Fecha=====->"+ variable);

				if(variable<2012){
					System.out.println("Fecha menor -->"+ variable);
					a=calculoFacultad(Long.parseLong(id), 3414);//3414 967
					b=calculoFacultad(Long.parseLong(id), 3415);//3414 968
					c=calculoFacultad(Long.parseLong(id), 3416);//3414 969
					d=calculoFacultad(Long.parseLong(id), 3417);//3414 970
					e=calculoFacultad(Long.parseLong(id), 3418);//3414 971
					f=calculoFacultad(Long.parseLong(id), 3419);//3414 972
				}
				else {
					System.out.println("Fecha mayor -->"+ variable);
					a=calculoFacultad2(Long.parseLong(id), 3414);//3414 967
					b=calculoFacultad2(Long.parseLong(id), 3415);//3414 968
					c=calculoFacultad2(Long.parseLong(id), 3416);//3414 969
					d=calculoFacultad2(Long.parseLong(id), 3417);//3414 970
					e=calculoFacultad2(Long.parseLong(id), 3418);//3414 971
					f=calculoFacultad2(Long.parseLong(id), 3419);//3414 972
				}

				int cont=0;

				if(a>0)
					cont++;
				if(b>0)
					cont++;
				if(c>0)
					cont++;
				if(d>0)
					cont++;
				if(e>0)
					cont++;
				if(f>0)
					cont++;

				datos.setPuntaje(""+((a+b+c+d+e+f)/cont));
				System.out.println("---->Puntaje de la persona=="+datos.getPuntaje());
			}
		}		
		catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		System.out.println("Puntaje de la persona=="+datos.getPuntaje());
		return datos;
	}


	public List getListaMovilidad(String id,String ano,String conv) {
		ListaPropuesta datos=null;
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List lista=new ArrayList();
		System.out.println("Entro al metodo getListaMovilidad------");
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			System.out.println("Año " +ano);
			if(ano.equals("2010")||ano.equals("2011")||ano.equals("2012")||ano.equals("2013"))
				ps=cn.prepareStatement(rb.getString("getListaMovilidad"+ano+"-"+conv));
			else
				ps=cn.prepareStatement(rb.getString("getListaMovilidad"));
			ps.setLong(i++,Long.parseLong(id));
			ps.setString(i++,"%"+ano+"%");
			System.out.println("Consulta " +ps);
			rs=ps.executeQuery();

			i=1;
			while(rs.next()){
				i=1;
				datos=new ListaPropuesta();
				datos.setIdPropuesta(rs.getLong(i++));
				datos.setNombreInvestigador(rs.getString(i++));
				datos.setNombrePropuesta(rs.getString(i++));
				lista.add(datos);
			}
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return lista;
	}

	public List getListaConvoctoriaCIDC(String id, String ano) {
		ListaPropuesta datos=null;
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List lista=new ArrayList();

		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement(rb.getString("getListaConvCIDC"));
			ps.setInt(i++,Integer.parseInt(ano));
			ps.setInt(i++,Integer.parseInt(id));
			rs=ps.executeQuery();
			i=1;
			while(rs.next()){
				i=1;
				datos=new ListaPropuesta();
				datos.setIdPropuesta(rs.getLong(i++));
				datos.setNombreInvestigador(rs.getString(i++));
				datos.setNombrePropuesta(rs.getString(i++));
				datos.setEstado(rs.getInt(i++));
				lista.add(datos);
			}
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(rs);
			cerrar(ps);
			cerrar(cn);
		}
		return lista;
	}


}
