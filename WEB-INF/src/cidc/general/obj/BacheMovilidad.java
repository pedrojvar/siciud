package cidc.general.obj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;

import cidc.general.db.BaseDB;
import cidc.general.db.CursorDB;

public class BacheMovilidad extends BaseDB{

	public BacheMovilidad(CursorDB c, int p) {
		super(c, p);
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param args
	 */
	
	public List listaGeneral=new ArrayList<ItemsMovilidad>(); 
	
	public void listaDatoGrupos(){
		Connection cn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		ItemsMovilidad it=null;
		int i=1;
		try {
			cn=cursor.getConnection(2);
			ps=cn.prepareStatement("select mid,midpersona,binvidgrupoinv from movilidad,b_investigadores  where midpersona=binvidper order by mid");
			rs=ps.executeQuery();
			while(rs.next()){
				i=1;
				it=new ItemsMovilidad();
				it.setIdMovilidad(rs.getInt(i++));
				it.setIdPersona(rs.getInt(i++));
				it.setIdGrupo(rs.getInt(i++));
				listaGeneral.add(it);
				System.out.println("---idMov-->"+it.getIdMovilidad()+"---idPer-->"+it.getIdPersona()+"---idGrupo-->"+it.getIdGrupo());
			}
			listaDatoGrupos(listaGeneral);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void listaDatoGrupos(List lista){
		Connection cn=null;
		PreparedStatement ps=null;
		int j=1;
		ItemsMovilidad it=null;
		System.out.println("------------------------------------------------------------->");
		try {
			cn=cursor.getConnection(2);
			ps=cn.prepareStatement("update movilidad set mgrupo=? where mid=?");

			for(int i=0;i<lista.size();i++){
				j=1;
				it=(ItemsMovilidad)lista.get(i);
				ps.setInt(j++, it.getIdGrupo());
				ps.setInt(j++, it.getIdMovilidad());
				System.out.println("---idMov-->"+it.getIdMovilidad()+"---idPer-->"+it.getIdPersona()+"---idGrupo-->"+it.getIdGrupo());
				ps.addBatch();
			}
			System.out.println("---total modificados-->"+ps.executeBatch());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		CursorDB c=new CursorDB();
		BacheMovilidad bm=new BacheMovilidad(c,2);
		bm.listaDatoGrupos();
	}
	
	public class ItemsMovilidad{
		int idMovilidad;
		int idPersona;
		int idGrupo;
		public int getIdMovilidad() {
			return idMovilidad;
		}
		public void setIdMovilidad(int idMovilidad) {
			this.idMovilidad = idMovilidad;
		}
		public int getIdPersona() {
			return idPersona;
		}
		public void setIdPersona(int idPersona) {
			this.idPersona = idPersona;
		}
		public int getIdGrupo() {
			return idGrupo;
		}
		public void setIdGrupo(int idGrupo) {
			this.idGrupo = idGrupo;
		}
		
		
	}

}
