package cidc.general.obj;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.Mac;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;

import sun.misc.BASE64Encoder;

public class CrearClaves1 {
	String Algoritmo="DES";
	SecretKey clave;


	public CrearClaves1(){
		KeyGenerator kg=null;
		try {
			kg = KeyGenerator.getInstance(Algoritmo);
			clave=kg.generateKey();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String encriptar(String cadena) {
		try {
			//pasamos la cosa esta a bytes para usarlos en la encriptación
			byte[] cadenaByte= cadena.getBytes("UTF8");
			//hay que crear un obj de tipo Cifer para decirle cual es el algoritmo de encriptación
			Cipher cifrar= Cipher.getInstance(Algoritmo);
			cifrar.init(Cipher.ENCRYPT_MODE, clave);
			byte[] enc = cifrar.doFinal(cadenaByte);
			// se crea un obj de tipo BASE64Encoder para almacenar la codificacion
			BASE64Encoder codificado= new sun.misc.BASE64Encoder();
			return codificado.encode(enc);
		} catch (javax.crypto.BadPaddingException e) {e.printStackTrace();
		} catch (IllegalBlockSizeException e) {e.printStackTrace();
		} catch (UnsupportedEncodingException e) {e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {e.printStackTrace();
		} catch (NoSuchPaddingException e) {e.printStackTrace();
		} catch (InvalidKeyException e) {e.printStackTrace();
		}
		return null;
	}
	public String desencriptar(String str) {
	try {
	//	System.out.println("La cadena a desencriptar es: "+str);
		// se crea un array de bytes a partir de el strign codificado
		byte[] dec = new sun.misc.BASE64Decoder().decodeBuffer(str);
		//creamos un obj Cifer para indicar el tipo de algoritmo a usar
		Cipher descifrar= Cipher.getInstance(Algoritmo);
		descifrar.init(Cipher.DECRYPT_MODE, clave);
		byte[] cadenaByte= descifrar.doFinal(dec);

		// Volvemos a pasarlo a cadena.
		String resultado=new String(cadenaByte, "UTF8");
		return resultado;
		} catch (javax.crypto.BadPaddingException e){e.printStackTrace();
		} catch (IllegalBlockSizeException e){e.printStackTrace();
		} catch (UnsupportedEncodingException e){e.printStackTrace();
		} catch (java.io.IOException e){e.printStackTrace();
		} catch (NoSuchAlgorithmException e){e.printStackTrace();
		} catch (NoSuchPaddingException e) {e.printStackTrace();
		} catch (InvalidKeyException e){e.printStackTrace();
		}
		return null;
	}
}
