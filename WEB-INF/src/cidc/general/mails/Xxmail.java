package cidc.general.mails;

import java.util.ResourceBundle;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

public class Xxmail {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ResourceBundle rb=ResourceBundle.getBundle("cidc.general.mails.correoInscripcion");
		EnvioMail2 envioMail=new EnvioMail2("general");
		String []dir={"oskr_javier@yahoo.com.mx","oskrjavier@hotmail.es","oskrjavier@gmail.com"};//"oskrjavier@hotmail.es,oskr_javier@yahoo.com.mx","oskrjavier@gmail.com"};
		StringBuffer texto=new StringBuffer();

		texto.append(rb.getString("i1"));
		texto.append("Bruno Díaz");
		texto.append(rb.getString("i2"));
		texto.append("Propuesta de investigación cualquiera");
		texto.append(rb.getString("i3"));
		texto.append("1691");
		texto.append(rb.getString("i4"));


		texto.append(rb.getString("t1"));
		texto.append("------------------------------------------");
		texto.append(rb.getString("t2"));
		texto.append("------------------------------------------");
		texto.append(rb.getString("tdd"));
		texto.append("------------------------------------------");
		texto.append(rb.getString("t3"));
		texto.append("------------------------------------------");
		texto.append(rb.getString("t4"));
		texto.append("------------------------------------------");
		texto.append(rb.getString("t5"));
		texto.append("------------------------------------------");
		texto.append(rb.getString("t6"));
		texto.append("------------------------------------------");
		texto.append(rb.getString("t7"));
		for(int i=0;i<3;i++){
			texto.append(rb.getString("trd"));
			texto.append("---------------------");
			texto.append(rb.getString("tdd"));
			texto.append("---------------------");
			texto.append(rb.getString("tdd"));
			texto.append("---------------------");
			texto.append(rb.getString("tdd"));
			texto.append("---------------------");
			texto.append(rb.getString("td"));
		}
		texto.append(rb.getString("trtab"));
		texto.append(rb.getString("br"));
		texto.append(rb.getString("t8"));
		for(int j=0;j<4;j++){
			texto.append(rb.getString("trd"));
			texto.append("-------");
			texto.append(rb.getString("tdd"));
			texto.append("-------");
			texto.append(rb.getString("tdd"));
			texto.append("-------");
			texto.append(rb.getString("tdd"));
			texto.append("-------");
			texto.append(rb.getString("td"));
		}
		texto.append(rb.getString("trtab"));
		texto.append(rb.getString("br"));
		texto.append(rb.getString("t9"));
		for(int k=0;k<10;k++){
			texto.append(rb.getString("trd"));
			texto.append(k);
			texto.append(rb.getString("tdd"));
			texto.append("-------");
			texto.append(rb.getString("tdd"));
			texto.append("-------");
			texto.append(rb.getString("tdd"));
			texto.append("si/no");
			texto.append(rb.getString("td"));
		}
		texto.append(rb.getString("trtab"));

		texto.append(rb.getString("i5"));

		try {
			envioMail.enviar(dir,"Prueba Mail",""+texto);
			System.out.println("enviado");
		} catch (AddressException e){
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e){
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
