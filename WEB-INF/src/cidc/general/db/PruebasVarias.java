package cidc.general.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PruebasVarias extends BaseDB{

	static PersonitaCondor p=null;
	static PersonitaCondor q=null;

	public PruebasVarias(CursorDB c, int p) {
		super(c, p);
		// TODO Auto-generated constructor stub
	}

	public boolean insertar(List lista) {
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement("insert into xx (aa)values(?)");
			for(i=0;i<lista.size();i++){
				ps.setString(1,""+lista.get(i));
				if((i % 250)==0 || i==(lista.size()-1)){
					ps.addBatch();
					ps.executeBatch();
					System.out.print(i+" - "+(i % 250)+" ");
					System.out.println(lista.get(i));
				}else{
					ps.addBatch();
				}
			}

			retorno=true;
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(ps);
			cerrar(cn);
		}
		return retorno;
	}


	public boolean actualizar(List lista) {
		boolean retorno=false;
		Connection cn=null;
		PreparedStatement ps=null;
		int i=1;
		try {
			cn=cursor.getConnection(super.perfil);
			ps=cn.prepareStatement("update xx set aa=? where aa=?");
			for(i=0;i<lista.size();i++){

				ps.setString(1,""+lista.get(i)+"..."+i);
				ps.setString(2,""+lista.get(i));

				if((i % 250)==0 || i==(lista.size()-1)){
					ps.addBatch();
					ps.executeBatch();
					System.out.print(i+" - "+(i % 250)+" ");
					System.out.println(lista.get(i));
				}else{
					ps.addBatch();
				}
			}

			retorno=true;
		}catch (SQLException e) {
			lanzaExcepcion(e);
		}catch (Exception e) {
			lanzaExcepcion(e);
		}finally{
			cerrar(ps);
			cerrar(cn);
		}
		return retorno;
	}




	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List lista=new ArrayList();

		p=new PersonitaCondor();
		q=new PersonitaCondor();

		p.setApellidos("angel");
		q.setApellidos("angel");

		if(p.equals(q))
			System.out.println("Encontrado como iguanitico");
		else
			System.out.println("Encontrado como distintos ");

	/*	for(int i=1;i<=128885;i++){
			lista.add(""+i);
		}
		System.out.println("Inicio: "+new java.util.Date());
		System.out.println("Insertar ----"+lista.size());
*/

		CursorDB cursor=new CursorDB();
		PruebasVarias p=new PruebasVarias(cursor,2);
	//	p.insertar(lista);
	//	p.actualizar(lista);
		System.out.println("Inicio: "+new java.util.Date());
	}

}
